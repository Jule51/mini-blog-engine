
# Use an official Python runtime as a parent image
FROM ghcr.io/astral-sh/uv:debian

# Set the working directory to /app
WORKDIR /app

# Copy only the poetry.lock and pyproject.toml to leverage Docker cache
COPY pyproject.toml uv.lock /app/

# Install poetry and dependencies
RUN uv sync

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["uv", "run", "flask", "run", "--host=0.0.0.0"]
