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
    This function handles mySQL CRUD for CEA data element Certifications.
    Receives a CRUD instruction from the event body "lambda" parameter value.
    Returns a JobHistory recordset in all cases.

    Sample REST api event body
    ===========================
    {
      "body": {
              "account_name": "mcdaniel",
              "id": 50,
              "candidate_id": 6,
              "institution_name": "Big School",
              "certification_name": "Big Cert",
              "date_received": "string",
              "expire_date": "None",
              "create_date": "2017-09-01 20:37:42"
        },
      "params": {
        "path": {
          "accountName": "mcdaniel",
          "id": 67
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
        if command == "select":
            sql = "CALL cea.sp_candidate_certifications_get('%s')" % (account_name)

        if command == "insert":
            sql = "CALL cea.sp_candidate_certification_add('%s', '%s', '%s', '%s', '%s')" % (
                                            event['body']['account_name'],
                                            event['body']['institution_name'],
                                            event['body']['certification_name'],
                                            event['body']['date_received'],
                                            event['body']['expire_date'])

        if command == "inserted":
            sql = "CALL cea.sp_candidate_certifications_inserted('%s')" % (account_name)

    else:
        if command == "select":
            sql = "CALL cea.sp_candidate_certifications_getid('%s', '%s')" % (account_name, id)

        if command == "inserted":
            sql = "CALL cea.sp_candidate_certifications_inserted('%s')" % (account_name)

        if command == "update":
            sql = "CALL cea.sp_candidate_certification_edit(%d, '%s', '%s', '%s', '%s', '%s')" % (
                                            int(event['body']['id']),
                                            event['body']['account_name'],
                                            event['body']['institution_name'],
                                            event['body']['certification_name'],
                                            event['body']['date_received'],
                                            event['body']['expire_date'])
        if command == "delete":
            sql = "CALL cea.sp_candidate_certification_delete('%s', '%s')" % (account_name, id)



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

    retval = []
    for record in rs:
        obj = {
            "account_name" : record[0],
            "id" : record[1],
            "candidate_id" : str(record[2]),
            "institution_name" : str(record[3]),
            "certification_name" : str(record[4]),
            "date_received" : str(record[5]),
            "expire_date" : str(record[6]),
            "create_date" : str(record[7])
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
