FROM rocker/verse:latest

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install system dependencies for Python and uv
RUN apt-get update && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    gdal-bin \
    libgdal-dev \
    libudunits2-dev && \
    python3 -m venv ${VIRTUAL_ENV} && \
    . ${VIRTUAL_ENV}/bin/activate && \
    pip3 install --upgrade pip && \
    pip3 install uv && \
    rm -rf /var/lib/apt/lists/* \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

WORKDIR /app

# Copy Python requirements and install with uv
COPY requirements.txt .
RUN uv pip install -r requirements.txt

# Copy R package files and install with Rscript
COPY install_r.R .
COPY r_pkgs.yml .
RUN Rscript install_r.R