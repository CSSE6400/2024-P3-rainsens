# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y python3 python3-pip postgresql-client libpq-dev

FROM python:3.10

RUN pip3 install poetry

# Setting the work directory, and go into it.
WORKDIR /app

COPY pyproject.toml ./
RUN poetry install --no-root

COPY todo todo

CMD ["bash", "-c", "sleep 10 && poetry run flask --app todo run --host 0.0.0.0 --port 6400"]