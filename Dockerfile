# Stage 1: Build Stage
ARG PYTHON_VERSION=3.8
FROM python:${PYTHON_VERSION} as builder

# Set the working directory
WORKDIR /app
COPY . .

# Stage 2: Run Stage
FROM python:${PYTHON_VERSION} as run

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV ENV_ENGINE="default"
ENV ENV_NAME="default"
ENV ENV_USER="default"
ENV ENV_PASSWORD="default"
ENV ENV_HOST="default"
ENV ENV_PORT="default"

COPY --from=builder /app .
