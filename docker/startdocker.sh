docker build -t ubuntu_docker -f Dockerfile . 

docker image inspect ubuntu_docker

docker run -it --rm --name ubuntu_test_dockerfile ubuntu_docker 

docker exec -it ubuntu_test_dockerfile bash