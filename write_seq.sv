class write_seq extends uvm_sequence #(my_transaction);
`uvm_object_utils(write_seq)

function new(string name = "");
  super.new(name);
endfunction: new

task body;

begin

my_transaction tx;

tx = my_transaction :: type_id :: create("tx");

start_item(tx);

assert(tx.randomize() 
       with {wn==1;rn==0;});



end

endtask: body

endclass: write_seq
