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
def lambda_handler(event, context):
    """
    This function inserts content into mysql RDS instance
    """
    logger.info('JSON received is:' + str(event))

#
# 2. parse the input parameters from the https request body
#    which is passed to this Lambda function from a AWS API Gateway method object
#
    account_name = event['account_name']
    first_name = event['first_name']
    middle_name = event['middle_name']
    last_name = event['last_name']
    email = event['email']
    phone_number = event['phone_number']
    industry_id = event['industry_id']
    subindustry_id = event['subindustry_id']
    profession_id = event['profession_id']
    subprofession_id = event['subprofession_id']

#
# 3. create the SQL string
#
    sql = "CALL sp_users_add('" + account_name + "', "
    sql = sql + "'" + first_name + "', "
    sql = sql + "'" + middle_name + "', "
    sql = sql + "'" + last_name + "', "
    sql = sql + "'" + email + "', "
    sql = sql + "'" + phone_number + "', "
    sql = sql + "'" + str(industry_id) + "', "
    sql = sql + "'" + str(subindustry_id) + "', "
    sql = sql + "'" + str(profession_id) + "', "
    sql = sql + "'" + str(subprofession_id) + "')"

#
# 4. execute the SQL string
#

    cursor =  conn.cursor()
    cursor.execute(sql)

    #rs = cursor.fetchall()
    #rs_result = ""
    #for row in rs :
    #    rs_result = rs_result + str(row)

#
# 5a. format the recordset returned as a JSON string
#
    #rs_result = json.dumps( dict(result=[dict(r) for r in cursor.fetchall()]))
    rs_result = json.dumps(cursor.fetchall())

    cursor.close ()
    conn.close ()

#
# 5b. return the JSON string to the AWS API Gateway method that called this lambda function.
#     the API Gateway method will push this JSON string in the http response body
#
    logger.info('JSON returned is:' + rs_result)
    return rs_result
