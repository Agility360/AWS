![Agility360 Logo](https://raw.githubusercontent.com/Agility360/CEA/master/assets/logo/logo7868398_sm.png "Agility360 Logo")
## Client Engagement App
### For iOS and Android

### Application Resources
 - ![iOS Connect (App ID 1270138260)](https://itunesconnect.apple.com/WebObjects/iTunesConnect.woa/ra/ng/app/1270138260)
 - Pending: Download the Android app
 - Pending: Front end repository and documentation
 - [Back end repository and documentation](https://github.com/Agility360/CEA/tree/master/backend)
 - [REST api](https://api.agility360app.net/beta)
 - Good reading on how to pass Lambda errors to AWS API Gateway: (https://mattandre.ws/2016/06/catching-all-errors-api-gateway-aws-lambda/)

### Apple Developer Resources
 | Resource  | Value |
 | ------------- | ------------- |
 | App ID | 1270138260 |
 | Team Name | lawrencemcdaniel.com |
 | Team ID | YZ6K7R4QNJ |

### Google Cloud (for Android) Resources
| Resource  | Value |
| ------------- | ------------- |
|  Project | Agility 360 CEA |
|  Project ID | agility360-cea |
|  Project Number | 710763737966 |
|  API Key (According to AWS Mobile Hub) | AAAApXzR824:APA91bEd2MdzEWsRioQRmk_f7upChLrsyK7rvc5Dc-YHvNhHOIO3rcosuAiXUpU7LbsTED4ibJIKt1Egn2MOEPdU61CZVue0RoKKh0VNkVqfNej7UZAUyMwYs0OzctgIC4xgJrd3gn_2 |
| Sender ID (According to AWS Mobile Hub) | 710763737966 |
|  App ID | 1:710763737966:android:0575dc95d8de6448 |
| Google Developer Console  | https://console.cloud.google.com/home/dashboard?project=agility360-cea  |
| Firebase Console  | https://console.firebase.google.com/project/agility360-cea/overview |
| Play Store Console  | https://play.google.com/apps/publish/?dev_acc=15872505976734819884 |


#### Firebase Cloud Messaging (aka Google Push Notifications)
| Resource  |  |
| ------------- | ------------- |
| Sender ID | 710763737966 |
| Server key | AAAApXzR824:APA91bEd2MdzEWsRioQRmk_f7upChLrsyK7rvc5Dc-YHvNhHOIO3rcosuAiXUpU7LbsTED4ibJIKt1Egn2MOEPdU61CZVue0RoKKh0VNkVqfNej7UZAUyMwYs0OzctgIC4xgJrd3gn_2 |


### Serverless Infrastructure Resources

| Resource  | URL |
| ------------- | ------------- |
| REST api  | [https://api.agility360app.net/beta](https://api.agility360app.net/beta) |
| SQL Server  | sql.agility360app.net  |
| Content Delivery Network  | [https://cdn.agility360app.net](https://cdn.agility360app.net)  |
| Email Server  | [http://mail.agility360app.net](http://mail.agility360app.net)  |
| Source Code Repository  | [http://project.agility360app.net](http://project.agility360app.net)  |

### Federated ID providers
| Resource  | URL |
| ------------- | ------------- |
| Facebook App Console | https://developers.facebook.com/apps/1982035528745707/dashboard/ |
| Facebook App ID | 1982035528745707 |
| Federated login  | [http://oauth-deauthorized.agility360app.net](http://oauth-deauthorized.agility360app.net)  |
| Federated login  | [http://oauth-logged-in.agility360app.net](http://oauth-logged-in.agility360app.net)  |


### High level application architecture
 ![AWS Mobile Application Architecture](https://cms.agility360app.net/wp-content/uploads/2017/09/enterprise-mobile-hub_serverless-compute-app.png "AWS Mobile app architecture")

 * Note that this project uses RDS (MySQL) and S3, but not DynamoDB and SNS (as pictured in the image above).

 [Read more about AWS Mobile app architecture](https://aws.amazon.com/mobile/)

### High level application development strategy
 ![Application Architecture](https://cdn.agility360app.net/wp-content/uploads/2017/08/project-architecture.png "Application Architecture")


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

 #### API end point:  [https://api.agility360app.net/beta](https://api.agility360app.net/beta)

 ### AWS API Gateway
 You'll find a Swagger json dump of the complete REST api in the backend/aws/api folder of this repository. While we haven't actually tried, we assume that (if you feel so compelled) you can edit the api from Swagger or another API development tool of your choosing.

 * One note: the Swagger json in the repository contains AWS extensions which are not guaranteed to be importable to other platforms.

 ### AWS RDS - MySQL
 MySQL is hosted by the AWS RDS service. It is currently implemented on a t2.micro single instance in the AWS free usage tier.

 Host: sql.agility360app.net
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
