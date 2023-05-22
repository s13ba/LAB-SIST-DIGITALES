`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2023 15:09:07
// Design Name: 
// Module Name: test_ALUer
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


module test_ALUer();
    logic [15:0]data_in;
    logic load_A, load_B, load_Op, updateRes, reset, clock;
    logic [6:0] segments;
    logic [7:0] anodes;
    logic [4:0]LEDs;
 
ALU_REG DUT(
    .data_in(data_in),
    .load_A(load_A),
    .load_B(load_B),
    .load_Op(load_Op),
    .updateRes(updateRes),
    .reset(reset),
    .clock(clock),
    .segments(segments),
    .anodes(anodes),
    .LEDs(LEDs));
    
    always#10 clock=~clock;
initial begin 
    updateRes=1'b0;
    clock=1'b0;
    reset=1'b1;
    data_in=16'd0;
    load_B=1'b0;
    load_A=1'b0;
    load_Op=1'b0;
    #20
    reset=1'b0;
    data_in=16'd11;
    load_A=1'b1;
    #20
    data_in=16'd10;
    load_A=1'b0;
    load_B=1'b1;
    #20
    data_in=2'b11;
    load_B=1'b0;
    load_Op=1'b1;
    #20
    load_Op=1'b0;
    updateRes=1'b1;
    
   
end    
    
    
endmodule