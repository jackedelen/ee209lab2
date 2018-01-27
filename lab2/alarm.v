`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:55:19 08/27/2016 
// Design Name: 
// Module Name:    alarm_top 
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
module alarm(
    input N,
    input X,
    input W,
    input D,
    input G,
    output A
    );

	// Complete the design of the home alarm system
	wire w0, w1, w2, w3, w4, w5; // declare wires
	not u0(Wn, W);
	not u1(Dn, D);
	not u2(Gn, G); // inverters for secure check on WDG
	and u3(w5, Wn, Dn, Gn); // and inverted WDG
	not u4(Xn, X);
	and u5(A, N, Xn, w5); // final and gate
	
endmodule
