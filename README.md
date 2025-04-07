# ExpressJS Deployment Architecture

## Overview
This project implements deployment pipeline using Docker containers on AWS infrastructure, with automated CI/CD through GitHub Actions.

## Deployment Architecture

### Container Architecture
- **Multi-stage Docker Build**
  - Builder stage using node:18-alpine for optimized build
  - Containerized Express.js application and MySQL database
  - Services orchestrated via Docker Compose

### Infrastructure (AWS)
- **EC2 Instance**
  - t2.micro instance running in us-east-1

- **Security Configuration**
  - Dedicated security group
  - Exposed ports:
    - 3000 (Application)
    - 80 (HTTP)
    - 443 (HTTPS)
  - Unrestricted outbound traffic

### CI/CD Pipeline
The deployment process is fully automated through GitHub Actions:

1. **Build Phase**
   - Triggers on main branch pushes
   - Authenticates with Docker Hub
   - Builds container image
   - Pushes to Docker Hub registry

2. **Deploy Phase**
   - Orchestrates containers using Docker Compose
   - Manages environment variables securely

### Database Persistence
- MySQL data persisted through Docker volumes

### Infrastructure as Code
Terraform manages AWS infrastructure with:
- EC2 instance provisioning
- Security group configuration

## Deployment Flow
1. Code pushed to main branch
2. GitHub Actions workflow triggered
3. Docker image built and published
4. AWS infrastructure maintained by Terraform
5. Application deployed via Docker Compose
6. Database initialized and persisted

## API Documentation

Access the Swagger documentation at: http://54.172.23.254:3000/api-docs