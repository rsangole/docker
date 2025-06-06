# Docker GitHub Actions Project

This project demonstrates how to build a Docker image using GitHub Actions and push it to Docker Hub.

## Project Structure

```
docker-github-actions-project
├── src
│   └── app.py          # Main application code
├── .github
│   └── workflows
│       └── docker-image.yml  # GitHub Actions workflow for Docker
├── Dockerfile           # Instructions for building the Docker image
├── requirements.txt     # Python dependencies
└── README.md            # Project documentation
```

## Getting Started

To set up and run this project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd docker-github-actions-project
   ```

2. **Install dependencies:**
   Make sure you have Python and pip installed, then run:
   ```bash
   pip install -r requirements.txt
   ```

3. **Run the application:**
   You can run the application locally using:
   ```bash
   python src/app.py
   ```

## Docker Setup

To build and run the Docker image, follow these steps:

1. **Build the Docker image:**
   ```bash
   docker build -t <your-dockerhub-username>/<image-name> .
   ```

2. **Run the Docker container:**
   ```bash
   docker run -p 5000:5000 <your-dockerhub-username>/<image-name>
   ```

## GitHub Actions Workflow

This project includes a GitHub Actions workflow defined in `.github/workflows/docker-image.yml`. This workflow will automatically build the Docker image and push it to Docker Hub whenever changes are pushed to the main branch.

### Prerequisites

- Create a Docker Hub account and repository.
- Set up GitHub Secrets for `DOCKER_USERNAME` and `DOCKER_PASSWORD` to allow the workflow to authenticate with Docker Hub.

## License

This project is licensed under the MIT License. See the LICENSE file for details.