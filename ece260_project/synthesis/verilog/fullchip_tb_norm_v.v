// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 

`timescale 10ns/1ps

module fullchip_tb_norm_v;

parameter total_cycle = 8;   // how many streamed Q vectors will be processed
parameter bw = 8;            // Q & K vector bit precision
parameter bw_psum = 2*bw+4;  // partial sum bit precision
parameter pr = 8;           // how many products added in each dot product 
parameter col = 8;           // how many dot product units are equipped

integer qk_file ; // file handler
integer qk_scan_file ; // file handler


integer  captured_data;
integer  weight [col*pr-1:0];
`define NULL 0

integer  K0[col-1:0][pr-1:0];
integer  K1[col-1:0][pr-1:0];
integer  V[col-1:0][pr-1:0];
integer  Q[total_cycle-1:0][pr-1:0];
integer  result[total_cycle-1:0][col-1:0];
integer  sum[total_cycle-1:0];

integer i,j,k,t,p,q,s,u, m;

reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem0_in; 
reg [pr*bw-1:0] mem1_in;
reg [pr*bw_psum-1:0] vmem0_in;
reg [pr*bw_psum-1:0] vmem1_in;
reg ofifo_rd = 0;
reg mac2_ofifo_rd = 0;
wire [31:0] inst; 
reg vmem_rd = 0;
reg vmem_wr = 0; 
reg qmem_rd = 0;
reg qmem_wr = 0; 
reg kmem_rd = 0; 
reg kmem_wr = 0;
reg pmem_load = 0;
reg pmem_rd = 0; 
reg pmem_wr = 0; 
reg execute = 0;
reg load = 0;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;

reg sum_fifo_rd, sum_fifo_wr, norm_execute, add_sum;
reg mac2_execute = 0, mac2_load = 0, outmem_rd = 0, outmem_wr = 0;

assign inst[31] = outmem_rd;
assign inst[30] = outmem_wr;
assign inst[29] = mac2_ofifo_rd;
assign inst[28] = mac2_execute;
assign inst[27] = mac2_load;
assign inst[26] = pmem_load;
// assign inst[26:23] = out_add; // Don't actually need this 
assign inst[22] = vmem_rd;
assign inst[21] = vmem_wr;
assign inst[20] = norm_execute;
assign inst[19] = sum_fifo_rd; 
assign inst[18] = sum_fifo_wr; 
assign inst[17] =  add_sum;
assign inst[16] = ofifo_rd;
assign inst[15:12] = qkmem_add;
assign inst[11:8]  = pmem_add;
assign inst[7] = execute;
assign inst[6] = load;
assign inst[5] = qmem_rd;
assign inst[4] = qmem_wr;
assign inst[3] = kmem_rd;
assign inst[2] = kmem_wr;
assign inst[1] = pmem_rd;
assign inst[0] = pmem_wr;

reg [bw_psum-1:0] temp5b;
reg [bw_psum+3:0] temp_sum;
reg [bw_psum*col-1:0] temp16b;

fullchip #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) fullchip_instance (
      .reset(reset),
      .clk(clk), 
      .mem0_in(mem0_in), 
      .mem1_in(mem1_in),
      .vmem0_in(vmem0_in),
      .vmem1_in(vmem1_in),
      .inst(inst)
);

initial begin 

  $dumpfile("fullchip_tb_norm_v.vcd");
  $dumpvars(0,fullchip_tb_norm_v);

///// K data txt reading 0 /////

$display("##### Norm data txt reading 0 #####");

  for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end
  reset = 0;

  qk_file = $fopen("norm_core0.txt", "r");

  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          K0[q][j] = captured_data;
          //$display("##### %d\n", K[q][j]);
    end
  end
/////////////////////////////////

///// K data txt reading 1 /////

$display("##### Norm data txt reading 1 #####");

  for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end
  reset = 0;

  qk_file = $fopen("norm_core1.txt", "r");


  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          K1[q][j] = captured_data;
          //$display("##### %d\n", K[q][j]);
    end
  end
/////////////////////////////////

///// V data txt readind /////

$display("##### V data txt reading #####");

  for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end
  reset = 0;

  qk_file = $fopen("vdata.txt", "r");

  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          V[q][j] = captured_data;
          //$display("##### %d\n", K[q][j]);
    end
  end
/////////////////////////////////

$display("##### Feed in data for Norm 0 #####");
$display("---------------------------------------------------");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          $write(" %6d |", K0[q][j]);
    end
    $display("");
  end
$display("---------------------------------------------------");

$display("##### Feed in data for Norm 1 #####");
$display("---------------------------------------------------");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          $write(" %6d |", K1[q][j]);
    end
    $display("");
  end
$display("---------------------------------------------------");

$display("##### Feed in data for V #####");
$display("---------------------------------------------------");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          $write(" %6d |", V[q][j]);
    end
    $display("");
  end
$display("---------------------------------------------------");

/////////////// Estimated result printing /////////////////


// $display("##### Estimated multiplication result (HEX) #####");

//   for (t=0; t<total_cycle; t=t+1) begin
//      for (q=0; q<col; q=q+1) begin
//        result[t][q] = 0;
//      end
//   end

//   for (t=0; t<total_cycle; t=t+1) begin
//      for (q=0; q<col; q=q+1) begin
//          for (k=0; k<pr; k=k+1) begin
//             result[t][q] = result[t][q] + Q[t][k] * K[q][k];
//             //$display("Q[%2d][%2d] * K[%2d][%2d] = %2d * %2d", t, k, k, q, Q[t][k], K[k][q]);
//          end

//          temp5b = result[t][q]; // Stores current dot product
//          temp16b = {temp16b[139:0], temp5b}; // Concatenate results 
//           //$display("@cycle%2d: %3d", t, result[t][q]);
// //             $display("Q[%2d][%2d] * K[%2d][%2d] = %2d * %2d", k, t, k, q, Q[t][k], K[k][q]);

//      end

//      //$display("%d %d %d %d %d %d %d %d", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
//      //EXPECTED RESULTS 
//      $display("prd @cycle%2d: %40h", t, temp16b);
//   end
// $display("##### Estimated Multiplication Result (Decimal) #####");
// $display("---------------------------------------------------");

// for (t = 0; t < total_cycle; t = t + 1) begin
//     $write("Cycle %2d |", t);
//     for (q = 0; q < col; q = q + 1) begin
//         $write(" %6d |", result[t][q]); // Print each value with padding
//     end
//     $display(""); // Move to new line after printing all columns
// end

// $display("---------------------------------------------------");

//////////////////////////////////////////////

pmem_add = 0;
pmem_load = 1;
$display("##### Norm writing #####");

  for (q=0; q<col; q=q+1) begin

    #0.5 clk = 1'b0;  
    pmem_wr = 1; if (q>0) pmem_add = pmem_add + 1; 
    
    vmem0_in[1*bw_psum-1:0*bw_psum] = K0[q][0];
    vmem0_in[2*bw_psum-1:1*bw_psum] = K0[q][1];
    vmem0_in[3*bw_psum-1:2*bw_psum] = K0[q][2];
    vmem0_in[4*bw_psum-1:3*bw_psum] = K0[q][3];
    vmem0_in[5*bw_psum-1:4*bw_psum] = K0[q][4];
    vmem0_in[6*bw_psum-1:5*bw_psum] = K0[q][5];
    vmem0_in[7*bw_psum-1:6*bw_psum] = K0[q][6];
    vmem0_in[8*bw_psum-1:7*bw_psum] = K0[q][7];
    
    vmem1_in[1*bw_psum-1:0*bw_psum] = K1[q][0];
    vmem1_in[2*bw_psum-1:1*bw_psum] = K1[q][1];
    vmem1_in[3*bw_psum-1:2*bw_psum] = K1[q][2];
    vmem1_in[4*bw_psum-1:3*bw_psum] = K1[q][3];
    vmem1_in[5*bw_psum-1:4*bw_psum] = K1[q][4];
    vmem1_in[6*bw_psum-1:5*bw_psum] = K1[q][5];
    vmem1_in[7*bw_psum-1:6*bw_psum] = K1[q][6];
    vmem1_in[8*bw_psum-1:7*bw_psum] = K1[q][7];
    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  pmem_load = 0;
  pmem_wr = 0;  
  pmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////

///// Vmem writing  /////
qkmem_add = 0;
$display("##### Vmem writing #####");

  for (q=0; q<col; q=q+1) begin

    #0.5 clk = 1'b0;  
    vmem_wr = 1; if (q>0) qkmem_add = qkmem_add + 1; 
    
    vmem0_in[1*bw_psum-1:0*bw_psum] = V[q][7];
    vmem0_in[2*bw_psum-1:1*bw_psum] = V[q][6];
    vmem0_in[3*bw_psum-1:2*bw_psum] = V[q][5];
    vmem0_in[4*bw_psum-1:3*bw_psum] = V[q][4];
    vmem0_in[5*bw_psum-1:4*bw_psum] = V[q][3];
    vmem0_in[6*bw_psum-1:5*bw_psum] = V[q][2];
    vmem0_in[7*bw_psum-1:6*bw_psum] = V[q][1];
    vmem0_in[8*bw_psum-1:7*bw_psum] = V[q][0];

    vmem1_in[1*bw_psum-1:0*bw_psum] = V[q][7];
    vmem1_in[2*bw_psum-1:1*bw_psum] = V[q][6];
    vmem1_in[3*bw_psum-1:2*bw_psum] = V[q][5];
    vmem1_in[4*bw_psum-1:3*bw_psum] = V[q][4];
    vmem1_in[5*bw_psum-1:4*bw_psum] = V[q][3];
    vmem1_in[6*bw_psum-1:5*bw_psum] = V[q][2];
    vmem1_in[7*bw_psum-1:6*bw_psum] = V[q][1];
    vmem1_in[8*bw_psum-1:7*bw_psum] = V[q][0];

    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  vmem_wr = 0;  
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////

  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;  
    #0.5 clk = 1'b1;   
  end

$display("##### V data loading to processor #####");
    // col+1 -> col + 2 to capture
  for (q=0; q<col+2; q=q+1) begin
    #0.5 clk = 1'b0;  
    mac2_load = 1; 
    if (q==1) vmem_rd = 1;
    if (q>1) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  vmem_rd = 0; qkmem_add = 0;
  #0.5 clk = 1'b1;  

  #0.5 clk = 1'b0;  
  mac2_load = 0; 
  #0.5 clk = 1'b1;  

///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end

pmem_add = 0;
$display("##### Executing norm * value #####");
  // INCREASED TOTAL CYCLE BY 1 => CC delay from SRAM <= to load data into Q, 
  // so increased CC count 
  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    mac2_execute = 1; 
    pmem_rd = 1;

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end

    #0.5 clk = 1'b1;  
    
  end

  #0.5 clk = 1'b0;  
  pmem_rd = 0; pmem_add = 0; mac2_execute = 0;
  #0.5 clk = 1'b1;  

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end


///////////////////////////////////////////

/*
1) Read entire row from OFIFO
2) Store into VMEM
*/
 
pmem_add = -1;
$display("##### Storing result from 2nd OFIFO to OUTMEM #####");
for (q=0; q<8; q=q+1) begin
  #0.5 clk = 1'b0; 
  outmem_wr = 0;
  // Read from OFIFO
  if (q != 0)
    mac2_ofifo_rd = 1;
  #0.5 clk = 1'b1; #0.5 clk = 1'b0; 
  // Store results into FIFO sums
  mac2_ofifo_rd = 0;
  pmem_add = pmem_add + 1;
  outmem_wr = 1;
  #0.5 clk = 1'b1; 
end

$display("##### OUTMEM TO OUT #####"); 

#0.5 clk = 1'b0;  
outmem_rd = 1;
outmem_wr = 0; pmem_add = 0; mac2_ofifo_rd = 0;
for (q=0; q<total_cycle+1; q=q+1) begin
  #0.5 clk = 1'b0;  
  if (q>0) begin
      pmem_add = pmem_add + 1;
  end
  #0.5 clk = 1'b1;  

end

#0.5 clk = 1'b1;  


  #10 $finish;


end

endmodule




