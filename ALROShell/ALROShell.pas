{
	ALROShell.pp

	Copyright 2015 
	* Ramiro Rivera					<ramarivera@gmail.com>, 
	* David lazbal					<davidlazbal@gmail.com>, 
	* Matín Arrúa					<martin94.profugo@gmail.com>.
	
	Copyright 2014 
	* Fernando Gómez Albornoz 		<fgalbornoz07@gmail.com>.


	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
	MA 02110-1301, USA.
}

Program ALROShell;
Uses BaseUnix, sysutils, unix, comandos, analizador, utilidades,ALR;

var salir: boolean;
	ENTRADA: string;

Begin
pidEnEjec:=-1;					//Inicializacion 
instalarManejadores;			//Instalacion de manejadores de seniales
crearTabla;
writeln(space(15)+'Bienvenido a ALROShell           -Copyright 2013-2015-');
salir:= false;					// Break del ciclo repeat.						
	repeat
		alBG:=false;
		write(CR,copy(TimeToStr(Time),1,5),' ',fpGetEnv('USER'),'# ');	// Fecha y usuario (prompt)
		if length(strSin(dirActual,dirHome)) <= 20 then
			Begin
				if copy(dirActual,1,length(dirHome)) = dirHome then write('~',strSin(dirActual,dirHome),' ') // Directorio (prompt)
				else write('~',dirActual,' ');																 // Directorio (prompt)
			end
		else 	write('~/...',rightStr(strSin(dirActual,dirHome),20),' ');									 // Directorio (prompt)
		readln(ENTRADA);
		limpiarTabla;
		if not(analizar(ENTRADA)) then salir:= true;
	until salir = true;
	writeln();
	writeln('Esta shell no tiene Poderes de Super Vaca');
	writeln('(O si los tiene?)');
	writeln();
End.
