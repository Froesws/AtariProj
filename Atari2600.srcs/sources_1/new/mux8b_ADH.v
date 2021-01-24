
//-----------------------------------------------------
module  mux8b_ADH(
        input wire[7:0] dp_adh, 
        input wire[7:0] o_adh, 
        input wire[7:0] sb_adh, 
        input wire[7:0] pch_adh, 
        input wire[2:0] sel,
        output wire[7:0] out_mux_adh
);
    
    reg[7:0]  out_mux;
    assign out_mux_adh = out_mux;
    
    //-------------Code Starts Here---------
    always @ (sel or dp_adh or o_adh or sb_adh or pch_adh)
       begin : MUX
        case (sel) 
          3'b000: out_mux = dp_adh;
          3'b001: out_mux = 8'b0;//o_adh
          3'b010: out_mux = sb_adh;
          3'b011: out_mux = pch_adh;
       endcase  
      end 

endmodule //End Of Module mux