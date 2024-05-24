I've created tf infrastructure for this task: https://impulseteam.notion.site/DevOps-Engineer-24846c3e7d6146078ea0fdea521a3fa2

1) Initialize Terraform: make init
2) Plan the Terraform deployment: make plan
3) Apply the Terraform deployment: make apply
4) Build the Docker image: make build
5) Log in to ECR: make ecr-login
6) Push the Docker image to the ECR repository: make push
7) Deploy the application to ECS: make deploy
