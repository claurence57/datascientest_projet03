FROM tiangolo/uvicorn-gunicorn:python3.9

RUN apt update && apt autoremove && apt install -y postgresql-client

# Python driver to postgresql DB and fastapi
RUN pip install fastapi psycopg2

# fastapi code
COPY main.py main.py

# Port to connect to the API
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:server", "--host", "0.0.0.0", "--port", "8000"]

