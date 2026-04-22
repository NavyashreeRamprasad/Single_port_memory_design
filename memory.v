//_________________________________________________________________________________________________________________//
//______________________________________Author : Navyashree R______________________________________________________//
//______________________________________Version : 1________________________________________________________________//
//______________________________________DUT:Memory_________________________________________________________________//
//______________________________________TB:CPU_____________________________________________________________________//
//_________________________________________________________________________________________________________________//
`define WIDTH 16
`define DEPTH 1024
`define ADDR_WIDTH $clog2(`DEPTH)
module memory(clk,rst,valid,ready,wdata,rdata,wr_rd,addr);
input clk,rst,valid,wr_rd;
input [`WIDTH-1:0] wdata;
input [`ADDR_WIDTH-1:0]addr;
output reg ready;
output reg [`WIDTH-1:0] rdata;
reg [`WIDTH-1:0] mem [`DEPTH-1:0];
integer i;

always@(*) begin
if(rst==1) begin
	ready=0;
	rdata=0;
	for(i=0;i<`DEPTH;i=i+1) begin
		mem[i]=0;
	end
end
else begin
	if(valid==1) begin
		ready=1;
		if(wr_rd==1) begin
			mem[addr]=wdata;	
		end
		else begin
			rdata=mem[addr];
		end
	end
	else 
	ready=0;
end

end
endmodule
