# dbt-snowflake-airflow-ELT-Project

## Overview of Project
This project involved building an end-to-end ELT pipeline leveraging dbt, Snowflake, and Apache Airflow to automate data transformation and orchestration. Raw data was ingested into Snowflake, where dbt was used to transform and model the data into structured tables, including dimensional models such as dim_customer. Airflow was implemented to schedule and manage the workflow.

## Setting Up and Integrating Snowflake with dbt for Data Transformation
My first task was to create the necessary infrastructure within Snowflake. This involved setting up a dedicated warehouse for compute resources, a database to house the project, and a secure role with appropriate permissions for accessing and manipulating data. 

<img width="1223" alt="Image" src="https://github.com/user-attachments/assets/05c74e28-2fc4-424d-81b2-b4e322f3d790" />

Within the database, I created a schema to logically organize my transformed tables. I then created three tables for boxes, cancels, and pauses and populated them using the data from [here](https://drive.google.com/drive/folders/140jRpRUOGCWDLtg1q1GtEz53JINi4aUE). 

After setting up the Snowflake infrastructure, I configured dbt Cloud to connect to Snowflake by setting up a new dbt project and defining the connection details. Once the connection was established, I created dbt models to transform raw data, with staging models handling cleaning, while transformation models applied business logic to generate fact and dimension tables. Additionally, I created a dbt macro to convert the started_week column from YYYY-Www format (ex. 2016-W52) into an actual date format, ensuring easier analysis.

## Orchestrating the Pipeline with Airflow and Astronomer Cosmos:
I first initialized an Astros project on my local machine

<img width="552" alt="Image" src="https://github.com/user-attachments/assets/3d9d4f7b-60f7-4fe0-87d0-81b801f32d07" />

Once the project was set up, I updated the Dockerfile to configure the environment with the necessary dependencies, and created a DAG file to define the workflow. I also modified the requirements.txt file to include any additional packages needed for the DAG's execution. Finally, when I ran astro dev start in my project, it built the local environment, installed the required dependencies, and started Airflow within a Docker container, allowing me to test and run the DAG locally before deploying it to the cloud. I then created a connection to dbt Cloud from Airflow, ensuring the proper authentication and configuration to trigger dbt Cloud jobs from within the DAG. 

<img width="1432" alt="Image" src="https://github.com/user-attachments/assets/303a889c-0c96-4c6b-a241-c55e4974723f" />

Once the connection was established, I triggered the DAG, which ran successfully, executing the dbt Cloud job as part of the pipeline. 

<img width="1040" alt="Image" src="https://github.com/user-attachments/assets/2dfdea52-2468-4730-a0be-73ea649304d9" />

The tables were populated in Snowflake completing the automated ELT process.

![Image](https://github.com/user-attachments/assets/cadf25bf-4be3-40bd-b479-c812e3188f9a)
