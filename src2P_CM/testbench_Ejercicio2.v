//-----------------------------------------------------------------------------
//
// Title       : testbench_Ejercicio2
// Design      : 2do_Parcial_62529
// Author      : cmeichtry@itba.edu.ar
// Company     : ITBA
//
//-----------------------------------------------------------------------------
//
// Description : En este archivo se encuentra el testbench del ejercicio 2 
//               del segundo parcial de E3, en el mismo se encuentran los 
//				 testbench de los modulos implementados en Ejercicio2.v
//
//-----------------------------------------------------------------------------


/*test_unlock_Ejercicio2: esta prueba SOLO chequea que ocurre cuando se 
introduce una secuencia válida, dejando IN = 0 al final,*/
module test_unlock_Ejercicio2();
	reg IN ,ERROR ,UNLOCK, resetn, clk;
	Ejercicio2 U0( IN ,ERROR ,UNLOCK, resetn, clk );
	
	always
		#5ns clk=~clk;
	
	initial
		begin
			clk=0;
			resetn=0;
			#0ns
			resetn=1;
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=1;
			#10ns
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=0;
			#10ns
			IN=0;
			#10ns
			IN=0;
			#10ns
			IN=0;
		end
endmodule

/*test_error_Ejercicio2: esta prueba chequea que ocurre cuando se introduce una  
secuencia incorrecta, deja IN=1 al final, lo cuál seguirá generando errores*/
module test_error_Ejercicio2();
	reg IN ,ERROR ,UNLOCK, resetn, clk;
	Ejercicio2 U0( IN ,ERROR ,UNLOCK, resetn, clk );
	
	always
		#5ns clk=~clk;
	initial
		begin
			clk=0;
			resetn=0;
			#0ns
			resetn=1;
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=1;
			#10ns
			IN=0; //se introduce un error en la secuencia
			#10ns
			IN=1;
		end
endmodule 

/*test_Ejercicio2: esta prueba chequea que ocurre cuando se introduce una  
secuencia incorrecta, seguida de una secuencia válida, dejando IN=0 al final*/
module test_Ejercicio2();
	reg IN ,ERROR ,UNLOCK, resetn, clk;
	Ejercicio2 U0( IN ,ERROR ,UNLOCK, resetn, clk );
	
	always
		#5ns clk=~clk;
	initial
		begin
			clk=0;
			resetn=0;
			#0ns
			resetn=1;
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=1;
			#10ns
			IN=0; //se introduce un error en la secuencia
			#25ns
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=1;
			#10ns
			IN=1;
			#10ns
			IN=0;
			#10ns
			IN=0;
			#10ns
			IN=0;
			#10ns
			IN=0;
		end
endmodule