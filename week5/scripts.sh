#!/bin/bash

#SNS
aws sns publish --topic arn:aws:sns:us-west-2:212801393077:sns --message 'SNS publish' --region us-west-2

#SQS
aws sqs send-message --queue-url https://sqs.us-west-2.amazonaws.com/212801393077/sqs --message-body 'SQS body' --region us-west-2
aws sqs receive-message --queue-url https://sqs.us-west-2.amazonaws.com/212801393077/sqs --region us-west-2