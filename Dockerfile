FROM centos:7.3.1611

LABEL maintainer "Enderson Maia <endersonmaia@gmail.com>"

RUN yum -y update \
    && yum -y install \
      dejavu-lgc-sans-fonts\
      fontconfig \
      freetype \
      libICE \
      libXcursor \
      libXft \
      libXinerama  \
      libXmu \
      libXrandr  \
      libXrender \
      mesa-libGL \
      postgresql \
      postgresql-odbc \
      zlib.i686 \
    && rm -rf /var/cache/yum/* \
    && yum clean all

ADD 18-04-16-DBACCESS_LINUX_X64_20171117.TAR.GZ /totvs11/dbaccess64

COPY /build /build

RUN /build/setup.sh

EXPOSE 7890

WORKDIR /totvs11/dbaccess64/multi

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD [ "dbaccess" ]
