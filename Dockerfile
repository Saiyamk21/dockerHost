FROM debian:bullseye

# Install LaTeX and Python
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    texlive-full \
    python3 \
    python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create and set working directory
WORKDIR /app

# Copy app files
COPY . .

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Create folders for LaTeX compilation
RUN mkdir /working && mkdir -p /var/www/app

# Set default command
CMD ["python3", "app.py"]
