`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                // Primary test inputs
  wire nA, nB, nAandnB, nAorB, AandB, nAandB;    // Test outputs

  demorgan dut0(A, B, nA, nB, nAandnB);  // Module to be tested
  demorgan2 dut1(A, B, AorB, nAorB); //2nd module, equal to 1st module
  demorgan3 dut2(A,B,AandB,nAandB);//3rd module
  demorgan4 dut3(A,B,nA,nB,nAornB);//4th and final module, equal to 3rd module

  // Run sequence of test stimuli
  initial begin
    $display("~A~B");
    $display("A B | ~A ~B | ~A~B ");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |    %b  ", A,B, nA, nB, nAandnB);


    $display("~(A+B)");
    $display("A B | A+B | ~(A+B)");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  | %b", A,B, AorB, nAorB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  | %b", A,B, AorB, nAorB);
    A=1;B=0; #1
    $display("%b %b |  %b  | %b", A,B, AorB, nAorB);
    A=1;B=1; #1
    $display("%b %b |  %b  | %b", A,B, AorB, nAorB);

    $display("_____________________________________________________________________________");

    $display("~(AB)");
    $display("A B | AB | ~(AB)");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  | %b", A,B, AandB, nAandB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  | %b", A,B, AandB, nAandB);
    A=1;B=0; #1
    $display("%b %b |  %b  | %b", A,B, AandB, nAandB);
    A=1;B=1; #1
    $display("%b %b |  %b  | %b", A,B, AandB, nAandB);

    $display("~A+ ~B");
    $display("A B | ~A ~B  | ~A + ~B");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b | %b", A,B, nA, nB, nAornB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b | %b", A,B, nA, nB, nAornB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b | %b", A,B, nA, nB, nAornB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b | %b", A,B, nA, nB, nAornB);

  end

endmodule    // End demorgan_test