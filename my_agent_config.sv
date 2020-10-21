my_agent_config extends uvm_object;
`uvm_object_util(my_agent_config)

int value;

value = 1;


function new(string name = "");
      super.new(name);
   endfunction
      
   
endclass: my_agent_config
