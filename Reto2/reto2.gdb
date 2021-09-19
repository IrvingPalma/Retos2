
set logging file output.txt


set print pretty on


set logging on


set pagination off


file reto2


b _start
r
b bucle1
c 
define hook-echo
echo <<<---
end


define hookpost-echo
echo --->>>\n
end

define log
	printf "Suma cifras factoriales de N: %d\n", $arg0
end

define log2
	printf "N actual value es %d\n", $arg0
end
define log3
	printf "contador value es %d\n", $arg0
end
define log4
	printf "valorFactorial value es %d\n", $arg0
end
echo INICIO
define log5
	printf "Cifra es %d\n", $arg0
end

echo DIVISIONES PARA HALLAR FACTORIAL DE CADA CIFRA DEL N

set $suma=$r11
set $numero=$eax
set $limite=0

b numDividido
b factorial 
b factoParcial
log $suma
log2 $numero
echo ///////////////////////////////////////////////
while($numero!=$limite)
   c
   set $numero=$eax
   log2 $numero
   c 
   echo *********************************************
   set $cifra=$r12
   log5 $cifra
   set $contador=$rcx
   echo HALLANDO SU FACTORIAL
   while($contador<=$cifra)
	   c
	   log3 $contador
       set $prodParcial=$rax
       log4 $prodParcial
       c
	   set $contador=$rcx
   end	
   c
   set $suma=$r11
   log $suma
   echo *********************************************
end 
echo ///////////////////////////////////////////////











