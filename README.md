### dbt + Snowflake + Airflow Data Pipeline
## Overview
This project demonstrates how to build and orchestrate a modern analytics pipeline using dbt, Snowflake, and Apache Airflow.
The pipeline transforms raw data from Snowflake source tables into analytics-ready models using dbt transformations, and orchestrates the workflow using Apache Airflow running on Docker.
The project implements a layered transformation architecture with *staging, intermediate, and mart* models, along with data quality testing and pipeline orchestration.

## Data Model Layers
# Staging Layer
Standardizes raw source tables.
- stg_tpch_orders
- stg_tpch_line_items
# Intermediate Layer
Applies business transformations and joins.
- int_order_items
- int_order_items_summary
# Mart Layer
Produces final analytics tables.
- fct_orders

## Data Quality Testing
The project uses dbt tests to ensure data reliability.
Examples implemented:
# Generic Tests
- not_null
- unique
- relationships
- accepted_values
# Custom Tests
- date validation
- discount validation

## Running the Project
- Start Airflow: docker compose build
                 docker compose up
- Airflow UI: http://localhost:8080
- Trigger Pipeline
  Inside Airflow UI: dbt_snowflake_pipeline DAG
  Run manually or schedule it.

## Key Learnings
This project demonstrates:
- dbt transformation workflow
- modular SQL modeling
- data testing and validation
- orchestrating dbt with Airflow
- containerized data pipelines with Docker
- managing dependencies in dbt projects

## Tech Stack	
- Snowflake	
- dbt Core (v1.11)	
- Apache Airflow (Docker)
- Docker Desktop	
- Python 3.12	
- Git / GitHub	