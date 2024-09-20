module mem(clk,rst,wr,rd,addr,Datain,Dataout);
    output reg [7:0] Dataout;
    input wr, rd, clk, rst;
    input [3:0] addr;
    input [7:0] Datain;
    reg [7:0] A[0:10];  
    
  integer i;
    always @ (posedge clk or posedge rst)
    begin
        if (rst) 
        begin
            for (i = 0; i < 11; i = i + 1)
                A[i] <= 8'b0;  
            Dataout <= 8'b0;   
        end 
        else 
        begin
            if (wr) 
                A[addr] <= Datain;  
            else if (rd)
                Dataout <= A[addr]; 
        end
    end

    always @(*)
    begin
        if (!wr && !rd)
            Dataout = 8'bz;  
    end

endmodule
