`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 17:15:30
// Design Name: 
// Module Name: test_clock_divider
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
NOMBRE DEL MODULO: test
FECHA DE CREACION:20-04-2023
FECHA DE MODIFICACION: 
FUNCION: test para los clock divider
*/

module test_clock_divider();
logic clk_in;
logic reset;
logic clk_out;

/*clock_divider #(.counter_max(1666666)) DUT(
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out)
    );*/
    
clock_divider_2 #(.frec_base(100),.frec_salida(50)) DUT(
    .clk_in(clk_in),
    .reset(reset),
    .clk_out(clk_out)
    );    

always #5 clk_in =~clk_in;
initial begin 
    clk_in=0;
    clk_out=0;
    reset=1;
    #10
    reset=0;
end
endmodule
