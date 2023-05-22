`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2023 16:15:49
// Design Name: 
// Module Name: testcontadores
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


module testcontadores();
    logic clock, reset;
    logic [7:0] counter1;
    logic [7:0] counter2;
    logic [7:0] counter3;
           
    counter1 DUT1(
        .clock(clock),
        .reset(reset),
        .counter(counter1));
        
    counter2 DUT2(
        .clock(clock),
        .reset(reset),
        .counter(counter2));
    
    counter3 DUT3(
        .clock(clock),
        .reset(reset),
        .counter(counter3));
        
    always#10 clock =~clock;     
        
    initial begin 
        reset=1'b1;
        clock=1'b0;
        #15
        reset=1'b0;     
        
     end
    
endmodule
