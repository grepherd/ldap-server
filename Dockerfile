
FROM ubuntu:latest

COPY ldap-install.sh /tools/ldap-install.sh
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils expect && \
    apt-get install -y apache2 apache2-utils phpldapadmin && \
    expect tools/ldap-install.sh

COPY ldap.conf /etc/ldap/ldap.conf

EXPOSE 389

CMD slapd && bash
