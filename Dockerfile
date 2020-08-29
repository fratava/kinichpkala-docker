FROM centos:latest

RUN yum -y install wget\
                   curl\
                   yum-utils\
                   rpm-build\
                   gcc\
                   gcc-c++\
                   gcc-gfortran\ 
                   make\
                   openssh\
                   openssh-server\
                   openssh-clients\
                   bind-utils\
		   git\
		   emacs
