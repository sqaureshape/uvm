class my_env extends uvm_env;
`uvm_component_utils(my_env)

my_agent my_agent_h;
my_subscriber my_subscriber_h;
my_agent_config my_agent_config_h;

function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction: new

  function void build_phase(uvm_phase phase);

my_agent_config_h = my_agent_config :: type_id :: create("my_agent_config");
//uvm_config_db#(my_agent_config_h)::set(null,"*","my_agent_config",my_agent_config_h);

my_agent_h = my_agent :: type_id :: create("my_agent",this);
    my_subscriber_h = my_subscriber ::type_id :: create("my_subscriber",this);

endfunction:build_phase

function void connect_phase(uvm_phase phase);

  my_agent_h.aport.connect(my_subscriber_h.analysis_export);

endfunction:connect_phase

endclass:my_env
