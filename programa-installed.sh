#!/bin/env bash

# Rodrigo rocha de Oliveira <contatorodrigorochadeoliveira@gmail.com>
# Version: 1.0
# Programa que verifica no sistama se o pacote esta instalado ou não. Depois pergunta se o user deseja instalar o apcote.
# tbm faz uma verificação se há internet, caso não tenha internet o programa fecha. 


# ver se um programa esta instalado no systema:

 var
pc="$1"

# limpar a tela:
clear

# chamar o programa:
which "$pc" &>/dev/null

if [ $? -eq 0 ];then
	echo -e "\033[33;1mPrograma Instalado.\033[m"
else
	echo -e "\033[31;1mPrograma Não Instalado.\033[m"
fi
# menu coma as opções:
	echo -e "\033[37;1m
		1)Deseja Instalar o Programa?
		2)Deseja remover o programa?
		3)Deseja Sair?	 
		

	
             \033[m"

	echo -e "\033[37;1mEscolha Sua Opcao:\033[m " 
	read opc

	case $opc in

	1) 	# testar a internet
		ping -w1 www.google.com.br >/dev/null 2>&1
		while [ $? != 0 ];do
		echo -e "\033[31;1mSem Internet.\033[m"
		sleep 2s
		pint -w1 www.google.com.br >/dev/null 2>&1
		done
		echo -e "\033[37;1m[ok] Temos internet.\033[m" 
		# faz um update e instalar o pacote
		sudo apt update ;
		sudo apt install -y "$pc" && exit 0;
		
		;;

	2)
		sudo apt autoremove -y "$pc";
		sudo apt update;
		;;

	3)
		exit 
		;;
		
		# caso digite algo por enganho, esta opcao sai do programa.
	*) echo -e "\033[31;1mOpção $opc Desconhecida, saindo.\033[m"
		exit 1
	;;
	esac
   
