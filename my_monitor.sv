class my_monitor extends uvm_monitor; 
`uvm_component_utils(my_monitor)

  uvm_analysis_port #(my_transaction) aport;
virtual dut_if vif;

function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction: new

function void build_phase(uvm_phase phase);

aport = new("aport",this);

if(!uvm_config_db#(virtual dut_if) :: get(null,"*","vif",vif))
  `uvm_fatal("MONITOR","NO virtual interface connected");

endfunction:build_phase

task run_phase(uvm_phase phase);
my_transaction tx;

forever
begin
@(posedge vif.clk);

tx = my_transaction::type_id :: create("tx");

tx.DATAOUT = vif.DATAOUT;
tx.DATAIN =vif.DATAIN;
tx.full = vif.full;
tx.empty = vif.empty;
tx.rn = vif.rn;
tx.wn = vif.wn;

aport.write(tx);

end
endtask

endclass:my_monitor
