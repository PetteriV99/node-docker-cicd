# Gitlab CI/CD Example for Node.js application and Docker
Sample project for using Docker-in-docker to build images for a Node.js application 

## Information

- Gitlab only, and you need a gitlab runner installed and online somewhere
- Postgres is used as a database, but can be easily changed in docker-compose.yml
- Also in the project this is based on there was only one .env file, so it was neccesary to create one depending on the branch
- Deployment stage is left as an example, not used in this project.

## Setup

- Go to Settings and CI/CD
- Add these variables
    - POSTGRES_DB
    - POSTGRES_PASSWORD
    - POSTGRES_USER
    - PRODUCTION_ENV_FILE
        - Set this as a "file" type
    - TESTING_ENV_FILE
        - Set this as a "file" type
- Also it is assumed there is a branch called "production" but in can be easily changed to whatever you use
