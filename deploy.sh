# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 267897273784.dkr.ecr.us-east-1.amazonaws.com

# docker build -t jets-ecs-deploy .
# docker tag jets-ecs-deploy:latest 267897273784.dkr.ecr.us-east-1.amazonaws.com/jets-ecs-deploy:latest
# docker push 267897273784.dkr.ecr.us-east-1.amazonaws.com/jets-ecs-deploy:latest

zip -r app.zip Dockerrun.aws.json .ebextensions/
env -S "$(cat ./.env.$1)" eb_deploy -p app.zip -e $1
