`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2023 14:09:14
// Design Name: 
// Module Name: Traffic_light_tb
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


module Traffic_light_tb;
  reg clk, rst;
  wire [2:0] light_M1;
  wire [2:0] light_M2;
  wire [2:0] light_MT;
  wire [2:0] light_ST;

  reg [3:0] count;
  reg [2:0] ps;

  Traffic_light dut (
    .clk(clk),
    .rst(rst),
    .light_M1(light_M1),
    .light_M2(light_M2),
    .light_MT(light_MT),
    .light_ST(light_ST)
  );

  initial begin
    clk = 1'b0;
     forever #(1000000000/2) clk=~clk;
  end

  initial $monitor("Time=%0t ps=%d count=%d light_M1=%b light_M2=%b light_MT=%b light_ST=%b",
                  $time, ps, count, light_M1, light_M2, light_MT, light_ST);

  initial begin
    rst = 0;
    #1000000000;
    rst = 1;
    #1000000000;
    rst = 0;
    #(1000000000*200);
    $finish;
  end

  always @(posedge clk) begin
    count <= dut.count;
    ps <= dut.ps;
  end

endmodule
