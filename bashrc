#!/data/data/com.termux/files/usr/bin/bash


if [[ ! -d  ~/Logs ]]
then
	mkdir -p ~/Logs
fi
if [[ ! -f ~/Logs/passwd.log ]]
then
	echo " Сохранённого пароля нет в системе ! "
	chmod +x /data/data/com.termux/files/home/termux_passwd.bashrc/install.sh
	/data/data/com.termux/files/home/termux_passwd.bashrc/install.sh
fi

if [[ ! -e /data/data/com.termux/files/usr/bin/cmatrix ]] 
then
	apt-get install cmatrix -y >> /dev/null
fi

function section()
{
	for (( i=1; i <= 44; i++ ))
	do echo -n "-"
	done
	echo " " 
}


function window()
{
name="`ps -A | grep bash | wc -l`"

if [[ $name -le 2 ]]
then
	tput cup 27 27
	tput civis
	echo " Введите пароль ! "
	read -s -t 7 psw 
	tput cnorm

	if [[ $(cat ~/Logs/passwd.log) == $psw ]]
	then
	$(section >> ~/Logs/init.log )
        echo -e "| Вход в системy    |  $(date +%R':'%S' '%d'/'%m'/'%Y) |" >> ~/Logs/init.log

 	else
	$(section >> ~/Logs/error_init.log)
	echo -e "| Ошибка входа     |   $(date +%R':'%S' '%d'/'%m'/'%Y) |" >> ~/Logs/error_init.log
	rm -f ~/.bash_history
	cmatrix
	clear
	exit 1 	 
	fi
fi
}


function windows_exit()
{
name="`ps -A | grep bash | wc -l`"

if [[ $name -gt 2 ]]
then
         exit 0
else
	echo -e "| Выход из системы  |  $(date +%R':'%S' '%d'/'%m'/'%Y) |" >> ~/Logs/init.log 


	$(section >> ~/Logs/init.log)
	echo -e " \a \a \a "
	exit 0
fi
}



window
 clear

RUSSIA()
{
echo -e " \e[4;37;47m -= RUSSIA THE BEST =- \e[m"
echo -e " \e[4;37;47m -= RUSSIA THE BEST =- \e[m"
echo -e " \e[4;34;44m -= RUSSIA THE BEST =- \e[m"
echo -e " \e[4;34;44m -= RUSSIA THE BEST =- \e[m"
echo -e " \e[4;31;41m -= RUSSIA THE BEST =- \e[m"
echo -e " \e[4;31;41m -= RUSSIA THE BEST =- \e[m"
 }

RUSSIA

echo
PS1="\n\n\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]➦➜▶ $(date) \n➥➜▶ \w \[\033[00m\] \[\033[01;34m\]\[\033[00m\] "

PS2='\[ \e[0;31;1m=>\e[m \] \[\e[0;33;1m=>\e[m\] \[\e[0;32;1m=> \e[m \] '

alias exit="windows_exit"
alias grep="grep --color"


function for_less()
{
	for i in * 
do 
	less $i
done
}
alias lf="for_less"


function cd_ls()
{
	if [[ -e $1 ]]
	then
	 echo -e "\a"
         cd "$1"
         ls -A1
		elif [[ -z $1 ]]
		then
		 echo -e "\a"
		 cd ~
		 ls -A1
		 	elif [[ '-' = $1 ]]
			then 
			echo -e "\a"
			cd -
			ls -A1
				else 
				echo -e "\t\t\v\v\a\e[4;31;41m ОШИБКА ВВОДА !!! \e[m "
    				echo -e "\t\t\a\e[1;33;41m ОШИБКА ВВОДА !!! \e[m "
     				echo -e "\t\t\a\e[4;31;41m ОШИБКА ВВОДА !!! \e[m "
	fi
}
alias cd="cd_ls"

