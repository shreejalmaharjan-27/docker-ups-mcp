# Use a lightweight Python image
FROM python:3.12-slim

# Install Git (required to fetch the UPS repository)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install the 'uv' package manager
RUN pip install uv

# Install the official UPS MCP server globally inside the container
RUN uv tool install git+https://github.com/UPS-API/ups-mcp

# Add the uv tools directory to the container's system PATH
ENV PATH="/root/.local/bin:$PATH"

# Set the server to run when the container starts
ENTRYPOINT ["ups-mcp"]