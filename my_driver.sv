class my_driver extends uvm_driver #(my_transaction);
`uvm_component_utils(my_driver)

virtual dut_if vif;

function new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new
  

function void build_phase(uvm_phase phase);

if(!uvm_config_db#(virtual dut_if) ::get(null,"*","vif",vif))
`uvm_fatal("my_driver", "No DUT_IF");

endfunction:build_phase

task run_phase(uvm_phase phase);

my_transaction tx;

forever
      begin
      seq_item_port.get_next_item(tx);
      //driver code
      
      vif.DATAIN = tx.DATAIN;
      vif.wn =tx.wn;
      vif.rn =tx.rn;
      
       `uvm_info(get_type_name(), $sformatf("packet driven %s", tx.convert2str()), UVM_LOW)

      
      
      
      seq_item_port.item_done();
      
      end

endtask :run_phase

endclass:my_driver
