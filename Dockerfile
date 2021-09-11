FROM python:3.9.5
LABEL maintainer="Whitman Bohorquez"

RUN pip install poetry

WORKDIR /application

COPY poetry.lock poetry.lock
COPY pyproject.toml pyproject.toml
RUN poetry install

COPY . .

CMD ["poetry", "run", "mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]
