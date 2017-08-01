import sys
import logging
import rds_config
import pymysql
import json

rds_host  = rds_config.db_endpoint
name = rds_config.db_username
password = rds_config.db_password
db_name = rds_config.db_name

logger = logging.getLogger()
logger.setLevel(logging.INFO)

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
    print('the json sent from our REST api is:')
    print(event)

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

    cursor =  conn.cursor()
    cursor.execute(sql)
    rs = cursor.fetchall()

    rs_result = ""

    # print the rows
    for row in rs :
        rs_result = rs_result + str(row)

    cursor.close ()
    conn.close ()

    return rs_result
