#!/bin/bash
sudo cat /etc/httpd/logs/access_log >> /tmp/access.log
sudo awk '{print $1}' /tmp/access.log | sort | uniq -c | sort -nr >> /tmp/temp.log
awk '{if($1 > 1) print "IP of User : ",$2,"\t",$1," times hit to the system";}' /tmp/temp.log
sudo rm -rf /tmp/access.log
sudo rm -rf /tmp/temp.log
