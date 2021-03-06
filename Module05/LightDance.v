/*--  *******************************************************
--  Computer Architecture Course, Laboratory Sources 
--  Amirkabir University of Technology (Tehran Polytechnic)
--  Department of Computer Engineering (CE-AUT)
--  https://ce[dot]aut[dot]ac[dot]ir
--  *******************************************************
--  All Rights reserved (C) 2019-2020
--  *******************************************************
--  Student ID  : 
--  Student Name: 
--  Student Mail: 
--  *******************************************************
--  Additional Comments:
--
--*/

/*-----------------------------------------------------------
---  Module Name: Light Dance
---  Description: Module5
-----------------------------------------------------------*/
`timescale 1 ns/1 ns

module LightDance (
	input        arst  , // async  reset
	input        clk   , // clock  posedge
	input        din   , // input  data
	input        load  , // load   enable 
	input  [7:0] pdata , // load   data
	output [7:0] qdata   // output data
);

	reg [7:0] dinput;
	
	if(load)
		begin
			assign dinput[7] = pdata[7];
			assign dinput[6] = pdata[6];
			assign dinput[5] = pdata[5];
			assign dinput[4] = pdata[4];
			assign dinput[3] = pdata[3];
			assign dinput[2] = pdata[2];
			assign dinput[1] = pdata[1];
			assign dinput[0] = pdata[0];
		end
    
	 else
		begin
			assign dinput[7] = qdata[0] ^ din;
			assign dinput[6] = qdata[7] ;
			assign dinput[5] = qdata[0] ^ qdata[6];
			assign dinput[4] = qdata[0] ^ qdata[5];
			assign dinput[3] = qdata[4];
			assign dinput[2] = qdata[3];
			assign dinput[1] = qdata[0] ^ qdata[2];
			assign dinput[0] = qdata[0] ^ qdata[1];
		end

		DFlop d0(arst, clk, dinput[0], 1, dout[0]);
		DFlop d1(arst, clk, dinput[1], 1, dout[1]);
		DFlop d2(arst, clk, dinput[2], 1, dout[2]);
		DFlop d3(arst, clk, dinput[3], 1, dout[3]);
		DFlop d4(arst, clk, dinput[4], 1, dout[4]);
		DFlop d5(arst, clk, dinput[5], 1, dout[5]);
		DFlop d6(arst, clk, dinput[6], 1, dout[6]);
		DFlop d7(arst, clk, dinput[7], 1, dout[7]);
		
endmodule
