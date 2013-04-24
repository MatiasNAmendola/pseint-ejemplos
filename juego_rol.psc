// PROBLEMA 1: no se pueden usar variables globales
// PROBLEMA 2: codigo secuencial, no puede llamar funciones de lineas posteriores
// PROBLEMA 3: necesidad de declarar un entero como solo positivo

// sistema de batallas
SubProceso batalla(hp_jug,plata_jug,atq_jug,def_jug,hp_enem,atq_enem,def_enem)
  Definir i como entero;
	i = 1;
	Mientras hp_jug > 0 o hp_enem > 0 Hacer
		// random de ataque y defensa
		rand_atq_jug = azar(atq_jug);
		rand_def_jug = azar(def_jug);
		rand_atq_enem = azar(atq_enem);
		rand_def_enem = azar(def_enem);
		// ataque - defensa = hp - diferencia
		res_atq_jug = rand_def_jug - rand_atq_jug;
		hp_enem = hp_enem - res_atq_jug;
		res_atq_enem = rand_def_jug - rand_atq_enem;
		hp_jug = hp_jug - res_atq_enem;
		// impresion de la batalla
		Escribir "Hit ",i;
		Escribir "HP Enemigo: ",hp_enem;
		Escribir "HP Jugador: ",hp_jug;
		Escribir "Jugador ataca con ",res_atq_jug," a Enemigo";
		Escribir "Enemigo ataca con ",res_atq_enem," a Jugador";
		i = i + 1;
	FinMientras

	Si hp_jug > hp_enem Entonces
		Escribir "Gana Jugador";
	Sino
		Escribir "Gana Enemigo";
	FinSi

	Esperar Tecla;
FinSubProceso
// funcion para la ayuda
SubProceso ayuda
	Escribir "Caves es un juego creado por Maxwell Studios.";
	Escribir "Somos dotados de un personaje que posee distintos";
	Escribir "atributos que nos ayudaran a combatir enemigos y adquirir habilidades.";
	Escribir "Presiona una tecla para volver al menu";
	Esperar Tecla;
FinSubProceso
// funcion para ver tienda
SubProceso tienda(plata,atq,def)
	Definir v_opcion como Entero;
	Escribir dinero;
	Escribir "1 - Aumentar ataque+2 (costo $10)";
	Escribir "2 - Aumentar defensa+2 (costo $15)";
	Escribir "3 - Salir";
	Leer v_opcion;

	Si dinero < 15
		Escribir "No tienes suficiente dinero";
	Sino
		Segun v_opcion Hacer
			1:
				plata = plata - 10;
				dinero = plata;
				atq = atq + 2;
				ataque = atq;
				Escribir "Ataque ha aumentado a ",ataque;
				Esperar 1 Segundos;
			2:
				plata = plata - 15;
				dinero = plata;
				def = def + 2;
				defensa = def;
				Escribir "Defensa ha aumentado a ",defensa;
				Esperar 1 Segundos;
			3:
				Escribir "Adios!";
				Esperar 1 Segundos;
			De Otro Modo:
				Escribir "La opcion no es valida";
				tienda(dinero,ataque,defensa);
		FinSegun
	FinSi
FinSubProceso
// funcion para lugares
SubProceso lugares(key,hp_jug,plata_jug,atq_jug,def_jug)
	Si hp_jug < 1 Entonces
		Escribir "No tenes vida suficiente";
	Sino
		Segun key Hacer
			30:
				hp_enem = azar(30) + 1;
				atq_enem = azar(15) + 1;
				def_enem = azar(15) + 1;
				Escribir "Cueva Likos";
				batalla(hp_jug,plata_jug,atq_jug,def_jug,hp_enem,atq_enem,def_enem);
			40:
				hp_enem = azar(40) + 1;
				atq_enem = azar(25) + 1;
				def_enem = azar(25) + 1;
				Escribir "Montaña Ross";
				batalla(hp_jug,plata_jug,atq_jug,def_jug,hp_enem,atq_enem,def_enem);
			50:
				hp_enem = azar(50) + 1;
				atq_enem = azar(35) + 1;
				def_enem = azar(35) + 1;
				Escribir "Monte Gorum";
				batalla(hp_jug,plata_jug,atq_jug,def_jug,hp_enem,atq_enem,def_enem);
			60:
				hp_enem = azar(60) + 1;
				atq_enem = azar(45) + 1;
				def_enem = azar(45) + 1;
				Escribir "Cueva Silik";
				batalla(hp_jug,plata_jug,atq_jug,def_jug,hp_enem,atq_enem,def_enem);
		FinSegun
	FinSi
FinSubProceso
// funcion para recuperar estatus	
SubProceso recuperaStatus(vida,dinero,ataque,defensa)
	Escribir "Vida = ",vida;
	Escribir "Dinero = ",dinero;
	Escribir "Ataque = ",ataque;
	Escribir "Defensa = ",defensa;
	Escribir "Pulsa un tecla para continuar";
	Esperar Tecla;
FinSubProceso
// funcion del menu
SubProceso leerMenu(vida,dinero,ataque,defensa)
	Definir opcion_elegida Como Entero;
	Borrar Pantalla;
	Escribir "1 - Status";
	Escribir "2 - Tienda";
	Escribir "3 - Cueva Likos";
	Escribir "4 - Montaña Ross";
	Escribir "5 - Monte Gorum";
	Escribir "6 - Cueva Silik";
	Escribir "7 - Ayuda";
	Leer opcion_elegida;

	Segun opcion_elegida Hacer
		1:
			recuperaStatus(vida,dinero,ataque,defensa);
		2:
			tienda(dinero,ataque,defensa);
		3:
			lugares(30,vida,dinero,ataque,defensa);
		4:
			lugares(40,vida,dinero,ataque,defensa);
		5:
			lugares(50,vida,dinero,ataque,defensa);
		6:
			lugares(60,vida,dinero,ataque,defensa);
		7:
			ayuda();
		De Otro Modo:
			Escribir "Eso no es una opcion valida";
			Esperar 1 Segundos;
	FinSegun
	leerMenu(vida,dinero,ataque,defensa);
FinSubProceso

Proceso juego
//variables de estado del jugador
	Definir vida, ataque, defensa Como Entero;
	Definir dinero Como Real;
// inicializar variables
	vida = 100;
	dinero = 50;
	ataque = 5;
	defensa = 10;
// mensaje bienvenida
	Escribir "Bienvenido a Caves. El objetivo del juego es pasar los distintos niveles enfrentando enemigos y ganando dinero y experiencia.";
	Escribir "Primero te voy a comentar tu estatus. Tienes:";
	recuperaStatus(vida,dinero,ataque,defensa);
	Escribir "Siempre puedes consultar tu estatus desde el menu principal. Bien, comencemos con la aventura! Pulsa cualquier tecla para continuar";
	Esperar Tecla;
	leerMenu(vida,dinero,ataque,defensa);
FinProceso
