//-----------------------------------------------------------------------------
//
// Title       : Ejercicio2
// Design      : 2do_Parcial_62529
// Author      : cmeichtry@itba.edu.ar
// Company     : ITBA
//
//-----------------------------------------------------------------------------
//
// Description : En este archivo se encuentra el ejercicio 2 del segundo
//               parcial de E3, en el mismo se encuentra el modulo solicitado
//               en la consigna.
//
//-----------------------------------------------------------------------------
`timescale 1 ns / 1 ps

module Ejercicio2 ( IN ,ERROR ,UNLOCK, resetn, clk );
	
	input IN, resetn, clk;
	output reg ERROR ;
	output reg UNLOCK ;
	
	parameter [3:0] inicio 	= 4'b0000;	
	parameter [3:0] A 		= 4'b0001;
	parameter [3:0] B 		= 4'b0010;
	parameter [3:0] C 		= 4'b0011;
	parameter [3:0] D 		= 4'b0100;
	parameter [3:0] E 		= 4'b0101;
	parameter [3:0] F 		= 4'b0110;
	parameter [3:0] unlock 	= 4'b0111;
	parameter [3:0] error1 	= 4'b1000;
	parameter [3:0] error2 	= 4'b1001;
	
	reg [3:0] act, prox;
	
	always @(IN, act)
		begin
			case(act)
				inicio: 
					begin
						if(IN) prox=A;
						else prox=error1;
					end
				A:
					begin
						if(!IN) prox=B;
						else prox=error1;
					end
				B:
					begin
						if(IN) prox=C;
						else prox=error1;
					end
				C:
					begin
						if(IN) prox=D;
						else prox=error1;
					end
				D:
					begin
						if(!IN) prox=E;
						else prox=error1;
					end
				E:
					begin
						if(!IN) prox=F;
						else prox=error1;
					end
				F:
					begin
						if(!IN) prox=unlock;
						else prox=error1;
					end
				unlock:
					begin
						if(!IN) prox=unlock;
						else prox=inicio;
					end
				error1: prox=error2;
				error2:	prox=inicio;
			endcase
		end
	
	always @(negedge resetn, posedge clk)
		begin
			if (resetn == 0)
				act <= inicio;
			else
				act <= prox;
		end
	
	always @(act)
		begin
			if (act == unlock)
				begin
					UNLOCK = 1;
					ERROR = 0;
				end
			else if (act == error1 || act == error2)	
				begin
					UNLOCK = 0;
					ERROR = 1;
				end
			else	 
				begin
					UNLOCK = 0;   
					ERROR = 0;
				end
		end
endmodule 										   