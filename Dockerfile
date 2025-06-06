FROM rocker/verse:latest

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies for Python and uv
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv curl && \
    python3 -m venv ${VIRTUAL_ENV} && \
    . ${VIRTUAL_ENV}/bin/activate && \
    pip3 install --upgrade pip && \
    pip3 install uv && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy Python requirements and install with uv
COPY requirements.txt .
RUN uv pip install -r requirements.txt

# Copy R project files (including renv.lock if present)
COPY . .

# Restore R packages using renv if renv.lock exists
RUN if [ -f renv.lock ]; then Rscript -e "install.packages('renv'); renv::restore()" ; fi

CMD ["python3", "app.py"]