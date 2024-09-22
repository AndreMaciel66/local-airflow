# Use the official Airflow image
FROM apache/airflow:2.10.2

# Set environment variable for Airflow version
ENV AIRFLOW_VERSION=2.10.2

# Copy requirements.txt and the DAG file
COPY requirements.txt /requirements.txt
COPY --chown=airflow:root test_dag.py /opt/airflow/dags/

# Install Python packages from requirements.txt
RUN pip install --no-cache-dir "apache-airflow==$AIRFLOW_VERSION" -r /requirements.txt

# Set the default command to run the web server
CMD ["airflow", "webserver", "--port", "8080"]
