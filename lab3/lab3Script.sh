#!/bin/bash
#lab3 finding files in the directory

echo 'finding directories in /bin that are setuid and owned by root'
read -p "hit any key to continue."
find /bin -user root -perm /4000 -exec ls -ldb {} \; 
find /sbin -user root -perm /4000 -exec ls -ldb {} \; 
find /usr/bin -user root -perm /4000 -exec ls -ldb {} \; 
find /usr/sbin -user root -perm /4000 -exec ls -ldb {} \;
echo ""
echo 'find all files across the entire system that have setuid or setgid enabled regardless of owner'
read -p "hit any key to contine."
find / -perm /6000 -exec ls -ldb {} \; 
echo ""
echo 'find all files in /var that have changed in the last 20 minutes.'
read -p "hit any key to continue."
find /var -mmin -20 -exec ls -ldb {} \;
echo ""
echo 'find all files in /var that are refular files of zero length'
read -p "hit any key to continue."
find /var -type f -size 0 -exec ls -ldb {} \;
echo ""
echo 'find all files in /dev that are not regular files and also not directories'
read -p "hit any key to continue."
find /dev -not -type f -not -type d -exec ls -ldb {} \;
echo ""
echo 'find all directories in /home thar not owned by root in the same command change their permissions to ensure they have 711 (-rwx--x--x) permissions'
read -p "hit any key to continue."
find /home -type d -not -user root -exec chmod 0711 {} \; -exec ls -ldb {} \;
echo ""
echo 'find all regular files in /home that are not owned by root. In the same command, change their permissions to ensure they have 755 (-rwx-wx-wx) permissions'
read -p "hit any key to continue"
find /home -type f -not -user root -exec chmod 0755 {} \; -exec ls -ldb {} \;
echo ""
echo 'find all files in /etc that have changed in the last 5 days'
read -p "hit any key to continue"
find /etc -mtime -5 -exec ls -ldb {} \;
