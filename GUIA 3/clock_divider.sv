`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2023 17:03:41
// Design Name: 
// Module Name: clock_divider
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
FECHA DE CREACION:19-04-2023
FECHA DE MODIFICACION: 
FUNCION: Mediante un contador se divide el clk original de manera de tener un nuevo clk a una frecuencia deseada
*/


  
 module clock_divider_aula#(parameter counter_max = 2)
( input logic clk_in,
  input logic reset,
  output logic clk_out);
  
  localparam delay_width = $clog2(counter_max);
  logic [delay_width-1:0] counter = 'd0;
  
  always_ff @(posedge clk_in) begin
    if (reset == 1'b1) begin
        counter<='d0;
        clk_out<=0;
  end else if (counter == counter_max-1) begin
    counter <='d0;
    clk_out <= ~clk_out;
  end else begin
    counter <= counter +'d1;
    clk_out <= clk_out;
    end
    end
  
endmodule
