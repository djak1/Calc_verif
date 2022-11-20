`ifndef CALC_AGENT_PKG
`define CALC_AGENT_PKG

package calc_agent_pkg;
 
   import uvm_pkg::*;
   `include "uvm_macros.svh"

   //////////////////////////////////////////////////////////
   // include Agent components : driver,monitor,sequencer
   /////////////////////////////////////////////////////////
    import configurations_pkg::*;  
   `include "v7_calc_seq_item.sv"
   `include "v7_calc_sequencer.sv"
   `include "v7_calc_driver.sv"
   `include "v8_calc_monitor.sv"
   `include "v9_calc_agent.sv"

endpackage

`endif



