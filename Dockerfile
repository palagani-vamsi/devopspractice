FROM python:3.10-slim AS build
WORKDIR /app
COPY requirements.txt . 
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    python3-dev \
    && pip install --no-cache-dir --upgrade pip setuptools==70.0.0 wheel\
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y build-essential gcc g++ python3-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY . .
ENV DISABLE_PROFILER=true

EXPOSE 8080
CMD ["python", "email_server.py"]