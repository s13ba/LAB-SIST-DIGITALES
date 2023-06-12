`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2023 20:27:28
// Design Name: 
// Module Name: test_a1
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
    logic reset,clk,Enter,Undo;
    logic[15:0]DataIn;
    logic[6:0]Segments;
    logic[7:0]Anodes;
    logic[4:0]Flags;
    logic[2:0]Status;  
    
S8_actividad1 DUT(
    .resetN(reset),
    .clk(clk),
    .Enter(Enter),
    .DataIn(DataIn),
    .Undo(Undo),
    .Anodes(Anodes),
    .Segments(Segments),
    .Flags(Flags),
    .Status(Status));
    
always #5 clk=~clk;

initial begin
clk=1'b0;
reset=1'b0;
DataIn=16'd0;
Enter=0;
Undo=0;
#27
reset=1'b1;
DataIn=16'd10;
#116
Enter=1'b1;
#116
Enter=1'b0;
#116
DataIn=16'd5;
#116
Enter=1'b1;
#116
Enter=1'b0;
#116
Undo=1'b1;
#116
Undo=1'b0;
#116
DataIn=16'd2;
#116
Enter=1'b1;
#116
Enter=1'b0;
#116
DataIn=16'd2;
#116
Enter=1'b1;
#116
Enter=1'b0;
end
endmodule
