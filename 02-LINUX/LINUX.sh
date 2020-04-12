




*********************
*Comandos GNU e Unix* ---PAGINA 63---
*********************

$ alias rm='rm -ir'  ; i=confirmar exclusao ; r=pastas(recursivament)
$ alias              ; exibe todos os alias


$ ./script.sh	     ;./->Dentro do diretório atual e fora de PATH

$ echo $PATH	     ; exibe o conteúdo da variável PATH

$ env				;variaveis exportadas para as demais sessoes do shell
HOSTTYPE=x86_64
LANG=C.UTF-8
WSL_DISTRO_NAME=Ubuntu
USER=ytallopessoa
PWD=/home/ytallopessoa
HOME=/home/ytallopessoa
NAME=DESKTOP-OIP8BN9
XDG_DATA_DIRS=/usr/local/share:/usr/share:/var/lib/snapd/desktop
SHELL=/bin/bash
TERM=xterm-256color
SHLVL=1
MANPATH=/home/linuxbrew/.linuxbrew/share/man:
LOGNAME=ytallopessoa


$ export PATH=$PATH:/usr/local/bin  ;inclui /usr/local/bin em PATH


$ export TESTE='ola mundo'          ; cria variavel de ambiente para a sessao
$ echo $TESTE
ola mundo


$ pwd
/home/ytallopessoa
$ echo $PWD 			;$ para ver o valor 
/home/ytallopessoa


$ set TESTE='ronaldo'   ; atribui a variavel $TESTE o valor ronaldo
$ unset TESTE   		; exclui a variavel $TESTE


**Comandos sequenciais

$ comando1  ; comando2     ; executa os dois 
$ comando1 && comando2     ;apenas se o comando1 for bem sucedido(retornou 0)     
$ comando1 || comando2     ; apenas se o comando1 não foi bem sucedido



~$ whatis ls
ls  (1)               - list directory contents
$ whatis pwd
pwd (1)              - print name of current/working directory


===LER ARQUIVOS===
$cat  			;exibe arquivo
$cat -b  		;numera linhas
$tac 	 		;de trás pra frente
$head -n 11 <file>
$tail -n 11 <file>
$tail -f 			;f=follow, continar mostrando dinamicamente

$wc -l -w -c ; linhas, palavras, caracteres
$nl 


**Concatenar arquivo:
$ nano teste1.txt
$ nano teste2.txt
$ nano teste3.txt
$ cat teste* > arquivo    ; concatena um abaixo do outro
$ paste teste* > arquivo2 ; concatena um ao lado do outro


$sort 		;alfabeticamente
$sort -n  ;numericamente 
$sort -r   ;reverse



=====Gerenciamento básico de arquivos====

$ .  	; diretorio atual
$ .. 	;diretorio superior ao atual


$ ls - l /etc/X11/xinit/               
-rw-r--r--   1           root    root     321    2003-03-16   18:36         README.Xmodmap
permissoes   hardlinks   dono   grupo    bytes       data     modificacao    arquivo


**Saber detalhes do arquivo:
$ file face.png
$ file separate.txt


***Manipulando arquivo e diretórios:
$ cp -ipr <file> 

$ mkdir -p caminho/completo/para/dir  ;cria todas as pastas em recursivamente


***Condensação de arquivos
$ tar cvf etc.tar /etc   ; aglutina "/etc" em "etc.tar"
$ tar xvf etc.tar        ; desaglutinar
$ gzip etc.tar			 ;compactar gzip:mais rapido
ou
$ bzip2 etc.tar		 	;bzip2:mais eficiente na compressao


***Caracteres curinga e englobamento
$ ls /etc/host*  	;qualquer sequencia
$ ls /dev/fd?	 	;apenas um 
$ ls /dev/hd[abc]	;uma lista
$ ls /dev/{hda,fdO} ;termos

$ ls /dev/fd[!Ol]  ; excluindo o termo

$ ls /dev/fd\[\!01\]  ; precedidos por \ nao realiza substituicao

***Encontrando arquivos:
$ find <diretório> <critério>




















