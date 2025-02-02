class my_subscriber extends uvm_subscriber#(my_transaction); 
  `uvm_component_utils(my_subscriber)

logic full,empty;

covergroup fifo_status ();

coverpoint full;

coverpoint empty;

endgroup:fifo_status

  function void write (my_transaction t);

empty = t.empty;
full = t.full;

fifo_status.sample();

endfunction:write


function new(string name, uvm_component parent);
  super.new(name,parent);
  fifo_status = new();
endfunction: new


endclass: my_subscriber

