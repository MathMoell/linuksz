# Kontrollnimekiri — Õpetaja jaoks

Palun kontrolli:
- [ ] Kaks VM-i on olemas: LogServer ja LogClient
- [ ] IP-aadressid: Server = 192.168.100.10, Client = 192.168.100.20
- [ ] `rsyslog` on mõlemas masinas installitud ja aktiivne
- [ ] Server kuulan porti 514 (UDP või TCP, sõltuvalt ülesandest)
- [ ] Serveris on kataloog `/var/log/remote` ja failiõigused on korrektsed
- [ ] Klient saadab logid (kasutades `logger` testi) ja server sai kirje
- [ ] Logide pööramine konfigureeritud (`/etc/logrotate.d/remote`) või õpetus selle kohta antud
- [ ] README juhised järgitavad ja loogilised
