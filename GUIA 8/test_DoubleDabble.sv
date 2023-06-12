`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2023 19:42:33
// Design Name: 
// Module Name: test_DoubleDabble
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


module test_DoubleDabble();
    logic clk,reset,idle;
    logic [31:0]in,bcd;
    
    unsigned_to_bcd u32_to_bcd_inst ( 
	.clk(clk),                       
	.reset(reset),                    
	.trigger(1'b1),                  
	.in(in),                         
	.idle(idle),                     
	.bcd(bcd));   
	
always #10 clk=~clk;
	
initial begin
 clk =0;
 reset=1;
 in=1'd0;
 #18
 reset=0;
 in=31'hffffffff;
 
 end
    	                             
endmodule
