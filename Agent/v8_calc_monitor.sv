class calc_monitor extends uvm_monitor;

   // control fileds
   bit checks_enable = 1;
   bit coverage_enable = 1;
   int niz1[]; 
   int i = 0;

   uvm_analysis_port #(calc_seq_item) item_collected_port;

   `uvm_component_utils_begin(calc_monitor)
      `uvm_field_int(checks_enable, UVM_DEFAULT)
      `uvm_field_int(coverage_enable, UVM_DEFAULT)
   `uvm_component_utils_end

   // The virtual interface used to drive and view HDL signals.
   virtual interface calc_if vif;

   // current transaction
   calc_seq_item curr_it;

   // coverage can go here
   // ...

   function new(string name = "calc_monitor", uvm_component parent = null);
      super.new(name,parent);
//iz baze podataka izvlaci ulaze i izale duta koje smo upisali u bazu
      if (!uvm_config_db#(virtual calc_if)::get(this, "*", "calc_if", vif))
        `uvm_fatal("NOVIF",{"virtual interface must be set:",get_full_name(),".vif"})
	item_collected_port = new("item_collected_port", this);
   endfunction

   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      
   endfunction : connect_phase
	//phase poziva simulator 
   task main_phase(uvm_phase phase);
	//if(vif.req1_cmd_in == 0)
	curr_it = calc_seq_item::type_id::create("curr_it",this);
      forever begin
	@(posedge vif.clk);
	if(!vif.rst)
	begin
	fork 
		begin

			if(vif.req1_cmd_in != 0)
			begin
				curr_it = calc_seq_item::type_id::create("curr_it",this);
				curr_it.nit = 1;
				
				curr_it.req1_cmd_in = vif.req1_cmd_in;
				//$display("Komanda na prvom portu : %0h",curr_it.req1_cmd_in);
				
				curr_it.operand1 = vif.req1_data_in;
				//$display("operand 1: ", curr_it.operand1);
				@(posedge vif.clk);
				curr_it.operand2 = vif.req1_data_in;
				//$display("operand 2: ", curr_it.operand2);
				@(posedge vif.out_resp1);
				//$display("Rezultat prva dva operanda %0h", vif.out_data1);
				curr_it.res1 = vif.out_data1;
			end
		end

		begin

			if(vif.req2_cmd_in != 0)
			begin
				curr_it = calc_seq_item::type_id::create("curr_it",this);
				curr_it.nit = 2;
				
				curr_it.req2_cmd_in = vif.req2_cmd_in;
				//$display("Komanda je : %0h",curr_it.req2_cmd_in);
				curr_it.operand3 = vif.req2_data_in;
				//$display("operand 3: ", curr_it.operand3);
				@(posedge vif.clk);
				curr_it.operand4 = vif.req2_data_in;
				//$display("operand 4: ", curr_it.operand4);
				@(posedge vif.out_resp2);
				//$display("Rezultat je %0h", vif.out_data2);
				curr_it.res1 = vif.out_data2;

			end

		end

		begin

			if(vif.req3_cmd_in != 0)
			begin
				curr_it = calc_seq_item::type_id::create("curr_it",this);
				curr_it.nit = 3;
				
				curr_it.req3_cmd_in = vif.req3_cmd_in;
				//$display("Komanda je : %0h",curr_it.req3_cmd_in);
				curr_it.operand5 = vif.req3_data_in;
				//$display("operand 5: ", curr_it.operand5);
				@(posedge vif.clk);
				curr_it.operand6 = vif.req3_data_in;
				//$display("operand 6: ", curr_it.operand6);
				@(posedge vif.out_resp3);
				curr_it.res1 = vif.out_data3;
			end

		end
		begin

			if(vif.req4_cmd_in != 0)
			begin
				curr_it = calc_seq_item::type_id::create("curr_it",this);
				curr_it.nit = 4;
				
				curr_it.req4_cmd_in = vif.req4_cmd_in;
				//$display("Komanda je : %0h",curr_it.req4_cmd_in);
				curr_it.operand7 = vif.req4_data_in;
				//$display("operand 7: ", curr_it.operand7);
				@(posedge vif.clk);
				curr_it.operand8 = vif.req4_data_in;
				//$display("operand 8: ", curr_it.operand8);
				@(posedge vif.out_resp4);
				curr_it.res1 = vif.out_data4;
			end

		end
		join

	
		item_collected_port.write(curr_it);	
      // curr_it = calc_seq_item::type_id::create("curr_it", this);
      // ...
      // collect transactions
      // ...
      // item_collected_port.write(curr_it);
     end
    end
   endtask : main_phase

endclass : calc_monitor
