interface dut_if;

logic clock,reset;
logic [7:0] DATAOUT;
logic full, empty, wn,rn;
logic [7:0] DATAIN;

initial begin 
clock =0;
fork 
forever begin

 #10;
clk = ~clk;

end
join_end

end 

endinterface : dut_if
