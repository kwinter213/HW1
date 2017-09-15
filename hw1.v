module demorgan
(
  //~A~B
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB    // Single bit output, (~A)*(~B)

);
  wire nA;
  wire nB;
  not Ainv(nA, A);    // Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB);   // AND gate produces nAandnB from nA and nB

endmodule
//________________________________________________________________________________________________
module demorgan2
(
  //~(A+B)
    input  A,          // Single bit inputs
    input  B,
    output AorB,
    output nAorB  //Single bit output, ~(A+B)
);
    or orgate(AorB,A,B);   //OR gate produces nAorB from A and B
    not invAorB(nAorB, AorB);

endmodule
//____________________________________________________________________________________________
module demorgan3
(
  //~(AB)
    input A,
    input B,
    output AandB,
    output nAandB
);
    and AandBgate(AandB, A, B); 
    not invAandB(nAandB, AandB);

endmodule
//_______________________________________________________________________________________________________
module demorgan4
(
  //~A+~B
    input A,
    input B,
    output nA,
    output nB,
    output nAornB
);
    not Ainv(nA,A);
    not Binv(nB,B);
    or orgate(nAornB,nA,nB);

endmodule