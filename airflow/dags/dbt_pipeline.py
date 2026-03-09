from datetime import datetime
from airflow.sdk import DAG
from airflow.providers.standard.operators.bash import BashOperator

DBT_PROJECT = "/opt/airflow/dbt_project"

with DAG(
    dag_id="dbt_snowflake_pipeline",
    start_date=datetime(2026, 3, 1),
    schedule="@daily",
    catchup=False,
) as dag:

    dbt_deps = BashOperator(
        task_id="dbt_deps",
        bash_command=f"cd {DBT_PROJECT} && dbt deps --profiles-dir {DBT_PROJECT}"
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=f"cd {DBT_PROJECT} && dbt run --profiles-dir {DBT_PROJECT}"
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=f"cd {DBT_PROJECT} && dbt test --profiles-dir {DBT_PROJECT}"
    )

    dbt_deps >> dbt_run >> dbt_test