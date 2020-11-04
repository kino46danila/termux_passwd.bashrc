#!/data/data/com.termux/files/usr/bin/bash
echo -n " Установите желаемый пароль : "
read passwd
echo "$passwd" > ~/Logs/passwd.log
cat /data/data/com.termux/files/home/termux_passwd.bashrc/bashrc > ~/.bashrc
