#!/bin/bash

aws dynamodb list-tables --region us-west-2

aws dynamodb put-item --table-name "aws-course-products" --item '{ "ProductId": { "N": "1" }, "Value": { "S": "MacBook" } }' --region us-west-2
aws dynamodb put-item --table-name "aws-course-products" --item '{ "ProductId": { "N": "2" }, "Value": { "S": "iPhone" } }' --region us-west-2

aws dynamodb get-item --table-name "aws-course-products" --key '{ "ProductId": { "N": "1" } }' --region us-west-2
aws dynamodb get-item --table-name "aws-course-products" --key '{ "ProductId": { "N": "2" } }' --region us-west-2
