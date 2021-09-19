set logging file output.txt


set print pretty on


set logging on


set pagination off


file reto3


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
	printf "Posición %d\n", $arg0
end

define log2
	printf "Letra copiada %c\n", $arg0
end
define log3
	printf "contador value es %d\n", $arg0
end

echo INICIO
echo ///////////////////////////////////////////////////////////

echo COPIADODECADENA1ENBSS

set $contador=$rcx
set $limite=$rbx



while($contador<=$limite)
    c
    set $contador=$rcx
    log $contador
    set $letra=$r10
    log2 $letra
end

define log4
	printf "ValorDeCaden1 en esa posición es %c\n", $arg0
end

define log5
	printf "ValorDeCaden2 en esa posición es %c\n", $arg0
end
echo ///////////////////////////////////////////////////////////
echo COMPARACIÓN DE CADENAS PARA VERIFICAR SI SON PALINDROMO


b bucle2
c
set $cadena1=0
set $cadena2=0
set $posicion=$rcx
set $limite=$rax
while($posicion!=$limite && $cadena1==$cadena2)
    c
    set $posicion=$rcx
    log $posicion
    set $cadena1=$bl
    set $cadena2=$dl
    log4 $cadena1
    log5 $cadena2

end

echo ///////////////////////////////////////////////////////////