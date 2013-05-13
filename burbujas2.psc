Proceso burbuja
	//ordena de modo descendente el array
	Definir array, aux, j, i Como Entero;
	Dimension array[5];
	
	Para j <- 1 Hasta 5 Hacer
		Escribir "Ingrese un numero";
		Leer array[j];
	FinPara
	
	Para j <- 1 Hasta 5 Hacer
		Para i <- 1 Hasta 4 Hacer
			si array[i] < array[i+1] Entonces
				aux = array[i];
				array[i] = array[i+1];
				array[i+1] = aux;
			FinSi
		FinPara
	FinPara
	
	Para j <- 1 Hasta 5 Hacer
		Escribir "Numero ", j;
		Escribir array[j];
	FinPara
	
FinProceso
