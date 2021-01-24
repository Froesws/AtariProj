//-----------------------------------------------------
module  mux8b_SB(
        input wire[7:0] s_sb, 
        input wire[7:0] add_sb, 
        input wire[7:0] db_sb, 
        input wire[7:0] y_sb, 
        input wire[7:0] x_sb, 
        input wire[7:0]acc_sb, 
        input wire[2:0] sel,
        output wire[7:0] out_mux_sb
);

    reg[7:0]  out_mux;
    assign out_mux_sb = out_mux;
    always @ (*)
       begin      
        case (sel) 
          3'b000 : out_mux = s_sb;
          3'b001: out_mux= add_sb;
          3'b010: out_mux = db_sb;
          3'b011: out_mux = y_sb;
          3'b100: out_mux = x_sb;
          3'b101: out_mux = acc_sb;
       endcase  
      end 

endmodule //End Of Module mux
