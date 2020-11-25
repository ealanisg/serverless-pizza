#!/bin/sh
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX \
AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
AWS_REGION=us-west-2 \
aws dynamodb create-table \
 --cli-input-json '{"TableName":"service-slug-data-local-target-to-slug","AttributeDefinitions":[{"AttributeName":"id","AttributeType":"S"},{"AttributeName":"target","AttributeType":"S"},{"AttributeName":"type","AttributeType":"S"}],"KeySchema":[{"AttributeName":"id","KeyType":"HASH"}],"BillingMode":"PAY_PER_REQUEST","GlobalSecondaryIndexes":[{"IndexName":"targetIndex","KeySchema":[{"AttributeName":"target","KeyType":"HASH"},{"AttributeName":"type","KeyType":"RANGE"}],"Projection":{"ProjectionType":"KEYS_ONLY"}}]}' \
 --endpoint-url http://dynamodb-local:8000 \
 --region us-west-2
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX \
AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX \
AWS_REGION=us-west-2 \
aws dynamodb create-table \
 --cli-input-json '{"TableName":"service-slug-data-local-slug-to-target","AttributeDefinitions":[{"AttributeName":"id","AttributeType":"S"},{"AttributeName":"target","AttributeType":"S"},{"AttributeName":"type","AttributeType":"S"}],"KeySchema":[{"AttributeName":"id","KeyType":"HASH"}],"BillingMode":"PAY_PER_REQUEST","GlobalSecondaryIndexes":[{"IndexName":"targetIndex","KeySchema":[{"AttributeName":"target","KeyType":"HASH"},{"AttributeName":"type","KeyType":"RANGE"}],"Projection":{"ProjectionType":"KEYS_ONLY"}}]}' \
 --endpoint-url http://dynamodb-local:8000 \
 --region us-west-2
