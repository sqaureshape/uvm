class test extends uvm_test;
`uvm_component_utils(test)

//env

my_env my_env_h;

function new (string name, uvm_component parent);
  super.new(name,parent);
endfunction : new

function void build_phase(uvm_phase phase);
my_env_h = my_env :: type_id :: create("my_env",this);
`uvm_info("FIFO","ENV is build",UVM_NONE);
endfunction:build_phase

task run_phase(uvm_phase phase);

my_seq seq;

seq = my_seq :: type_id :: create("my_seq");

assert(seq.randomize());
phase.raise_objection(this);
seq.start(my_env_h.my_agent_h.my_sequencer_h);
phase.drop_objection(this);

endtask

endclass:test
