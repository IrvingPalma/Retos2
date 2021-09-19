
set logging file output.txt


set print pretty on


set logging on


set pagination off


file sumatoria


b _start
r
b comp1
c
b bucle2
b bucle3
define hook-echo
echo <<<---
end


define hookpost-echo
echo --->>>\n
end

define log
	printf "valor de n: %d\n", $arg0
end

define log2
	printf "sumParcialN value is %d\n", $arg0
end
define log3
	printf "contador value is %d\n", $arg0
end
define log4
	printf "sumParcialContador value is %d\n", $arg0
end
echo INICIO
define log5
	printf "sumFinal value is %d\n", $arg0
end

echo TERMINO_IZQUIERDO


set $limite=$ebx
set $valn=$ecx
while($valn<=$limite)
  log $valn
  c
  set $sumaContador=$r10
  set $contador=$r9
  log3 $contador
  log4 $sumaContador
  c

  while($contador!=$valn)
    set $sumaContador=$r10
    set $contador=$r9
    log3 $contador
    log4 $sumaContador
    set $vala=$rax
    c
  end
  set $suma=$r11
  log2 $suma
  echo *********************************************************

  set $valn=$ecx
end 
log5 $suma
echo //////////////////////////////////////////////////////////

c
echo TERMINO_DERECHA
set $limite=$rbx
set $contador=$r11
set $producto=$rcx
define log6
	printf "productParcial value is %d\n", $arg0
end
define log7
	printf "2^n+1 value is %d\n", $arg0
end
log3 $contador
log6 $producto
while($contador!=$limite)
    c
    set $contador=$r11
    set $producto=$rcx
    log3 $contador
    log6 $producto
end

b finDer
c
log7 $eax


echo FIN 

