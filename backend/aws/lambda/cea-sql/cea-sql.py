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

    sql = "CALL sp_%s" %(event['entity']) + "('" + str(event['json']).replace("u'", '"').replace("'", '"') + "')"
    cursor =  conn.cursor()
    cursor.execute(sql)
    rs = cursor.fetchall()

    rs_result = ""
    for row in rs :
        rs_result = rs_result + str(row)

    cursor.close ()
    conn.close ()

    return rs_result
