# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10-slim 

EXPOSE 5000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Set the working directory first
WORKDIR /app

# Copy the requirements.txt first (to cache dependencies layer)
COPY requirements.txt .

# Install pip dependencies
RUN python -m pip install -r requirements.txt

# Copy the entire app to the container
COPY . /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# CMD to run the Flask app via Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]   # Adjusted to point to 'app.py'
