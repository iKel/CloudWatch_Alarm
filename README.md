# CloudWatch Alarm for RDS

This terraform project configures CloudWatch alarms to trigger high CPU usage (above 80%(adjustable)) for DB.

---
Note: before you start, please check that you put the correct DB_identifier_id for the database that you want to monitor, an email for AWS SNS, and other general settings in the relative files.

---
CPU load test for the database:

Access your database and run the following commands:

  

> SHOW DATABASES;

> CREATE DATABASE test;

> USE test;

> SHOW TABLES;

> create table t1(x int primary key auto_increment);

>insert into t1 () values (),(),();

>insert into t1 (x) select x + (select count(*) from t1) from t1; #repeat the following command several times until overload the database

>DROP TABLE t1; #delete the table
---
Addition information section:

[Monitor AWS via the Terraform Cloudwatch Module](https://adamtheautomator.com/terraform-cloudwatch/)
  

[Terraform CloudWatch automation](https://hands-on.cloud/terraform-cloudwatch-examples/)

[A Comprehensive Guide to Using tfvars with Modules](https://saturncloud.io/blog/terraform-a-comprehensive-guide-to-using-tfvars-with-modules/#:~:text=In%20your%20tfvars%20file,%20define,defined%20in%20your%20module%20configuration.&text=Now,%20you%20can%20use%20the,variables%20using%20the%20var%20keyword.&text=Finally,%20apply%20the%20configuration%20using%20the%20terraform%20apply%20command.)

  [Terraform Best Practices](https://developer.hashicorp.com/terraform/cloud-docs/recommended-practices)


