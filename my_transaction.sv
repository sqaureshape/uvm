my_transaction extends uvm_sequence_item;
`uvm_config_utils(my_transaction)

logic [7:0] DATAOUT;
rand logic full , empty, wn, rn ;
rand logic [7:0] DATAIN;

constrain data_c { DATAIN >= 0; DATAIN < my_pkg::MAX_VALUE};

function new(string name = "");
    super.new(name);
  
endfunction: new

endclass: my_transaction

typedef uvm_sequencer #(my_transaction) my_sequencer;
