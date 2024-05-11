# cicd-with-terraform-for-snowflake
This is a repository to demo how to use Terraform and GitHub actions to create and deploy a sample DB, schema and table on a Snowflake account.
A merge from a dev branch to main branch will deploy to DEV Snowflake account.
Creating a release branch from main branch will initiate a deploy to PROD Snowflake account.
