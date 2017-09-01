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
    This function handles mySQL CRUD for CEA data element JobHistory.
    Receives a CRUD instruction from the event body "lambda" parameter value.
    Returns a JobHistory recordset in all cases.

    Sample REST api event body
    ===========================
    {
      "body": {
              "account_name": "string";
              "id": 0;
              "candidate_id": 0;
              "company_name": "string";
              "department": "string";
              "job_title": "string";
              "start_date": "string";
              "end_date": "string";
              "description": "string";
              "final_salary": 0.00;
              "create_date": "string";
      },
      "params": {
        "path": {
          "accountName": "mcdaniel"
        },
        "querystring": {},
        "header": {}
      },
      "lambda": "insert"
    }

    lambda parameter values: select, insert, inserted, update, delete

    """
    logger.info('JSON received: ' + str(event))
    retval = {}

    #
    # 1. connect to the MySQL database
    #
    try:
        conn = pymysql.connect(rds_host, user=name,
                               passwd=password, db=db_name, connect_timeout=2)
    except Exception as e:
        logger.error("ERROR: Could not connect to MySql instance.")
        logger.error(e)
        retval["response"] = "failure"
        retval["err"] = str(e)
        return retval

    logger.info("Connected to RDS mysql instance.")


    #
    # 2. parse the input parameters from the https request body
    #    which is passed to this Lambda function from a AWS API Gateway method object
    #
    command = event['lambda']
    account_name = event['params']['path']['accountName']
    try:
        id = event['params']['path']['id']
    except Exception as e:
        logger.info("No path ID included")
        id = -1

    #
    # 3. create the SQL string
    #
    if id < 0:
        #Generic api calls. not specific to an element id.
        sql = {
          'select': "CALL cea.sp_candidate_job_history_get('%s')" % (account_name),
          'insert': "CALL sp_candidate_job_history_add('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (
                                            event['body']['account_name'],
                                            event['body']['company_name'],
                                            event['body']['job_title'],
                                            event['body']['start_date'],
                                            event['body']['end_date'],
                                            event['body']['final_salary'],
                                            event['body']['department'],
                                            event['body']['description']),
          'inserted': "CALL cea.sp_candidate_job_history_inserted('%s')" % (account_name)
        }[value](command)
    else:
        sql = {
          'select': "CALL cea.sp_candidate_job_history_getid('%s', %d)" % (account_name, id),
          'inserted': "CALL cea.sp_candidate_job_history_inserted('%s')" % (account_name),
          'update': "CALL sp_candidate_job_history_edit(%d, '%s', '%s', '%s', '%s', '%s', %d, '%s', '%s')" % (
                                            id, account_name,
                                            event['body']['company_name'],
                                            event['body']['job_title'],
                                            event['body']['start_date'],
                                            event['body']['end_date'],
                                            event['body']['final_salary'],
                                            event['body']['department'],
                                            event['body']['description']),
          'delete': "CALL cea.sp_candidate_job_history_delete('%s', %d)" % (account_name, id)
        }[value](command)


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
            "candidate_id" : record[1],
            "company_name" : str(record[2]),
            "job_title" : str(record[3]),
            "start_date" : str(record[4]),
            "end_date" : str(record[5]),
            "final_salary" : record[6],
            "create_date" : str(record[7]),
            "department" : str(record[8]),
            "description": str(record[9])
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
