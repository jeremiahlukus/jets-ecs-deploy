# Jets Beanstalk ECS deploy

This app uses https://github.com/manheim/eb_deployer

You need to create an ECR image

By doing this:

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin YOURACCOUNT.dkr.ecr.us-east-1.amazonaws.com

docker build -t jets-ecs-deploy .
docker tag jets-ecs-deploy:latest YOURACCOUNT.dkr.ecr.us-east-1.amazonaws.com/jets-ecs-deploy:latest
docker push YOURACCOUNT.dkr.ecr.us-east-1.amazonaws.com/jets-ecs-deploy:latest

Once you create your ECR image now you can deploy.

First package your app we only the tghe Dockerrun file and your /ebextentions dir
zip -r app.zip Dockerrun.aws.json .ebextensions/

One you package your need to feed your ENV vars into eb_deploy

env -S "$(cat ./.env.$1)" eb_deploy -p app.zip -e $1


deploy.sh does this for you just pass in the env you want to deploy

`sh deploy.sh development`

You also need to set your env vars in your eb_deploy.yml
Like
https://github.com/jeremiahlukus/jets-ecs-deploy/blob/main/config/eb_deployer.yml#L22
