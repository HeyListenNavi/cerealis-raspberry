# Use a base image with Python 3.9
FROM python:3.9-bullseye

# Set the working directory
WORKDIR /app

# Install essential runtime libraries for USB devices and OpenCV
RUN apt-get update && apt-get install -y \
    libusb-1.0-0 \
    libgl1-mesa-glx \
    --no-install-recommends

# Copy and install Python dependencies from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your application code into the container
COPY . .

# Define the command to run your script
CMD ["python", "main.py"]
