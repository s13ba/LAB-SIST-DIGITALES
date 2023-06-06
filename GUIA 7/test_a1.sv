`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.06.2023 16:31:56
// Design Name: 
// Module Name: test_a2
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


module test_a1();
    logic reset,clk,Enter;
    logic[15:0]DataIn,ToDisplay;
    logic[4:0]Flags;
    logic[2:0]Status;  
    
S7_actividad1 DUT(
    .reset(reset),
    .clk(clk),
    .Enter(Enter),
    .DataIn(DataIn),
    .ToDisplay(ToDisplay),
    .Flags(Flags),
    .Status(Status));
    
always #10 clk=~clk;

initial begin    
clk=1'b0;
reset=1'b1;
DataIn=16'd0;
Enter=0;
#27
reset=1'b0;
DataIn=16'd10;
#27
Enter=1'b1;
#27
Enter=1'b0;
#37
DataIn=16'd5;
#27
Enter=1'b1;
#27
Enter=1'b0;
#37
DataIn=16'd2;
#27
Enter=1'b1;
#27
Enter=1'b0;
#80
DataIn=16'd2;
#27
Enter=1'b1;
#27
Enter=1'b0;
#27
Enter=1'b1;
#27
Enter=1'b0;
#37
DataIn=16'b1111111111111110;
#27
Enter=1'b1;
#27
Enter=1'b0;
#37
DataIn=16'd0;
#27
Enter=1'b1;
#27
Enter=1'b0;
end
endmodule
