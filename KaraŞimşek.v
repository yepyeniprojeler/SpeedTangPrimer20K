
module led_kaydir(
    input clk,
    output reg[5:0] leds
    );

reg gecikme;
reg [64:0] sayac;
reg yon;
reg [5:0] led;

 initial begin
    led=6'b000001;
    gecikme=0;
    sayac=0;
    yon=1;
 end


 always @(posedge clk) begin
	if(sayac==10**7/2) begin
		sayac=0;
		gecikme=~gecikme;
	end
	sayac=sayac+1;
 end

 always @(posedge gecikme) begin

	if(led==6'b100000 || led==6'b000001) begin
		yon=~yon;
	end
	
	if (yon==0)begin
		led = led << 1;
        	leds = ~led ;
	end
	
	if (yon==1) begin
		led = led >> 1;
        	leds = ~led ;
	end	
 end

endmodule
