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
    This function handles mySQL CRUD for CEA data element Professions.
    Receives a CRUD instruction from the event body "lambda" parameter value.
    Returns a Professions recordset in all cases.

    Sample REST api event body
    ===========================
    {
      "body": {},
      "params": {
        "path": {
          "parentId": "1"
        },
        "querystring": {},
        "header": {}
      },
      "lambda": "select"
    }

    lambda parameter values: select
    """
    retval = {}
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
        return e

    logger.info("Connected to RDS mysql instance.")


    #
    # 2. parse the input parameters from the https request body
    #    which is passed to this Lambda function from a AWS API Gateway method object
    #
    command = event['lambda']
    try:
        id = event['params']['path']['parentId']
    except Exception as e:
        logger.info("No path ID included")
        id = -1

    #
    # 3. create the SQL string
    #
    if id < 0:
        #Generic api calls. not specific to an element id.
        if command == "select":
            sql = "CALL cea.sp_professions_get(null)"

    else:
        if command == "select":
            sql = "CALL cea.sp_professions_get('%s')" % (id)


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
        return e

#
# 5a. format the recordset returned as a JSON string
#

    #note: there will only be one record in this recorset.
    rs = cursor.fetchall()

    retval = []
    for record in rs:
        obj = {
            "id" : record[0],
            "description" : str(record[1])
        }
        retval.append(obj)

    cursor.close ()
    conn.close ()

#
# 5b. return the JSON string to the AWS API Gateway method that called this lambda function.
#     the API Gateway method will push this JSON string in the http response body
#
    logger.info('JSON returned is: ' + json.dumps(retval))
    return retval
