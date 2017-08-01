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
logger.setLevel(logging.INFO)

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
    except:
        logger.error("ERROR: Could not connect to MySql instance.")
        sys.exit()

    logger.info("Connected to RDS mysql instance.")


#
# 2. parse the input parameters from the https request body
#    which is passed to this Lambda function from a AWS API Gateway method object
#
    account_name = event['path']['accountName']

#
# 3. create the SQL string
#
    sql = "CALL cea.sp_users_get('" + account_name + "')"

#
# 4. execute the SQL string
#
    logger.info('SQL statement: ' + sql)
    cursor =  conn.cursor()
    cursor.execute(sql)
    #logger.info('SQL response: ' + str(cursor.description))

#
# 5a. format the recordset returned as a JSON string
#

    #note: there will only be one record in this recorset.
    rs = cursor.fetchall()
    for record in rs:
        candidate = {
            "candidate_id" : record[0],
            "account_name" : record[1],
            "first_name" : record[2],
            "middle_name" : record[3],
            "last_name" : record[4],
            "email" : record[5],
            "phone_number" : record[6],
            "industry_id" : str(record[7]),
            "subindustry_id" : str(record[8]),
            "profession_id" : str(record[9]),
            "subprofession_id" : str(record[10]),
            "create_date" : str(record[11]),
            "update_date" : str(record[12])
        }

    cursor.close ()
    conn.close ()

#
# 5b. return the JSON string to the AWS API Gateway method that called this lambda function.
#     the API Gateway method will push this JSON string in the http response body
#
    logger.info('JSON returned is: ' + json.dumps(candidate))
    return candidate
