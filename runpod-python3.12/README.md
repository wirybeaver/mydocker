# PyTorch ML Docker Image

Custom Docker image for Runpod with PyTorch and ML development tools.

## Features

- Based on Runpod's PyTorch 2.1.0 image (Python 3.10, CUDA 11.8)
- Zsh with Oh My Zsh
- Custom .zshrc with useful aliases and functions
- Git configuration
- Pre-installed packages: jupyter, numpy, pandas, matplotlib, scikit-learn, wandb

## Building

```bash
./build.sh your-dockerhub-username
```

Or manually:

```bash
docker build -t your-username/runpod-pytorch-ml:latest .
```

## Testing Locally

```bash
docker run -it --gpus all your-username/runpod-pytorch-ml:latest
```

## Pushing to Docker Hub

```bash
docker login
docker push your-username/runpod-pytorch-ml:latest
```

## Customization

1. Edit `.gitconfig` with your name and email
2. Modify `Dockerfile` to add/remove packages
3. Customize `.zshrc` for your preferred aliases and functions
