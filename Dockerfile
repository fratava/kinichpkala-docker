FROM centos:latest

LABEL maintaainer="Francisco Tapia <f.tapia@irya.unam.mx>"

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

RUN cd /tmp

RUN wget https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.5-1.src.rpm\
	&& rpm -ivh ./openmpi-4.0.5-1.src.rpm\
	&& cd /root/rpmbuild/SPECS/\
	&& rpmbuild -ba --define 'configure_options --prefix=/opt/openmpi --enable-openib-rdmacm' openmpi-4.0.5.spec

RUN cd /root/rpmbuild/RPMS/x86_64/\
	&& yum -y install openmpi-4.0.5-1.el8.x86_64.rpm
	
