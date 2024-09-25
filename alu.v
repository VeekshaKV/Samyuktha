module alu_32bit (
    input clk,
    input rst,
    input [31:0] a_in,
    input [31:0] b_in,
    input [3:0] sel,
    output reg [31:0] y_out,
    output reg flag,
    output reg [32:0] sum_out
);
    
    always @(posedge clk) begin
        if (rst) begin
            y_out <= 32'b0;
            sum_out <= 33'b0;
            flag <= 0;
        end else begin
            flag <= 0; 

            case (sel)
                4'b0000: begin 
                    sum_out <= a_in + b_in;
                    y_out <= sum_out[31:0]; 
                    flag <= sum_out[32]; 
                end
                4'b0001: begin 
                    sum_out <= a_in - b_in;
                    y_out <= sum_out[31:0];
                    flag <= sum_out[32]; 
                end
                4'b0010: y_out <= a_in & b_in; 
                4'b0011: y_out <= a_in | b_in;
                4'b0100: y_out <= a_in ^ b_in;
                4'b0101: y_out <= ~a_in;       
                4'b0110: y_out <= a_in << 1;   
                4'b0111: y_out <= a_in >> 1;  
                4'b1000: y_out <= (a_in < b_in) ? 32'b1 : 32'b0; 
                default: y_out <= 32'b0;     
            endcase
        end
    end
endmodule
