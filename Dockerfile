FROM freeradius/freeradius-server:3.0.23

COPY --chown=101:101 --chmod=0640 configs/clients.conf /etc/freeradius/clients.conf
COPY --chown=101:101 --chmod=0640 configs/default /etc/freeradius/sites-available/default
COPY --chown=101:101 --chmod=0640 configs/inner-tunnel /etc/freeradius/sites-available/inner-tunnel
COPY --chown=101:101 --chmod=0640 configs/ldap /etc/freeradius/mods-available/ldap
COPY --chown=101:101 --chmod=0640 configs/eap /etc/freeradius/mods-enabled/eap
COPY --chown=101:101 --chmod=0640 configs/proxy.conf /etc/freeradius/proxy.conf
COPY init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh
RUN ln -s /etc/freeradius/mods-available/ldap /etc/freeradius/mods-enabled/ldap

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["freeradius"]
