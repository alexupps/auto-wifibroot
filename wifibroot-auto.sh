#!/bin/bash
version=0.1Beta
# Created by alexupps to make easy install WiFi Boot Installer.
# Any problem of this contact with me alexupps@gmail.com.
# Corrections and improvements in the code by crash
#Funciones
wb="WiFiBroot Auto Installer & Dependences 2018"
clear
echo -e "$wb"
sleep 3
echo -e "
Comprobando Scapy..."
if scapy -h
then
	echo -e "\033[32m
Scapy instalado\E[0m" 
else
	sudo apt install scapy-python
fi
sleep 3
clear
echo -e "$wb

Instalando python en el caso de no estar instalado.."
if python -V
then
	echo -e "\033[32m
python instalado\E[0m "
else
	sudo apt-get install python
fi
sleep 3
clear
echo -e "$wb

Instalando dependencias necesarias para el crack WPA..."
if apt list | grep python-pbkdf2 | grep instalado
then
	echo -e "\033[32m 
python-pbkdf2 instalado\E[0m "
else
	sudo apt install python-pbkdf2
fi
sleep 3
clear
echo -e "$wb

Descargando WiFiBroot desde Github..."
if git
then
	sudo git clone https://github.com/hash3liZer/WiFiBroot.git
	sleep 3
	clear
	echo -e "$wb

Entrando al directorio de WiFiBroot..."
	if [ -d WiFiBroot ];
	then
		cd WiFiBroot
		sudo python wifibroot.py -h
		sleep 3
		clear
	else
		echo "\033[31mpor algun motivo no puede entrar al directorio, falló en la descarga,
o no esta situado correctamente en la ruta.\E[0m"
	fi
else
	wget https://github.com/hash3liZer/WiFiBroot/archive/master.zip
	echo "
descomprimiendo archivo..."
	unzip master.zip
	echo -e "$wb

Entrando al directorio de WiFiBroot-master...

\033[1;33mdebe estar situado en la misma ruta del script en la terminal.\E[0m
"
	sleep 3
	if [ -d WiFiBroot-master ];
	then
		cd WiFiBroot-master
		sudo python wifibroot.py -h
		sleep 3
		clear
	else
		echo "\033[31mpor algun motivo no puede entrar al directorio, falló en la descarga,
o no esta situado correctamente en la ruta.\E[0m"
	fi
fi
echo -e "$wb

Instrucciones:
-Hay que ejecutar el script con derechos de administrador:
\033[1;33m 'sudo python wifibroot.py <opcion>'\E[0m"
 sleep 5
echo -e "
La consola se cerrará en 10 segundos automaticamente.
alexupps (c)2018."
sleep 10
exit
