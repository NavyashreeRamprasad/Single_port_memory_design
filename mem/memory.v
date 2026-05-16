//______________________________________________________________________//
//______________________AUTHOR: PRATEEK_________________________________//
//______________________DUT: SINGLE PORT MEMORY_________________________//
//______________________VERSION: 1______________________________________//
//______________________LAST UPDATED: 21/04/26__________________________//
//______________________________________________________________________//

module memory#(parameter WIDTH = 32,DEPTH = 1024,ADDR_WIDTH = $clog2(DEPTH))
//WIDTH is used for indicating size for:
//wdata, rdata, memory vector

//DEPTh is used to represent the total locations present in the memory

//ADDR_WIDTH is used to indicates the size of the addr signal

			 (clk_i,
			  rst_i,
			  valid_i,
			  ready_o,
			  wr_rd_i,
			  rdata_o,
			  addr_i,
			  wdata_i);


	//DUT INPUT
	input						clk_i;
	input						rst_i;
	input						valid_i;
	input						wr_rd_i;
	input	[ADDR_WIDTH-1:0]	addr_i;
	input	[WIDTH-1:0]			wdata_i;

	//DUT OUTPUT
	output	reg				ready_o;
	output	reg [WIDTH-1:0]	rdata_o;

	//
	reg [WIDTH-1:0] mem [DEPTH-1:0];
	integer i;

	always@(posedge clk_i or posedge rst_i) begin
		if(rst_i == 1) begin
			ready_o = 0;
			rdata_o = 0;
			for(i = 0; i<DEPTH;i=i+1) begin
				mem[i] = 0;
			end
		end
		else begin
			if(valid_i == 1) begin 	//valid
				ready_o = 1; //Handshaking completed 	
				if(wr_rd_i == 1) begin
					mem[addr_i] = wdata_i;
				end
				else begin
					rdata_o = mem[addr_i];
				end
			end 					//valid
			else
				ready_o = 0;
		end
	end

endmodule




