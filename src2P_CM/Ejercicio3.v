//-----------------------------------------------------------------------------
//
// Title       : Ejercicio3
// Design      : 2do_Parcial_62529
// Author      : cmeichtry@itba.edu.ar
// Company     : ITBA
//
//-----------------------------------------------------------------------------
//
// Description : En este archivo se encuentra el ejercicio 3 del segundo 
//               parcial de E3, en el mismo se encuentran los modulos 
//				 correspondientes a los incisos a, b y c, junto al testbench
//				 de cada uno.
//
//-----------------------------------------------------------------------------


/*   Ejercicio 3A - Priority Encoder   */
module priority_encoder(ENA, IN, A1, A0, GS, EO);
	input wire ENA;
	input wire [3:0] IN;
	output wire A1, A0, GS, EO;
	reg [3:0] aux;
	
	always@(IN, ENA)
		begin
			if(ENA) aux = 4'b0000;
			else
				begin
					if(IN==4'b0000) aux = 4'b0001;
					else if(IN[0]) aux = 4'b1110;
					else if(IN[1]) aux = 4'b1010;
					else if(IN[2]) aux = 4'b0110;
					else aux = 4'b0010;
				end
		end
	
	assign A1 = aux[3];	
	assign A0 = aux[2];
	assign GS = aux[1];
	assign EO = aux[0];
	
endmodule

/*   Ejercicio 3A - TestBench  Priority Encoder   */
module test_priority_encoder();
	reg [3:0] IN;
	reg ENA, A1, A0, GS, EO;
	
	priority_encoder U0(ENA, IN, A1, A0, GS, EO);
	
	initial
		begin
			ENA = 0;
			#5ns
			IN = 4'b0000;
			#5ns
			IN = 4'b0001;
			#5ns
			IN = 4'b0010;
			#5ns
			IN = 4'b0100;
			#5ns
			IN = 4'b1000;
			#5ns
			IN = 4'b1101;
			#5ns
			ENA=1;
			
		end
endmodule

/*   Ejercicio 3B - Shift Register   */
module sr_sipo4(clk, ena, reset, ser_in, par_out);
	input wire clk, ena, reset, ser_in;
	output wire [3:0] par_out;
	reg [3:0] tmp;
	
	always @(posedge clk)
		begin
			if (ena)
				begin
					tmp = tmp << 1;
					tmp[0] = ser_in;
				end
		end
	
	always @(posedge reset, posedge clk)
		begin
			if(reset==1) tmp = 4'b0000; 
		end
	
	assign par_out = tmp;
endmodule

/*   Ejercicio 3B - TestBench Shift Register   */
module test_sr_sipo4();
	reg clk, ena, reset, ser_in;
	reg [3:0] par_out;
	sr_sipo4 U0(clk, ena, reset, ser_in, par_out);
	
	always
		#5ns clk=~clk;
	
	initial
		begin
			clk=0;
			ena=1;
			reset=1;
			reset=0;
			ser_in=0; 
			#10ns
			ser_in=1;
			#10ns
			ser_in=0;
			#10ns
			ser_in=1;
			#10ns
			ser_in=1;
		end
endmodule 

/*Ejercicio 3C - Modulo integrador de Shift Register y Priority Encoder  */
module modulo_ej3();
	reg clk, ena, reset, ser_in,A1, A0, GS, EO;
	reg [3:0] par_out;
	
	sr_sipo4 UT0(clk, ena, reset, ser_in, par_out);
	priority_encoder UT1(!ena, par_out, A1, A0, GS, EO);
	
	always
		#5ns clk=~clk;
	
	initial
		begin
			clk=0;
			ena=1;
			reset=1;
			reset=0;
			ser_in=0;
			#10ns
			ser_in=1;
			#10ns
			ser_in=0;
			#10ns
			ser_in=1;
			#10ns
			ser_in=1;
			#10ns
			ser_in=0;
			#10ns
			ser_in=0;
			#10ns
			ser_in=0;
		end
endmodule