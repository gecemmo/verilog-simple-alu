`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: Gecemmo Solutions AB
// Engineer: Johan Astborg
// 
// Create Date:    15:59:00 10/05/2013 
// Design Name: 
// Module Name:    main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module main(Led, store1, store2, add, sub, clk, sw, seg, an);
	output wire [7:0] Led;	
	input store1;
	input store2;
	input add;
	input sub;
	input wire clk;
	input wire [7:0] sw;
	output wire [6:0] seg;
	output wire [3:0] an;
	
	// Registers
	reg [7:0] dispOut = 0;	
	reg [6:0] ssOut;
	reg [3:0] anOut;
	reg [7:0] s1;
	reg [7:0] s2;
	
	// Handle user input
	always @(posedge clk)
	begin
		if (store1) begin
			dispOut = sw[7:0];
			s1 = sw[7:0];
		end else if (store2) begin
			dispOut = sw[7:0];
			s2 = sw[7:0];
		end else if (add) begin
			dispOut = s1 + s2;
		end else if (sub) begin
			dispOut = s1 - s2;
		end
	end	
	
	assign seg = ssOut[6:0];
	assign an = anOut[3:0];
	
	// Write data to display
	always @(posedge clk)
	begin
		case(dispOut)
			4'h0: ssOut <= ~7'b0111111;
			4'h1: ssOut <= ~7'b0000110;
			4'h2: ssOut <= ~7'b1011011;
			4'h3: ssOut <= ~7'b1001111;
			4'h4: ssOut <= ~7'b1100110;
			4'h5: ssOut <= ~7'b1101101;
			4'h6: ssOut <= ~7'b1111101;
			4'h7: ssOut <= ~7'b0000111;
			4'h8: ssOut <= ~7'b1111111;
			4'h9: ssOut <= ~7'b1100111;
			4'hA: ssOut <= ~7'b1110111;
			4'hB: ssOut <= ~7'b1111100;
			4'hC: ssOut <= ~7'b0111001;
			4'hD: ssOut <= ~7'b1011110;
			4'hE: ssOut <= ~7'b1111001;
			4'hF: ssOut <= ~7'b1110001;
			default: ssOut <= ~7'b1001001;
		endcase
		anOut <= 4'b1110;
	end

	assign Led = sw[7:0];
	
endmodule
