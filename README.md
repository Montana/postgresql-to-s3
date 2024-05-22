# PostgreSQL to S3 Data Export

This repository provides a bash script that allows you to export data from a PostgreSQL database to a CSV file and upload it to an Amazon S3 bucket using the AWS CLI (Command Line Interface).

## Prerequisites

Before running the script, ensure that you have the following:

- AWS CLI installed and configured with the necessary access keys and permissions to access your S3 bucket.
- PostgreSQL client (`psql`) installed on the machine where you run the script.
- Network connectivity and appropriate security group settings to allow the machine running the script to connect to your PostgreSQL database.

## Flowchart in Mermaid

```bash
+------------------------+
|         Start          |
+------------------------+
            |
            v
+------------------------+
|   Clone the repository |
+------------------------+
            |
            v
+------------------------+
| Navigate to the cloned |
|       repository       |
+------------------------+
            |
            v
+------------------------+
| Open postgresql_to_s3.sh|
|         script         |
+------------------------+
            |
            v
+------------------------+
| Replace placeholders   |
| with actual values     |
+------------------------+
            |
            v
+------------------------+
|  Save the modified     |
|        script          |
+------------------------+
            |
            v
+------------------------+
|  Make the script       |
|      executable        |
+------------------------+
            |
            v
+------------------------+
|    Run the script      |
+------------------------+
            |
            v
+------------------------+
| Data exported and      |
| uploaded successfully? |
+------------------------+
      |           |
     Yes         No
      |           |
      v           v
+------------------------+
| Verify exported file   |
|    in S3 bucket        |
+------------------------+
      |           |
      |           v
      |   +------------------------+
      |   | Troubleshoot and fix   |
      |   |        issues          |
      |   +------------------------+
      |           |
      |           |
      v           v
+------------------------+
|          End           |
+------------------------+
```

## Usage

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Montana/postgresql-to-s3.git
   ```

2. Navigate to the cloned repository:

   ```bash
   cd postgresql-to-s3
   ```

3. Open the `postgresql_to_s3.sh` script in a text editor.

4. Replace the following placeholders in the script with your actual values:
   - `your_host`, `your_port`, `your_database`, `your_username`, `your_password`: PostgreSQL database connection details.
   - `your-bucket-name`: The name of your Amazon S3 bucket.
   - `path/to/export.csv`: The desired key (path and filename) for the exported CSV file in S3.
   - `your_table`: The name of the PostgreSQL table you want to export.

5. Save the modified script.

6. Make the script executable:

   ```bash
   chmod +x postgresql_to_s3.sh
   ```

7. Run the script:

   ```bash
   ./postgresql_to_s3.sh
   ```

   The script will connect to your PostgreSQL database, execute the specified SQL query, export the result to a CSV file, and upload the file to the specified Amazon S3 bucket.

8. Check your Amazon S3 bucket to verify that the exported CSV file has been successfully uploaded.

## Script Explanation

The `postgresql_to_s3.sh` script performs the following steps:

1. Sets the PostgreSQL database connection details and Amazon S3 bucket information as variables.

2. Defines the SQL query to fetch data from the desired PostgreSQL table.

3. Uses the `psql` command to connect to the PostgreSQL database and execute the `\copy` command. This command exports the result of the SQL query to a CSV file (`/tmp/export.csv`) on the local machine.

4. Uses the AWS CLI command `aws s3 cp` to upload the exported CSV file from the local machine to the specified Amazon S3 bucket and key.

5. Prints a success message indicating that the data has been exported from PostgreSQL and uploaded to S3.
