cd challenge-api
docker build -f Dockerfile -t challenge-api .
docker tag challenge-api 550331656791.dkr.ecr.us-east-1.amazonaws.com/challenge-api-repo:latest
docker push 550331656791.dkr.ecr.us-east-1.amazonaws.com/challenge-api-repo 
