`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.04.2023 21:44:31
// Design Name: 
// Module Name: clock_divider_aula
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
/*
NOMBRE DEL MODULO: clock divider
FECHA DE CREACION:20-04-2023
FECHA DE MODIFICACION: 
FUNCION: Mediante un contador se divide el clk original de manera de tener un nuevo clk a una frecuencia deseada. Este es el ejemplo 
que fue compartido en Aula (fue editado para cumplir con el ejercicio 5.3)
*/

module clock_divider_2
#(parameter frec_base = 100, parameter frec_salida = 30)
(
	input  logic clk_in,
	input  logic reset,
	output logic clk_out );
    
    localparam COUNTER_MAX = (frec_base*10**6)/(2*frec_salida*10**6);
	localparam DELAY_WIDTH = $clog2(COUNTER_MAX);
	logic [DELAY_WIDTH-1:0] counter = 'd0, counter_next;
	logic clk_out_next;
	 
	/*L?gica combinacional para el contador*/
	always_comb
	begin
		if (reset == 1'b1)
			counter_next = 'd0;// Reset sincronico, setea el contador
		else if (counter == (COUNTER_MAX - 1))
			counter_next = 'd0;// Se resetea el contador
		else
			counter_next = counter + 'd1; // Se incrementa el contador
	end
	 
	 /*L?gica Combinacional para la salida*/
	always_comb
	begin
		if (reset == 1'b1)
			clk_out_next = 'd0; // Reset sincronico, setea la salida a un valor conocido
		else if (counter == COUNTER_MAX-1)
			clk_out_next = ~clk_out;// Se invierte la salida
		else
			clk_out_next = clk_out;//se mantiene la salida con su valor anterior
	 end

	/*L?gica Secuencial*/
	always_ff@(posedge frec_base)
	begin
		counter <= counter_next;
		clk_out <= clk_out_next;
	end
endmodule