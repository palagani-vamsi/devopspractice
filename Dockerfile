FROM python:3.10-slim
WORKDIR /app 
COPY requirements.txt .
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    g++ \
    python3-dev \
    && pip install --no-cache-dir --upgrade pip setuptools wheel \
    && pip install --no-cache-dir -r requirements.txt \
    && apt-get remove -y build-essential gcc g++ python3-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
COPY . .
EXPOSE 8089
CMD ["python", "locustfile.py"]