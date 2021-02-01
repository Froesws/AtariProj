module header();
// Instrucoes
parameter BRK = 'h00;
parameter BPL = 'h01;
parameter JSR = 'h02;
parameter BMI = 'h03;
parameter RTI = 'h04;
parameter BVC = 'h05;
parameter RTS = 'h06;
parameter BVS = 'h07;
parameter BCC = 'h08;
parameter LDY = 'h09;
parameter BCS = 'h0A;
parameter CPY = 'h0B; 
parameter BNE = 'h0C;
parameter CPX = 'h0D;
parameter BEQ = 'h0E;
parameter BIT = 'h0F;
parameter STY = 'h10;
parameter PHP = 'h11;
parameter CLC = 'h12;
parameter PLP = 'h13;
parameter SEC = 'h14;
parameter PHA = 'h15;
parameter CLI = 'h16;
parameter PLA = 'h17;
parameter SEI = 'h18;
parameter DEY = 'h19;
parameter TYA = 'h1A;
parameter TAY = 'h1B;
parameter CLV = 'h1C;
parameter INY = 'h1D;
parameter CLD = 'h1E;
parameter INX = 'h1F;
parameter SED = 'h20;
parameter ORA = 'h21;
parameter AND = 'h22;
parameter EOR = 'h23;
parameter ADC = 'h24;
parameter STA = 'h25;
parameter LDA = 'h26;
parameter CMP = 'h27;
parameter SBC = 'h28;
parameter ASL = 'h29;
parameter ROL = 'h2A;
parameter LSR = 'h2B;
parameter ROR = 'h2C;
parameter STX = 'h2D;
parameter LDX = 'h2E;
parameter DEC = 'h2F;
parameter INC = 'h30;
parameter TXA = 'h31;
parameter TXS = 'h32;
parameter TAX = 'h33;
parameter TSX = 'h34;
parameter DEX = 'h35;
parameter NOP = 'h36;
parameter JMP = 'h37;


// Mode de Enderacamento
parameter zpg ='h0;
parameter imd ='h1;
parameter abt ='h2;
parameter zpx ='h3;
parameter abs_y ='h4;
parameter abs_x ='h5;
parameter imp ='h6;
parameter rel = 'h7;
parameter acc ='h8;
parameter ind ='h9;
parameter x_ind = 'hA;
parameter zpx_ind = 'hB;
parameter zpy ='hC;
parameter ind_y = 'hD;

//estados
parameter T0 = 'h00;
parameter T1 ='h01;
parameter T2 ='h02;
parameter T3 ='h03;
parameter T4 ='h04;
parameter T5 ='h05;
parameter T6 ='h06;
parameter T7 ='h07;
parameter DELAY1 ='hFF;

endmodule