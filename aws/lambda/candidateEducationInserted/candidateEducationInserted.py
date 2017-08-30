#=============================================================
# written by: lawrence mcdaniel
# date: 31-july-2017
#
# purpose:  connection handler for Candidate Engagement App (CEA)
#           REST api. this function does the following:
#           1. connects to MySQL,
#           2. parses input parameters from the http request body,
#           3. formats and SQL string of the stored procedure call,
#           4. executes the stored procedure
#           5. formats and returns the recordset returned by the stored procedure as a JSON string
#=============================================================
import sys
import logging
import rds_config
import pymysql
import json

#rds_config is just a json string of the RDS MySQL connection parameters
#stored in a text file with a .py extension
#
#it is included in the build package that i uploaded to created this function
#it is not viewable from the AWS Lambda console
#==============================================================
rds_host  = rds_config.db_endpoint
name = rds_config.db_username
password = rds_config.db_password
db_name = rds_config.db_name

logger = logging.getLogger()
logger.setLevel(logging.ERROR)

def lambda_handler(event, context):
    """
    This function inserts content into mysql RDS instance
    """
    logger.info('JSON received: ' + str(event))

    #
    # 1. connect to the MySQL database
    #
    try:
        conn = pymysql.connect(rds_host, user=name,
                               passwd=password, db=db_name, connect_timeout=2)
    except Exception as e:
        logger.error("ERROR: Could not connect to MySql instance.")
        logger.error(e)
        #sys.exit()
        retval["response"] = "failure"
        retval["err"] = str(e)
        return retval

    logger.info("Connected to RDS mysql instance.")


    #
    # 2. parse the input parameters from the https request body
    #    which is passed to this Lambda function from a AWS API Gateway method object
    #
    account_name = event['path']['accountName']

    #
    # 3. create the SQL string
    #
    sql = "CALL cea.sp_candidate_education_inserted('%s')" % (account_name)

    #
    # 4. execute the SQL string
    #
    try:
        logger.info("Executing SQL statement: " + sql)
        cursor =  conn.cursor()
        cursor.execute(sql)
    except Exception as e:
        logger.error("ERROR: MySQL returned an error.")
        logger.error(e)
        retval["response"] = "failure"
        retval["err"] = str(e)
        return retval

#
# 5a. format the recordset returned as a JSON string
#

    #note: there will only be one record in this recorset.
    rs = cursor.fetchall()

    job_history = []
    for record in rs:
        job = {
            "id" : record[0],
            "candidate_id" : str(record[1]),
            "institution_name" : str(record[2]),
            "degree" : str(record[3]),
            "start_date" : str(record[4]),
            "end_date" : str(record[5]),
            "graduated" : str(record[6]),
            "create_date" : str(record[7])
        }
        job_history.append(job)

    cursor.close ()
    conn.close ()

#
# 5b. return the JSON string to the AWS API Gateway method that called this lambda function.
#     the API Gateway method will push this JSON string in the http response body
#
    logger.info('JSON returned is: ' + json.dumps(job_history))
    return job_history
