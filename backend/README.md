## Candidate Engagement App -- Back End

The entire backend is developed with Amazon Web Services. All IT infrastructure resources are exposed with a REST API that is created using the AWS API Gateway service. Note however that the MySQL database is publicly accessible. Note more details below.

### Resources
* [Getting started with AWS Lambda](http://docs.aws.amazon.com/lambda/latest/dg/getting-started.html)
* [Getting started with AWS API Gateway](http://docs.aws.amazon.com/apigateway/latest/developerguide/getting-started-intro.html)
* [Getting started with AWS RDS](https://aws.amazon.com/rds/)
* [Accessing MySQL databases from an AWS Python Lambda function](https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function)
* [Create a serverless RESTful API with API Gateway, Swagger, Lambda, and DynamoDB](https://cloudonaut.io/create-a-serverless-restful-api-with-api-gateway-swagger-lambda-and-dynamodb/)
* [MySQL Documentation on JSON Data Type](https://dev.mysql.com/doc/refman/5.7/en/json.html)


### REST api
The REST api is implemented as a set of serverless microservices. Service and resource permissions are managed using IAM roles.

![REST api design](https://raw.githubusercontent.com/Agility360/CEA/master/backend/aws/rest-api-architecture.png "REST api design")


#### API end point:  [https://hqctqkd7xc.execute-api.us-east-1.amazonaws.com/beta](https://hqctqkd7xc.execute-api.us-east-1.amazonaws.com/beta)

### AWS API Gateway
You'll find a Swagger json dump of the complete REST api in the backend/aws/api folder of this repository. While we haven't actually tried, we assume that (if you feel so compelled) you can edit the api from Swagger or another API development tool of your choosing.

* One note: the Swagger json in the repository contains AWS extensions which are not guaranteed to be importable to other platforms.

### AWS RDS - MySQL
MySQL is hosted by the AWS RDS service. It is currently implemented on a t2.micro single instance in the AWS free usage tier.

Host: cea.cjbv7rlz4hsg.us-east-1.rds.amazonaws.com
Port: 3306
Allowed protocols: TCP/IP and/or SSH

The MySQL server is publicly accessible so that the Agility business support and administrative teams can connect using standard client software tools like MS Access.

Note that the MySQL server does not currently use IAM.

![MySQL cea database](https://raw.githubusercontent.com/Agility360/CEA/master/backend/aws/mysql/er-diagram.png "MySQL cea database")

### AWS Lambda
The REST api uses Lambda functions as middleware to handle stuff like
  - unpacking and transforming URL body requests
  - connecting to the database
  - parsing and formatting SQL query results
  - JSON error messages to be sent back to the caller

Lambda functions are all implemented in Python which might seem like an odd choice for a project that is based principally on Angular and Typescript. Though it is technically possible to use Node.js for these Lambda functions, we observed early on that most literature and how-to documentation for MySQL-Lambda is published using Python examples, and thus, here we are ... with our own set of Python code :=/

Each Lambda function was originally created using the AWS CLI (command line interface). We used the following how-to from [University of Pennsylvania's Information Systems department](https://www.isc.upenn.edu/accessing-mysql-databases-aws-python-lambda-function) as a technical reference for the strategy. Accordingly, you'll find a similar set of files in each of the folders within the backend/aws/lambda section of this repository. Also, note that use of camel case is important.
  - each folder represents a lambda function
  - file ```aws-cli-lambda-create.sh``` is a bash script with the CLI commands to create a new lambda function
  - ```rds_config.py``` is a kluge to handle database connectivity credentials for the time being
  - ```[folder name]-test-data.json``` contains the sample body request object to be used to test the function from the AWS Lambda console
  - ```[folder name].py``` is the Python code for the Python function

* A design note: the code design of these functions defies nearly every principal of DRY. We know that, but we did it anyway. Refactor this code with caution! A few things to consider:
  - AWS bills for execution of the function, in increments of 100ms.
  - If your Lambda calls another Lambda then you'll effectively be paying 2x as the calling function will still get billed while it waits for the callee to return its results.
  - if your Lambda executes a MySQL query and is waiting for results, then you'll be paying for Lambda as it waits while the MySQL server is executing the query.
Thus, if you feel compelled to refactor any code for performance sake then MySQL is likely your venue of choice; assuming that "performance" means minimizing your monthly AWS bill.
