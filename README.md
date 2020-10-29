# Centos SSH Server

Docker container for running OpenSSH server on a Centos.

## Steps

### Build the image

```
docker build --tag ssh-server:latest .
```

### Run the container

```
docker run -d --name ssh-server -p 8022:8022 ssh-server:latest
```

### Access to the container via ssh
To access via SSH to the container you need to use the key my_key

```
ssh -i ./my_key myuser@localhost
```

Alternatively you can generate your own ssh key pair with the command
```
ssh-keygen -t rsa -b 4096 -C "your_email@your_company.com" -f my_key
```

If a different key file name is used, you need to modify it on the Dockerfile


