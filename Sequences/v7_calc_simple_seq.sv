`ifndef CALC_SIMPLE_SEQ_SV
 `define CALC_SIMPLE_SEQ_SV

class calc_simple_seq extends calc_base_seq;

   `uvm_object_utils (calc_simple_seq)

   function new(string name = "calc_simple_seq");
      super.new(name);
   endfunction

   virtual task body();
      calc_seq_item calc_it;// prvi korak kreiranje transakcije

      calc_it = calc_seq_item::type_id::create("calc_it");// drugi korak−start
	
	for(int i = 0; i < 3; i++)
	begin
      		start_item(calc_it);// treci korak priprema// po potrebi moguce prosiriti sa npr. inline ogranicenjima

    		assert(calc_it.randomize());// cetvrti korak−finish

    		finish_item(calc_it);
	end
   endtask : body

endclass : calc_simple_seq

`endif
