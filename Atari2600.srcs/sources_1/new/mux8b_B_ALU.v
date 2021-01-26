//-----------------------------------------------------
module  mux8b_B_ALU(
        input wire[7:0] adl_add, 
        input wire[7:0] db_add, 
        input wire[7:0] db_N_add, 
        input wire[2:0] sel,
        output wire[7:0] out_mux_b_alu
);
  
    reg[7:0]  out_mux;
    assign out_mux_b_alu = out_mux;
        
    //-------------Code Starts Here---------
    always @ (sel or adl_add or db_add or db_N_add)
       begin : MUX
        case (sel) 
          3'b000 : out_mux = adl_add;
          3'b001: out_mux = db_add;
          3'b010: out_mux = ~db_N_add;
       endcase  
      end 

endmodule //End Of Module mux