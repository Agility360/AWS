#!/bin/sh
lambda_name="candidateGet"

aws lambda invoke \
    --function-name "${lambda_name}" \
    --region us-east-1 \
    output.txt
