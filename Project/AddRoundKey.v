module AddRoundKey(input[127:0] stateIn,input [127:0] Key,output[127:0]stateOut);

assign stateOut=stateIn^Key;


endmodule
