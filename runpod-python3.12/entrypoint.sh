#!/bin/bash
echo "Starting RunPod services (SSH, Jupyter)..."
# Start RunPod base services in background
/start.sh &
# Wait for services to initialize
sleep 2
echo "Initializing persistent environment..."
export PATH="/root/.local/bin:$PATH"

# Create a virtual environment in /workspace if it does not exist
# if [ ! -d "/workspace/venv_uv" ]; then
#    echo "Creating venv with Python 3.12..."
#    uv venv /workspace/venv_uv --python 3.12
# fi
#source /workspace/venv_uv/bin/activate
# Install SGLang if not already present in the venv
# if ! python -c "import sglang" &> /dev/null; then
#    echo "Installing SGLang and dependencies..."
#    uv pip install "sglang[all]" flashinfer
#fi
echo "Container ready! SSH and Jupyter are running."
# Keep container running and wait for background services
wait
