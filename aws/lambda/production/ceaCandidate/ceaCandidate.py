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
    This function handles mySQL CRUD for CEA data element Candidates.
    Receives a CRUD instruction from the event body "lambda" parameter value.
    Returns a JobHistory recordset in all cases.

    Sample REST api event body
    ===========================
    {
      "body": {
              "phone_number": "(415) 766-9012",
              "subprofession_id": "0",
              "first_name": "Lawrence",
              "last_name": "McDaniel",
              "middle_name": "Philip",
              "job_hunting": "0",
              "update_date": "2017-07-31 20:57:32",
              "industry_id": "0",
              "email": "lpm0073@gmail.com",
              "state": "",
              "profession_id": "0",
              "city": "",
              "candidate_id": 6,
              "create_date": "2017-07-31 20:57:32",
              "subindustry_id": "0",
              "account_name": "mcdaniel"
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

    lambda parameter values: select, insert, inserted, update, delete    """
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
        #sys.exit()
        retval["response"] = "failure"
        retval["err"] = str(e)
        return retval

    logger.info("Connected to RDS mysql instance.")


    #
    # 2. parse the input parameters from the https request body
    #    which is passed to this Lambda function from a AWS API Gateway method object
    #
    command = event['lambda']
    try:
        account_name = event['params']['path']['accountName']
    except Exception as e:
        logger.info("No account name found.")
        account_name = ''


    #
    # 3. create the SQL string
    #
    sql = "CALL cea.sp_candidate_get('" + account_name + "')"
    if command == "select":
        sql = "CALL cea.sp_candidate_get('%s')" % (account_name)

    if command == "insert":
        sql = "CALL cea.sp_candidate_add('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', %s, '%s', '%s')" % (
                    event['body']['account_name'],
                    event['body']['first_name'],
                    event['body']['middle_name'],
                    event['body']['last_name'],
                    event['body']['email'],
                    event['body']['phone_number'],
                    event['body']['industry_id'],
                    event['body']['subindustry_id'],
                    event['body']['profession_id'],
                    event['body']['subprofession_id'],
                    event['body']['job_hunting'],
                    event['body']['city'],
                    event['body']['state'])


    if command == "update":
        sql = "CALL cea.sp_candidate_edit('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')" % (
                    account_name,
                    event['body']['first_name'],
                    event['body']['middle_name'],
                    event['body']['last_name'],
                    event['body']['email'],
                    event['body']['phone_number'],
                    event['body']['industry_id'],
                    event['body']['subindustry_id'],
                    event['body']['profession_id'],
                    event['body']['subprofession_id'],
                    event['body']['job_hunting'],
                    event['body']['city'],
                    event['body']['state'])

    if command == "delete":
        sql = "CALL cea.sp_candidate_delete('%s')" % (account_name)


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
    for record in rs:
        retval = {
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
            "update_date" : str(record[12]),
            "job_hunting": str(record[13]),
            "city":  str(record[14]),
            "state":  str(record[15])
        }

    cursor.close ()
    conn.close ()

    #
    # 5b. return the JSON string to the AWS API Gateway method that called this lambda function.
    #     the API Gateway method will push this JSON string in the http response body
    #
    logger.info('JSON returned is: ' + json.dumps(retval))
    return retval
