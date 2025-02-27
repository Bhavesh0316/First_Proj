# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the built wheel file
COPY dist/*.whl .

# Install the wheel package
RUN pip install *.whl

# Run the application (adjust based on your app)
CMD ["python", "-m", "your_module_name"]
