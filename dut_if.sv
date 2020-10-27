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
clock = ~clock;

end
join_none

end 

endinterface : dut_if
