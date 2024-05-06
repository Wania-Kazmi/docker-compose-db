FROM python:3.12
LABEL maintainer='abc@gmail.com'

WORKDIR /code 

RUN pip install poetry

RUN poetry config virtualenvs.create false

# Assuming your pyproject.toml and the whole docker_compose directory are at the same level in your project
COPY ./pyproject.toml /code/

COPY ./compose_db /code/compose_db

RUN poetry install

CMD ["poetry", "run", "uvicorn", "compose_db.main:app", "--host", "0.0.0.0", "--port", "8000"]
