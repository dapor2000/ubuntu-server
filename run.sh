#!/bin/bash
updatedb
rm /etc/apache2/sites-available/default-ssl.conf                                                                                          
rm /etc/apache2/sites-enabled/default-ssl.conf 
cd /etc/apache2/mods-available/
/usr/sbin/a2enmod *
/usr/sbin/a2dismod lua
cd /etc/apache2/sites-available
a2ensite *
cd
echo "RESTART APACHE"
/etc/init.d/apache2 restart
echo "START TRACCAR"
/traccar/bin/traccar start &
echo "START SSHD"
/usr/sbin/sshd -D
