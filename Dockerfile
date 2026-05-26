FROM python:3.14.5-alpine3.23

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml README.md LICENSE .

RUN poetry install --no-root

COPY app/ ./

EXPOSE 8000

ENTRYPOINT [ "poetry", "run", "python", "manage.py"]

CMD ["runserver", "0.0.0.0:8000"]