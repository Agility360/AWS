#!/bin/sh
aws rds create-db-instance \
    --db-instance-identifier "MyLambdaTest" \
    --db-instance-class db.t2.micro \
    --engine MySQL \
    --allocated-storage 5 \
    --no-publicly-accessible \
    --db-name afancydbname \
    --master-username "root" \
    --master-user-password "7#&KV88%o3%9i" \
    --backup-retention-period 3
