FROM python:3.10-slim

WORKDIR /app

# Install networking tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    iproute2 \
    net-tools \
    curl \
    dnsutils \
    build-essential \
    gcc \
    g++ \
    python3-dev \
 && pip install --no-cache-dir --upgrade pip setuptools==70.0.0 wheel \
 && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Environment variables
ENV DISABLE_PROFILER=true

# Expose port
EXPOSE 8080

# Run application
CMD ["python", "email_server.py"]
