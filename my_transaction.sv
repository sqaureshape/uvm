class my_transaction extends uvm_sequence_item;
`uvm_object_utils(my_transaction)

logic [7:0] DATAOUT;
rand logic full , empty, wn, rn ;
rand logic [7:0] DATAIN;

    constrain data_c { DATAIN >= 0; DATAIN < 'hff;}

function new(string name = "");
    super.new(name);
  
endfunction: new

 virtual function string convert2str();
     return $sformatf("DATAIN=0x%0h DATAOUT=0x%0h full=0x%0h empty = 0x%0h wn=0x%0h rn=0x%0h", DATAIN,DATAOUT, full,empty,wn,rn);
  endfunction


endclass: my_transaction

typedef uvm_sequencer #(my_transaction) my_sequencer;
