`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2023 10:22:59
// Design Name: 
// Module Name: Traffic_light
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


module Traffic_light(
input clk,rst,
output reg [2:0]light_M1,
output reg [2:0]light_M2,
output reg [2:0]light_MT,
output reg [2:0]light_ST
    );
    parameter S1=0,S2=1,S3=2,S4=3,S5=4,S6=5;
    reg [3:0] count;
    reg [2:0] ps;
    parameter t7=7,t5=5,t3=3,t2=2;
    
    
    always @(posedge clk or posedge rst)
        begin
        if(rst==1)
        begin
        ps<=S1;
        count<=0;
        end
    
    else
    
    case(ps)
    S1:if(count<t7)
        begin 
        ps<=S1;
        count=count+1;
        end
    else
        begin
        ps<=S2;
        count<=0;
        end
    
    S2:if(count<t2)
       begin 
       ps<=S2;
       count=count+1;
       end
    else
        begin
        ps<=S3;
        count<=0;
        end
                
     S3:if(count<t5)
        begin 
        ps<=S3;
        count=count+1;
        end
     else
        begin
        ps<=S4;
        count<=0;
        end
      
      S4:if(count<t2)
        begin 
        ps<=S4;
        count=count+1;
        end
       else
        begin
        ps<=S5;
        count<=0;
        end
                                
      S5:if(count<t3)
        begin 
        ps<=S5;
        count=count+1;
        end
       else
        begin
        ps<=S6;
        count<=0;
        end
                                        
       S6:if(count<t2)
        begin 
        ps<=S6;
        count=count+1;
        end
       else
        begin
        ps<=S1;
        count<=0;
        end
             default:ps<=S1;                                                                        
         endcase                                                                            
    
    end
    
    
    always@(ps)
    begin 
    
        case(ps)
        S1:
        begin
        light_M1<=001;
        light_M2<=001;
        light_MT<=100;
        light_ST<=100;
        end
        
        S2:
        begin
        light_M1<=001;
        light_M2<=010;
        light_MT<=100;
        light_ST<=100;
        end
        
        S3:
        begin
        light_M1<=001;
        light_M2<=100;
        light_MT<=001;
        light_ST<=100;
        end
                        
        S4:
        begin
        light_M1<=010;
        light_M2<=100;
        light_MT<=010;
        light_ST<=100;
        end                                
        
        S5:
        begin
        light_M1<=100;
        light_M2<=100;
        light_MT<=100;
        light_ST<=001;
        end   
                                        
        S6:
        begin
        light_M1<=100;
        light_M2<=100;
        light_MT<=100;
        light_ST<=010;
        end
        
        default:
        begin
        light_M1<=000;
        light_M2<=000;
        light_MT<=000;
        light_ST<=000;
        end                                   
       endcase                                         
    end
       
endmodule
