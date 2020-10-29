FROM centos:latest
MAINTAINER secdevoops.es

RUN yum update -y && yum upgrade -y

RUN yum install -y openssh-server

RUN adduser myuser

RUN mkdir -p /var/run/sshd 
   
RUN ssh-keygen -A

RUN rm -f /run/nologin

COPY config/* /etc/ssh/

COPY sshd /usr/sbin/

RUN mkdir /home/myuser/.ssh

COPY my_key.pub /home/myuser/.ssh/authorized_keys

RUN chmod -R 700 /home/myuser/.ssh \
	&& chown -R myuser:myuser /home/myuser/.ssh

EXPOSE 8022

ENTRYPOINT  ["/usr/sbin/sshd"]
CMD ["-D"]



