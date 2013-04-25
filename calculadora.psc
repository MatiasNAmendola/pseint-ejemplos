Proceso calculadora
	Definir num1, num2, res Como Entero;
	Definir signo Como Caracter;
	
	Escribir "Escribe los dos numeros";
	Leer num1;
	Leer num2;
	Escribir "Signo? (+/-)";
	Leer signo;
	
	Si signo = '+' Entonces
		res = num1 + num2;
	Sino
		res = num1 - num2;
	FinSi
	
	Escribir res;
	
FinProceso
