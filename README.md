# termux_passwd.bashrc
# При входе в termux запрашивается ранее установленный пароль.
# При удачном вводе записывается в директорию ~/Logs в файл с названием init.log число и время входа.
# После этого /data/data/com.termux/files/home/termux_passwd.bashrc флаг РФ в качестве приветствия.
# При переходе в любую директорию выводятся все файлы в текущей директории.
# При НЕудачном в туже директорию ,но в файл error_init.log число и время.
# На вход даётся 7 секунд, по истечению которого запускается cmatrix и стирается история ввода команд.
#
# Запуск :
cd termux_passwd.bashrc
bash install.sh
