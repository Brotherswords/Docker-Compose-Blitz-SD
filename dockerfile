FROM python:3.8

WORKDIR /app

# Install Poetry
RUN pip install poetry

# Copy only the necessary files to install dependencies
COPY pyproject.toml poetry.lock /app/

# Install dependencies
RUN poetry config virtualenvs.create false && \
    poetry install --no-dev

EXPOSE 4090

# Copy the rest of your application
COPY . /app

CMD ["python", "app.py"]
