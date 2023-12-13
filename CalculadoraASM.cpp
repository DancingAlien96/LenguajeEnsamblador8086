// ---------------------------------------------------------------------------------------------------------------------
//
// Programa   : CalculadoraASM.CPP
// Utilidad   : Permite Adicionar,Subtraer,Multiplicar,Dividir y Potenciar 2 números  
//              seleccionando opción por medio de un menú de operaciones.
//              Observación: 
//              Cuando se va a hacer Inline Assembly primero hay que mirar el entorno 
//              de desarrollo de C, en este caso es Dev-C++ que es un IDE (Integrated Development Environment)
//              que está construido en Delphi 6 y que usa Mingw port de GCC (GNU Compiler Collection) 
//              como compilador de código C y C++
//              Uso de Libreria de graficación
//              Extensión de la librería no estándar #inclide <winbgim.h> para darle capacidad 3D
//              Incluir en la línea de comandos del LINKER  -lconio -lbgi -lgdi32 -luser32
// Autor      : Ing. hector Azuaje - (Software Developer)
// Codificada : Dev-C++
// Email      : azuajehector@hotmail.com y azuajehector@gmail.com
// Parámetros : Ninguno 
//
// ---------------------------------------------------------------------------------------------------------------------

// Sabiendo que hay sintaxis Intel y AT&T en el lenguaje ensamblador y conociendo la naturaleza de Dev-C++ se debe escoger la sintaxis 
// AT&T debido a que esta se usa en entornos UNIX y la Intel en Windows, estamos en Windows usando Dev-C++ y voy a usar sintaxis para UNIX,
// si así es, recapitulando la naturaleza de Dev-C++, el compilador está basado en GCC que está construido especialmente para sistemas GNU y 
// es totalmente de código abierto o libre
/*+------------------------------+------------------------------------+
|       Intel Code             |      AT&T Code                     |
+------------------------------+------------------------------------+
| mov     eax,1                |  movl    $1,%eax                   |   
| mov     ebx,0ffh             |  movl    $0xff,%ebx                |   
| int     80h                  |  int     $0x80                     |   
| mov     ebx, eax             |  movl    %eax, %ebx                |
| mov     eax,[ecx]            |  movl    (%ecx),%eax               |
| mov     eax,[ebx+3]          |  movl    3(%ebx),%eax              | 
| mov     eax,[ebx+20h]        |  movl    0x20(%ebx),%eax           |
| add     eax,[ebx+ecx*2h]     |  addl    (%ebx,%ecx,0x2),%eax      |
| lea     eax,[ebx+ecx]        |  leal    (%ebx,%ecx),%eax          |
| sub     eax,[ebx+ecx*4h-20h] |  subl    -0x20(%ebx,%ecx,0x4),%eax |
+------------------------------+------------------------------------+*/

// AX: El registro acumulador, dividido en AH y AL (8 bits cada uno). Interviene en las operaciones aritméticas y lógicas.
// BX: Registro base, dividido en BH y BL. Se utiliza en transferencias de datos entre la memoria y el procesador.
// CX: Registro contador, dividido en CH y CL. Se utiliza como contador en bucles (LOOP), en operaciones con cadenas (REP), y en desplazamientos(CL).
// DX: Registro de datos, dividido en DH y DL.- Se utiliza en operaciones de multiplicación y división junto con Ax y en operaciones de entrada y salida 
//     de puertos, su mitad inferior DL contiene el número de puertos.
//
// movl $0xffh, %ebx
// El registro ebx almacena lo que hay en la entrada que es 0ffh, esto es muy importante que lo conozcamos porque ese valor hexadecimal que en el ejemplo di, 
// puede ser una variable entera, un color, un caracter, etc.

// Valores de Colores del Sistema Operativo Windows cuando es invocado desde el comando system()
//---------------+--------------------/
// background    /  foreground        /
// 0 = Black     /	8 = Gray          /
// 1 = Blue      /	9 = Light Blue    /
// 2 = Green     /	A = Light Green   /
// 3 = Aqua      /	B = Light Aqua    /
// 4 = Red 	     /   C = Light Red    /
// 5 = Purple    /   D = Light Purple /
// 6 = Yellow  	 /   E = Light Yellow /
// 7 = White 	 /   F = Bright White /
//---------------+--------------------/

#include<conio.h>     // Libreria que trabaja con comandos de pantalla gotoxy(), clrscr() 
#include<stdio.h>     // Libreria que trabaja con scanf() y printf()
#include<ctype.h>     // Libreria que trabaja con toupper()
#include <stdlib.h>   // Libreria que trabaja con system("cls")
#include <string.h>   // Libreria que trabaja con funciones de cadena
#include "syslib.cpp" // libreria que construye nuevas (FDU) "Tools Case"

void MenuPrin();
void Titulos();
void LeeSuma();
void LeeResta();
void LeeMultiplicacion();
void LeeDivision();
void LeePotenciacion();
void CalculaSuma();
void CalculaResta();
void CalculaMultiplicacion();
void CalculaDivision();
void CalculaPotenciacion();
void Separador(char str[], char s2[],char *ptr, char chartmp[]);
void ImprimeResultado();
void CapturaDatos(int opc);

int numA=0,numB=0,decr=1;;
char tecla, op;

/* ----------------------------------------------------------------------- *
 * --- Cuerpo Principal de C++                                         --- *
 * ----------------------------------------------------------------------- */
int main() 
{
	system("color 9e"); // Establece el Color de Fondo
	MenuPrin();         // Ejecuta Módulo Principal
	return 0; 
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que realiza el Menú de Opciones                       --- *
 * ----------------------------------------------------------------------- */
void MenuPrin()
{ 	 	 	
 	op =' ';
 	while (op!='N')
 	{
	   system("cls"); 		   
	   sysbox(01,01,23,79,01);
 	   Titulos();
 	   gotoxy(20,6) ;printf("[1].- Suma  / Adiccion       ");
 	   gotoxy(20,7) ;printf("[2].- Resta / Subtraccion    ");
 	   gotoxy(20,8) ;printf("[3].- Multiplicacion         ");
 	   gotoxy(20,9) ;printf("[4].- Division               ");
 	   gotoxy(20,10);printf("[5].- Potenciacion           ");
 	   gotoxy(20,11);printf("[6].- Salir                  "); 	
 	   gotoxy(20,15);printf("Seleccione una Opcion:       ");
 	   tecla=' ';
 	   tecla= getche();
 	   switch(tecla)
 	   {
   	 	   case 49:LeeSuma();           break; // Pulso 1
		   case 50:LeeResta();          break; // Pulso 2
 		   case 51:LeeMultiplicacion(); break; // Pulso 3
	 	   case 52:LeeDivision();       break; // Pulso 4
		   case 53:LeePotenciacion();   break; // Pulso 5
   	       case 54: op='N';             break; //exit(0);
    	   default:
    	   	    system("cls"); 		   
	            sysbox(01,01,23,79,01);
 	            Titulos();
			    gotoxy(10,10);printf("Opcion invalida... Por favor ingrese un numero establecido.");
			    gotoxy(10,11);printf("... Presione cualquier tecla para retornar al menu ...     ");
			    getch();	
	    }  
	}	
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que despliega los Titulos de la Apliación             --- *
 * ----------------------------------------------------------------------- */
void Titulos()
{
 	gotoxy(20,2) ;printf("PROGRAMACION DEV-C++ con Assembler                      ");
    gotoxy(20,4) ;printf("Menu Principal - Aplicacion Calculadora Basica          ");
    gotoxy(10,20);printf("Ingenieria de Software - (c) 2014 por Ing. Hector Azuaje");
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que realiza la Lectura de Suma o Adiccion de Variables--- *
 * ----------------------------------------------------------------------- */
void LeeSuma()
{
 	fflush(stdin);
    fflush(stdout);
    system("cls"); 		   
	sysbox(01,01,23,79,01);
 	Titulos();    
 	gotoxy(20,10);printf("Operacion de Adicion");
 	gotoxy(20,12);printf("Ingrese la Operacion(a+b): ");
 	CapturaDatos(1); 	
}

/* --------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Lectura de Resta o Subtracción de Variables--- *
 * --------------------------------------------------------------------------- */
void LeeResta()
{
 	fflush(stdin);
    fflush(stdout);
    system("cls"); 		   
	sysbox(01,01,23,79,01);
 	Titulos();    
 	gotoxy(20,10);printf("Operacion de Subtraccion.");
 	gotoxy(20,12);printf("Ingrese la Operacion(a-b): ");
 	CapturaDatos(2);
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que realiza la Lectura de Multiplicación de Variables --- *
 * ----------------------------------------------------------------------- */
void LeeMultiplicacion()
{
 	fflush(stdin);
    fflush(stdout);
 	system("cls"); 		   
	sysbox(01,01,23,79,01);
 	Titulos();
 	gotoxy(20,10);printf("Operacion de Multiplicacion.");
 	gotoxy(20,12);printf("Ingrese la Operacion(a*b): ");
 	CapturaDatos(3);
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que realiza la Lectura de División de Variables       --- *
 * ----------------------------------------------------------------------- */
void LeeDivision()
{
 	fflush(stdin);
    fflush(stdout);
    system("cls"); 		   
	sysbox(01,01,23,79,01);
 	Titulos();    
 	gotoxy(20,10);printf("Operacion de Division.");
 	gotoxy(20,12);printf("Ingrese la operacion(a/b): ");
 	CapturaDatos(4);
}

/* ----------------------------------------------------------------------- *
 * --- Subrutina que realiza la Lectura de Potenciación de Variables   --- *
 * ----------------------------------------------------------------------- */
void LeePotenciacion()
{
 	fflush(stdin);
    fflush(stdout);
    system("cls"); 		   
	sysbox(01,01,23,79,01);
 	Titulos();
 	gotoxy(20,10);printf("Operacion de potenciacion.");
 	gotoxy(20,12);printf("Ingrese la operacion(a^b): ");
 	CapturaDatos(5);
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Suma o Adiccion de Variables en Assembler --- *
 * -------------------------------------------------------------------------- */
void CalculaSuma() 
{
   //Uso notación AT&T
   __asm("movl _numA, %ebx ") ;        // Muevo lo que hay en la variable global al acumulador b
   __asm("movl _numB, %eax") ;         // Se lee de derecha a izquierda
   __asm("addl %ebx,%eax");            // Adiciono lo que hay en el registro ebx en eax
   __asm("movl %eax, _numA") ;         // Muevo el contenido de lo que hay en el registro a la variable global
} 

/* ------------------------------------------------------------------------------ *
 * --- Subrutina que realiza la Resta o Subtracción de Variables en Assembler --- *
 * ------------------------------------------------------------------------------ */
void CalculaResta()
{
	__asm("movl _numA, %eax");
	__asm("movl _numB, %ebx");
	__asm("sub %ebx, %eax");
	__asm("movl %eax, _numA");
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Multiplicación de Variables en Assembler  --- *
 * -------------------------------------------------------------------------- */
 void CalculaMultiplicacion()
{
	__asm("movl _numA, %eax");
	__asm("movl _numB, %ebx");
	__asm("imull %ebx");             // Multiplica ebx con eax y queda en memoria el resultado almacenado en eax
	__asm("movl %eax, _numA");
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la División de Variables en Assembler        --- *
 * -------------------------------------------------------------------------- */
void CalculaDivision()
{
	__asm("movl _numA, %eax");
	__asm("movl _numB, %ebx");
	__asm("cltd");                   //  Se usa para el signo por lo que se guarda en el registro Data, para GAS en 32 bits es necesario esto
	__asm("idivl %ebx");
	__asm("movl %eax, _numA");
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Potenciación de Variables en Assembler    --- *
 * -------------------------------------------------------------------------- */
void CalculaPotenciacion()
{   
	decr = numB - 1;                 // Inicializo la condición del loop en un decremento
	__asm("movl _numA, %eax");       // Muevo al registro lo que hay en numA
	__asm("movl _numA, %ebx");       // Hago lo mismo para no alterar el resultado
	__asm("movl _decr, %ecx");       // Asigno la condición que se evalúa hasta que sea cero
	__asm("CICLO_PARA_ELEVAR:");     // Hago el label del loop
	__asm("imull %ebx, %eax");       // Multiplico el registro ebx con eax
	__asm("loop CICLO_PARA_ELEVAR"); // Itero hasta que el registro ecx sea cero
	__asm("movl %eax, _numA");       // Muevo el resultado a la variable para imprimirlo
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Captura de Datos desde el Teclado         --- *
 * -------------------------------------------------------------------------- */
void CapturaDatos(int opc)
{	
 	char str[MAX_PATH], chartmp[MAX_PATH]; 	
 	char *ptr;
 	fgets(str,MAX_PATH+1,stdin);
 	fflush(stdin);
    fflush(stdout);
    if(strlen(str)>3)
    {
		if(opc==1)
		{
			char s2[4] = "+\n\t";
			Separador(str, s2, ptr, chartmp);
		}
		else if(opc==2)
		{
			char s2[4] = "-\n\t";
		 	Separador(str, s2, ptr, chartmp);
		}
		else if(opc==3)
		{
			char s2[4] = "*\n\t";
			Separador(str, s2, ptr, chartmp);
		}
		else if(opc==4)
		{
			char s2[4] = "/\n\t";
			Separador(str, s2, ptr, chartmp);
		}
		else if(opc==5)
		{
			char s2[4] = "^\n\t";
			Separador(str, s2, ptr, chartmp);
		}	 		 	
	    switch(opc)
	    {
		   case 1:
			 	CalculaSuma();
			 	break;
		   case 2:
				 CalculaResta();
				 break;
	 	   case 3:
			 	 CalculaMultiplicacion();
			 	 break;
	  	   case 4:
			  	 CalculaDivision();
			  	 break;
	   	   case 5:
			   	 CalculaPotenciacion();
			   	 break;
		   default:
				 system("cls");
				 Titulos();
				 gotoxy(10,10);printf("!Error! Ha ocurrio un proceso inesperado, se va a cerrar este programa, presione una tecla y vuelva a abrir");
				 getch();
				 exit(0);
   	   }
	   ImprimeResultado();
	 }
	 else
	 {
		switch(opc)
	    {
		   case 1:
			 	LeeSuma();
			 	break;
			case 2:
				LeeResta();
				break;
	 		case 3:
			 	LeeMultiplicacion();
			 	break;
	  		case 4:
			  	LeeDivision();
			  	break;
	   		case 5:
			   	LeePotenciacion();
			   	break;
			default:
				system("cls");
				Titulos();
				gotoxy(10,10);printf("!Error! Ha ocurrio un proceso inesperado, se va a cerrar este programa, presione una tecla y vuelva a abrir");				
				getch();
				exit(0);
   		}
	 }
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Separación de las 2 Variables             --- *
 * -------------------------------------------------------------------------- */
void Separador(char str[], char s2[],char *ptr, char chartmp[])
{		
	ptr = strtok( str, s2 );
	strcpy(chartmp,ptr); 	
 	if(isdigit(chartmp[0]))
 	{
	 	numA = atoi(chartmp);
	}
 	while( (ptr = strtok( NULL, s2 )) != NULL )    // Posteriores llamadas
 	{
	     strcpy(chartmp,ptr); 	
	 	 if(isdigit(chartmp[0]))
	 	 {
		 	numB = atoi(chartmp);
		 }
	     break;
    }
}

/* -------------------------------------------------------------------------- *
 * --- Subrutina que realiza la Muestra de Resultados del Cálculo Realizado-- *
 * -------------------------------------------------------------------------- */
void ImprimeResultado()
{
 	 gotoxy(20,15);printf("El resultado es: %d", numA);
	 gotoxy(20,17);printf("Presione una tecla para retornar al menu");
	 getch(); 
}
