`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 17:16:26
// Design Name: 
// Module Name: test_ACT2
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


module test_ACT2();
logic clock;
logic reset;
logic load;
logic dec;
logic enable;
logic [31:0]Load_Ref_value;
logic [31:0]counterN;
logic threshold;

S4_actividad2 #(.N(32)) DUT(
    .clock(clock),
    .reset(reset),
    .load(load),
    .dec(dec),
    .enable(enable),
    .threshold(threshold),
    .Load_Ref_value(Load_Ref_value), // alicar metodo seba gaete para usarlo como entrada!!!!
    .counterN(counterN));


always #10 clock = ~clock;
initial begin
clock = 0;
reset= 1;
load = 0;
dec = 0;
enable = 1;
Load_Ref_value = 32'd4;

#15
reset = 0;

#70
load = 1;

#50
load = 0;

#70
dec = 1;

#85
enable = 0;

#90
dec = 0;

#100
enable = 1;



end

endmodule
