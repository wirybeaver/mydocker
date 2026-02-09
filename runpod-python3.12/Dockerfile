# 1. Base Image: RunPod official PyTorch image for maximum CUDA compatibility
FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

# 2. Environment Variables
ENV DEBIAN_FRONTEND=noninteractive
# Redirect uv cache and toolchains to the persistent /workspace volume
ENV UV_CACHE_DIR="/workspace/.uv_cache"
ENV UV_PYTHON_INSTALL_DIR="/workspace/.uv/python"

# 3. Install basic system tools (Python 3.12 will be handled by uv later)
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    curl \
    wget \
    vim \
    tmux \
    htop \
    zip \
    unzip \
    build-essential \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# 4. Install uv (High-performance package manager) via multi-stage build
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# 5. Setup Zsh, Oh My Zsh, and plugins
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && chsh -s $(which zsh)

# 6. Copy local configuration files (Ensure these files exist in your build directory)
COPY .zshrc /root/.zshrc
COPY .gitconfig /root/.gitconfig

# 7. Create an initialization script to handle persistent environment setup
# This script runs every time the container starts
RUN echo '#!/bin/bash\n\
echo "Starting RunPod services (SSH, Jupyter)..."\n\
# Start RunPod base services in background\n\
/start.sh &\n\
# Wait for services to initialize\n\
sleep 2\n\
echo "Initializing persistent environment..." \n\
export PATH="/root/.local/bin:$PATH"\n\
# Automatically install Python 3.12 to the persistent directory if missing\n\
uv python install 3.12\n\
# Create a virtual environment in /workspace if it does not exist\n\
# if [ ! -d "/workspace/venv_uv" ]; then\n\
#    echo "Creating venv with Python 3.12..."\n\
#    uv venv /workspace/venv_uv --python 3.12\n\
# fi\n\
#source /workspace/venv_uv/bin/activate\n\
# Install SGLang if not already present in the venv\n\
# if ! python -c "import sglang" &> /dev/null; then\n\
#    echo "Installing SGLang and dependencies..."\n\
#    uv pip install "sglang[all]" flashinfer\n\
#fi\n\
echo "Container ready! SSH and Jupyter are running."\n\
# Keep container running and wait for background services\n\
wait' > /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# 8. Set working directory to the persistent volume
WORKDIR /workspace

# Use the script as the entrypoint to ensure the environment is ready on every boot
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
