# Use official lightweight Python image
FROM python:3.12-slim

# Set working directory inside container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files into container
COPY . .

# Expose the Flask default port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
