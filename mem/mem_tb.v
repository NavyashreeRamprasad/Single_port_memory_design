`include "memory.v"
module tb;
	parameter WIDTH = 32;
	parameter DEPTH = 65;
	parameter ADDR_WIDTH = $clog2(DEPTH);

	//TB OUTPUT
	reg						clk_i;
	reg						rst_i;
	reg						valid_i;
	reg						wr_rd_i;
	reg	[ADDR_WIDTH-1:0]	addr_i;
	reg	[WIDTH-1:0]			wdata_i;

	//TB INPUT
	wire				ready_o;
	wire [WIDTH-1:0]	rdata_o;
	integer i,j;
	reg [31:0] data_array [10:0];

memory#(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH)) dut(
			  .clk_i(clk_i),
			  .rst_i(rst_i),
			  .valid_i(valid_i),
			  .ready_o(ready_o),
			  .wr_rd_i(wr_rd_i),
			  .rdata_o(rdata_o),
			  .addr_i(addr_i),
			  .wdata_i(wdata_i));

always #5 clk_i = !clk_i;



task reset();
begin
	rst_i = 1; //reset the dut signals 
	valid_i = 0;
	addr_i = 0;
	wdata_i = 0;
	wr_rd_i = 0;
	repeat(2) @(posedge clk_i);
	rst_i = 0;
end
endtask

task write(input integer start_addr, input integer num_loc);
begin	
	for(i = start_addr;i<=num_loc+start_addr;i=i+1) begin
	//i = 15, i< 25
		@(posedge clk_i);
		//wdata_i = i+40;
		wdata_i = data_array[j];
		addr_i = i;
		wr_rd_i = 1;
		valid_i = 1;
		j = j + 1;
		wait(ready_o == 1); //handshaking got completed
	end
	@(posedge clk_i);
	addr_i = 0;
	wr_rd_i = 0;
	valid_i = 0;
	wdata_i = 0;
end
endtask
//read from 64 to 74
//read(64,10);
task read(input integer start_addr, input integer num_loc); //read(0);
	begin
	for(i = start_addr;i<=num_loc+start_addr;i=i+1) begin
		@(posedge clk_i);
		addr_i = i;
		wr_rd_i = 0;
		valid_i = 1;
	wait(ready_o == 1);
	end
	@(posedge clk_i);
	addr_i = 0;
	wr_rd_i = 0;
	valid_i = 0;
	end
endtask

//test case:
	//100 test cases
	//check reset												:PASSED 
	//write to location 15 with random data						:PASSED
	//read from location 15										:PASSED 
	//write to mem from location 15 to 25 with data 55 to 65	:PASSED
	//write from 15 to 25 with present in data_array of size 11 :PASSED
	//Perform backdoor write									:PASSED
//		$readmemh();
//		$readmemb();
	//Perform backdoor read										:PASSED
//		$writememh();
//		$writememb();


initial begin
	clk_i = 0;
	reset();
	j = 0;
	
	for(i = 0; i<11; i = i + 1) begin
		data_array[i] = $urandom_range(10,50);
		$display("data_array[%0d] = %0d",i,data_array[i]);
	end
		$display("data_array = %p",data_array);


	
	//write(15,10);
	$readmemh("image.hex",dut.mem); //Backdoor write

	$writememb("image.bin",dut.mem);
//HW 
//	perform back door write usin .bin file
//	perform back door read using .hex file 
end
//0000276f 000088ce 0000625b 000015fa
initial begin
#900 $finish();

end

endmodule
