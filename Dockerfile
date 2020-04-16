FROM  debian

RUN apt-get -y update
RUN export DEBIAN_FRONTEND=noninteractive && apt-get install -y slapd ldap-utils supervisor 

ADD exportvolume /ldap
#EXPOSE 389 636
EXPOSE 80 443 

ENTRYPOINT ["slapd"]
#CMD ["-h", "ldap://0.0.0.0:389 ldaps://0.0.0.0:636", "-d","3","-f","/ldap/slapd.conf"]
CMD ["-h", "ldap://0.0.0.0:80 ldaps://0.0.0.0:443", "-d","3","-f","/ldap/slapd.conf"]
