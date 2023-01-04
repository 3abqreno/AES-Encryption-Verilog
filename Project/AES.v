module AES;

reg [31:0] test;
wire [31:0]out;

subBytes s(test,out);

initial begin
test=32'h14dff409;
end

endmodule