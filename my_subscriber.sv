my_subsciber extends uvm_subscriber#(my_transaction); 
`uvm_component_util(my_subsciber)

logic full,empty;

covergroup fifo_status (int full, int empty);

coverpoint full;

coverpoint empty;

endcovergroup:fifo_status

function void write (my_transcation t);

empty = t.empty;
full = t.full;

fifo_status.sample();

endfunction:write


function new(string name, uvm_component parent);
  my_param_container params;
  super.new(name,parent);
   fifo_status = new();
endfunction: new


endclass: my_subscriber

