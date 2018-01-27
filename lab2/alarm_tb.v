`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:50 12/29/2016
// Design Name:   alarm
// Module Name:   C:/Users/Mark/Dropbox/EE209/Lab/alarm/alarm_tb.v
// Project Name:  alarm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alarm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alarm_tb;

	// Inputs
	reg N;
	reg X;
	reg W;
	reg D;
	reg G;
	integer i;

	// Outputs
	wire A;

	// Instantiate the Unit Under Test (UUT)
	alarm uut (
		.N(N), 
		.X(X), 
		.W(W), 
		.D(D), 
		.G(G), 
		.A(A)
	);

	initial begin
		// Initialize Inputs
		N = 0;
		X = 0;
		W = 1;
		D = 1;
		G = 1; // Start with secure (W,D,G=1,1,1)

		// Wait 100 ns for global reset to finish
		#1; //***
        
		// Add stimulus here
		N = 1;  	// Enabled, not eXiting, and Secure
					// Alarm should be off
		#1; //***
		
					// Window breaks
		W = 0;  	// Enabled, not eXiting, and NOT Secure
					// Alarm should be on
		#1; //***

		W = 1;	// Window now secure but Door = 0
		D = 0;  	// Enabled, not eXiting, and NOT Secure
					// Alarm should be on
		#1; //***

		D = 1;	// Door now secure but Garage = 0
		G = 0;  	// Enabled, not eXiting, and NOT Secure
					// Alarm should be on
		#1; //***

		D = 0;	// Garage secure, Door not secure, Exiting = 1
		G = 1;  	// Alarm should be off
		X = 1; 
		
		#1; //***
		
		X = 0;  	// Not exiting but now not enabled
		N = 0;	// Alarm should be off
		#1; //***
		
		//N = 0;
		//X = 0;
		//W = 0; 
		//D = 0;
		//G = 0; // start exhaustive test
		#20; 
		////int c1;
		//int c2;
		//int c3; 
		//int c4;
		//int c5;
		
		for(i = 0; i < 32; i = i + 1) begin
			{N,X,W,D,G} = i;
			#10;
		end
		//for ( c1 = 0; c1  < 2; c1 = c1 + 1 ) begin
		//	N = c1;
		//	for ( c2 = 0; c2 < 2; c2 = c2 + 1 ) begin
		//		X = c2;
		//		for ( c3 = 0; c3 < 2; c3 = c3 + 1) begin
		//			W = c3;
		//			for ( c4 = 0; c4 < 2; c4 = c4 + 1  ) begin
		//				D = c4;
		//				for ( c5 = 0; c5 < 2; c5 = c5 + 1 ) begin
		//					G = c5;
		//					#10;
		//				end
		//			#10;
		//			end
		//		#10;
		//		end
		//	#10;
		//	end
		//#10;
		//end
	
      end
endmodule

