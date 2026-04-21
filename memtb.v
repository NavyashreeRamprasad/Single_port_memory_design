`include "memory.v"
module tb;
	reg clk,rst,valid,wr_rd;
	reg [`WIDTH-1:0]wdata;
	reg [`ADDR_WIDTH-1:0]addr;
	wire ready;
	wire [`WIDTH-1:0]rdata;
//	reg[`WIDTH-1:0]mem[`DEPTH-1:0];
	integer i;
	always #5 clk=!clk;
	memory dut(clk,rst,valid,ready,wdata,rdata,wr_rd,addr);

	initial begin
	clk=1;
	rst=1;
	valid=0;
	wr_rd=0;
	wdata=0;
	addr=0;
	repeat(2)@(posedge clk);
	rst=0;
//write
		for(i=0;i<`DEPTH;i=i+1)begin
			@(posedge clk);
			wr_rd=1;
			wdata=$urandom_range(100,200);
			addr=i;
			valid=1;
			wait(ready==1);
		end
		@(posedge clk);
		valid=0;
		addr=0;
		wdata=0;
//read
		for(i=0;i<`DEPTH;i=i+1)begin
			@(posedge clk);
			wr_rd=0;
			addr=i;
			valid=1;
			wait(ready==1);
		end
		@(posedge clk);
		valid=0;
		addr=0;
		wdata=0;
	end
	initial begin
		#1000 $finish;
	end	
endmodule
