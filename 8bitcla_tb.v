`timescale 1ns/1ps
module bit8_cla_tb;
wire [7:0]S;
wire Cout;
reg [7:0] a,b;
reg c0;
bit8_cla dut (.S(S),.Cout(Cout),.a(a),.b(b),.c0(c0));
initial
 begin
        a=8'd8;   b=8'd4;   c0=0;
        #10;
        a=8'd50;  b=8'd30;  c0=1;
        #10;
        a=8'd30;  b=8'd50;  c0=0;
        #10;
        a=8'd255; b=8'd1;   c0=0;
        #10;
        a=8'd255; b=8'd255; c0=1;
        #10;
        a=8'd0;   b=8'd0;   c0=0;
        #10;
        a=8'd90;  b=8'd70;  c0=1;
        #10;
        $finish;
        end
initial
begin
$monitor("Time=%0t A=%b B=%b Cin=%b Sum=%d Carry=%b",$time,a,b,c0,{Cout,S},Cout); 
end       
initial
begin
    $dumpfile("bit8_cla.vcd");
    $dumpvars(0,bit8_cla_tb);
end

endmodule
