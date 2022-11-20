`ifndef CALC_SEQ_ITEM_SV
 `define CALC_SEQ_ITEM_SV

parameter OP_WIDTH = 32;
parameter REQ_WIDTH = 4;

class calc_seq_item extends uvm_sequence_item;
    //polja
    rand logic [OP_WIDTH - 1 : 0] operand1;
    rand logic [OP_WIDTH - 1 : 0] operand2;

    rand logic [REQ_WIDTH - 1 : 0] req1_cmd_in;

    rand logic [OP_WIDTH - 1 : 0] operand3;
    rand logic [OP_WIDTH - 1 : 0] operand4;
    rand logic [REQ_WIDTH - 1 : 0] req2_cmd_in;

    rand logic [OP_WIDTH - 1 : 0] operand5;
    rand logic [OP_WIDTH - 1 : 0] operand6;
    rand logic [REQ_WIDTH - 1 : 0] req3_cmd_in;

    rand logic [OP_WIDTH - 1 : 0] operand7;
    rand logic [OP_WIDTH - 1 : 0] operand8;
    rand logic [REQ_WIDTH - 1 : 0] req4_cmd_in;
	
    logic [OP_WIDTH - 1 : 0] res1;
    logic [REQ_WIDTH - 1 : 0] nit;
	


     //ogranicenja
	constraint op1_const {operand1 < 5; operand2 < 5; operand3 < 5; operand4 < 5; operand5 < 5; operand6 < 5; operand7 < 5; operand8 < 5;};
    constraint req1_constraint {req1_cmd_in inside {[4'b0001 : 4'b0010], 4'b0101, 4'b0110}; }
    constraint req2_constraint {req2_cmd_in inside {[4'b0001 : 4'b0010], 4'b0101, 4'b0110}; }
    constraint req3_constraint {req3_cmd_in inside {[4'b0001 : 4'b0010], 4'b0101, 4'b0110}; }
    constraint req4_constraint {req4_cmd_in inside {[4'b0001 : 4'b0010], 4'b0101, 4'b0110}; }

   `uvm_object_utils_begin(calc_seq_item)
	`uvm_field_int(operand1, UVM_DEFAULT)
        `uvm_field_int(operand2, UVM_DEFAULT)
        `uvm_field_int(req1_cmd_in, UVM_DEFAULT)
   `uvm_object_utils_end

   function new (string name = "calc_seq_item");
      super.new(name);
   endfunction // new

endclass : calc_seq_item

`endif
