FROM python:3.9-slim

EXPOSE 8511

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    libpq-dev gcc \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["streamlit", "run", "dashboard.py","--server.port=8511"]