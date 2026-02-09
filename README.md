# Runpod Custom Docker Images

A centralized repository for managing multiple custom Docker images for Runpod.

## Available Images

### runpod-python3.12
PyTorch-based image with ML/AI development environment
- **Base**: runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04
- **Features**: Zsh, Oh My Zsh, common ML packages (numpy, pandas, matplotlib, etc.)
- **Location**: `runpod-python3.12/`

## Repository Structure

```
mydocker/
├── README.md                 # This file
├── runpod-python3.12/        # PyTorch ML image
│   ├── Dockerfile
│   ├── .zshrc
│   ├── .gitconfig
│   ├── .dockerignore
│   └── build.sh
└── [future-image]/           # Add more images here
```

## Quick Start

### Building an Image

Navigate to the specific image directory and build:

```bash
cd runpod-python3.12
./build.sh your-dockerhub-username
```

Or build manually:

```bash
cd runpod-python3.12
docker build -t your-username/runpod-python3.12:latest .
```

### Pushing to Docker Hub

```bash
docker login
docker push your-username/runpod-python3.12:latest
```

### Using on Runpod

1. Push your image to Docker Hub
2. In Runpod, use your custom image: `your-username/runpod-python3.12:latest`

## Adding New Images

To add a new custom image:

1. Create a new directory: `mkdir new-image-name`
2. Add Dockerfile and configuration files
3. Copy and modify the build script
4. Update this README

## Git Workflow

Initialize the repository:

```bash
git init
git add .
git commit -m "Initial commit: Runpod custom Docker images"
```

## Customization

Each image folder contains its own:
- `Dockerfile` - Image definition
- `.zshrc` - Shell customization
- `.gitconfig` - Git configuration (update with your info)
- `.dockerignore` - Build exclusions
- `build.sh` - Build helper script
