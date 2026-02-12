# 1. Base Image: RunPod official PyTorch image for maximum CUDA compatibility
FROM runpod/pytorch:1.0.2-cu1281-torch280-ubuntu2404

# 2. Environment Variables
ENV DEBIAN_FRONTEND=noninteractive
# Redirect uv cache to the persistent /workspace volume (at runtime)
ENV UV_CACHE_DIR="/workspace/.uv_cache"
# Install Python to a location baked into the Docker image (not the persistent volume)
# ENV UV_PYTHON_INSTALL_DIR="/root/.uv/python"

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

# 4.5 Install Python 3.12 during build time (not at runtime)
# RUN uv python install 3.12

# 5. Setup Zsh, Oh My Zsh, and plugins
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && chsh -s $(which zsh)

# 6. Copy local configuration files (Ensure these files exist in your build directory)
COPY .zshrc /root/.zshrc
COPY .gitconfig /root/.gitconfig

# 7. Copy and setup the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 8. Set working directory to the persistent volume
WORKDIR /workspace

# Use the script as the entrypoint to ensure the environment is ready on every boot
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
