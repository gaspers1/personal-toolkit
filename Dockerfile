FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && curl -LsSf https://astral.sh/uv/install.sh | sh

# Copy only the requirements file to leverage Docker's layer cache
COPY . .

# Install dependencies into the virtual environment using uv
RUN pip install -r requirements.txt