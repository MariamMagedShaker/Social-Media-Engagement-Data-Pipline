from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator  # NOT airflow.operators.bash
from datetime import datetime, timedelta

with DAG(
    dag_id='dbt_workflow',
    description='Run dbt models using dbt Core',
    schedule=None,
    start_date=datetime(2024, 6, 25),
    catchup=False,
    default_args={
        'owner': 'airflow',
        'retries': 1,
        'retry_delay': timedelta(minutes=5)
    }
) as dag:

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /home/mariam-maged/Documents/DWH_PROJECT/dbt_snow_social/snowflake_data && dbt run'
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='cd /home/mariam-maged/Documents/DWH_PROJECT/dbt_snow_social/snowflake_data && dbt test'
    )

    dbt_run >> dbt_test

