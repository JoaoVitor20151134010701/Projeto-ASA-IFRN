FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt upgrade -y && \
    apt install -y postfix dovecot-imapd dovecot-pop3d dovecot-lmtpd \
    telnet nano syslog-ng procps net-tools && \
    apt clean

COPY ./postfix/ /etc/postfix

COPY mailname /etc/mailname

RUN rm -f /etc/dovecot/conf.d/*.conf

COPY ./dovecot/ /etc/dovecot/conf.d/

RUN sed -i 's/disable_plaintext_auth.*/disable_plaintext_auth = no/g' /etc/dovecot/conf.d/10-auth.conf || true


COPY mail.sh /usr/local/bin/mail.sh
RUN chmod +x /usr/local/bin/mail.sh

RUN mkdir -p /etc/skel/Maildir/{cur,new,tmp} && chmod -R 700 /etc/skel/Maildir



EXPOSE 25/tcp
EXPOSE 587/tcp
EXPOSE 110/tcp
EXPOSE 143/tcp

VOLUME ["/var/mail/vmail"]


CMD ["sh", "-c", "/usr/local/bin/mail.sh ; service syslog-ng start ; service postfix start ; service dovecot start ; tail -F /var/log/mail.log"]