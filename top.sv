module top;
      import uvm_pkg::*;
      //import example_pkg::*;
      
dut_if dut_if1();

dut dut1(.DATAOUT(dut_if1.DATAOUT), .full(dut_if1.full),.empty(dut_if1.empty), .clock(dut_if1.clock), .reset(dut_if1.reset), .wn(dut_if1.wn),.rn(dut_if1.rn),.DATAIN(dut_if1.DATAIN));


initial 
begin

//set the config db for the interface 

uvm_config_db#(virtual dut_if)::set(null, "*", "dut_vif" , dut_if1);

      run_test(); // test provided by +UVM_TESTNAME=

end
endmodule 
      
      
      
