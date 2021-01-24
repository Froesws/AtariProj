
//-----------------------------------------------------
module  mux8b_A_ALU(
        input wire[7:0] sb_a, 
        input wire[7:0] o_add, 
        input wire[1:0] sel,
        output wire[7:0] out_mux_a_alu
);
    
    reg[7:0]  out_mux;
    assign out_mux_a_alu = out_mux;


    //-------------Code Starts Here---------
    always @ (sel or sb_a or o_add)
    // begin and end act like curly braces in C/C++.
    if (sel == 1'b0) begin
      out_mux = sb_a;
    end else begin
      out_mux = 8'b0;//o_add
    end

endmodule //End Of Module mux