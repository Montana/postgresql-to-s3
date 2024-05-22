#!/bin/bash
DB_HOST="your_host"
DB_PORT="your_port"
DB_NAME="your_database"
DB_USER="your_username"
DB_PASSWORD="your_password"
S3_BUCKET="your-bucket-name"
S3_KEY="path/to/export.csv"
QUERY="SELECT * FROM your_table"
psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "\copy ($QUERY) to '/tmp/export.csv' with csv header"
aws s3 cp /tmp/export.csv s3://$S3_BUCKET/$S3_KEY
echo "Data exported from PostgreSQL and uploaded to S3 successfully."
