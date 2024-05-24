.PHONY: init plan apply destroy build push deploy

DOCKER_IMAGE = warp:latest
AWS_REGION = us-west-2
ECR_REPO = $(shell terraform -chdir=terraform output -raw ecr_repository_url)

init:
    terraform -chdir=terraform init

plan:
    terraform -chdir=terraform plan

apply:
    terraform -chdir=terraform apply -auto-approve

destroy:
    terraform -chdir=terraform destroy -auto-approve

build:
    docker build -t $(DOCKER_IMAGE) ./app

ecr-login:
    aws ecr get-login-password --region $(AWS_REGION) | docker login --username AWS --password-stdin $(ECR_REPO)

push: ecr-login
    docker tag $(DOCKER_IMAGE) $(ECR_REPO):latest
    docker push $(ECR_REPO):latest

deploy: build push
    aws ecs update-service --cluster app-cluster --service app-service --force-new-deployment
