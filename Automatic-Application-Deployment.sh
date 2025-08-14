#!/bin/bash

# Update and Install dependencies
echo "Updating system packages..."
apt-get update -y

echo "Installing Git..."
apt-get install git -y

echo "Installing Docker..."
apt-get install docker.io -y

# Enable and start Docker service
echo "Enabling Docker service..."
systemctl enable docker

echo "Starting Docker service..."
systemctl start docker

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make Docker Compose executable
echo "Changing permissions for docker-compose..."
sudo chmod +x /usr/local/bin/docker-compose

# Clone the repository
echo "Cloning the repository..."
git clone https://github.com/praveenkumarpentamalla/rxcapital.git

# Navigate to the project directory
echo "Navigating to rxcapital directory..."
cd rxcapital/

# Build Docker containers
echo "Building Docker containers..."
docker-compose build

# Start Docker containers in detached mode
echo "Starting Docker containers..."
docker-compose up -d

# Check the status of the containers
echo "Checking the status of containers..."
docker ps -a

