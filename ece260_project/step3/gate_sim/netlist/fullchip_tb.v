// Created by prof. Mingu Kang @VVIP Lab in UCSD ECE department
// Please do not spread this code without permission 

`timescale 10ns/1ps

module fullchip_tb;

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

integer  K[col-1:0][pr-1:0];
integer  Q[total_cycle-1:0][pr-1:0];
integer  result[total_cycle-1:0][col-1:0];
integer  sum[total_cycle-1:0];

integer i,j,k,t,p,q,s,u, m;

reg reset = 1;
reg clk = 0;
reg [pr*bw-1:0] mem_in; 
reg ofifo_rd = 0;
wire [16:0] inst; // <= Keep inst as 16:0? represents 17 values... why?
reg qmem_rd = 0;
reg qmem_wr = 0; 
reg kmem_rd = 0; 
reg kmem_wr = 0;
reg pmem_rd = 0; 
reg pmem_wr = 0; 
reg execute = 0;
reg load = 0;
reg [3:0] qkmem_add = 0;
reg [3:0] pmem_add = 0;

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
wire [bw_psum*col-1:0] fullchipout; // TAHSEEN EDIT 

fullchip #(.bw(bw), .bw_psum(bw_psum), .col(col), .pr(pr)) fullchip_instance (
      .reset(reset),
      .clk(clk), 
      .mem_in(mem_in), 
      .inst(inst),
      .full_out(fullchipout)
);

initial begin 

  $dumpfile("fullchip_tb.vcd");
  $dumpvars(0,fullchip_tb);



///// Q data txt reading /////

$display("##### Q data txt reading #####");


  qk_file = $fopen("qdata.txt", "r");


  for (q=0; q<total_cycle; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          Q[q][j] = captured_data;
          //$display("%d\n", Q[q][j]);
    end
  end
/////////////////////////////////




  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end




///// K data txt reading /////

$display("##### K data txt reading #####");

  for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
  end
  reset = 0;

  qk_file = $fopen("kdata.txt", "r");


  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          qk_scan_file = $fscanf(qk_file, "%d\n", captured_data);
          K[q][j] = captured_data;
          //$display("##### %d\n", K[q][j]);
    end
  end
/////////////////////////////////





$display("##### Feed in data for Q  #####");
$display("---------------------------------------------------");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          $write(" %6d |", Q[q][j]);
    end
    $display("");
  end
$display("---------------------------------------------------");

$display("##### Feed in data for K  #####");
$display("---------------------------------------------------");
  for (q=0; q<col; q=q+1) begin
    for (j=0; j<pr; j=j+1) begin
          $write(" %6d |", K[q][j]);
    end
    $display("");
  end
$display("---------------------------------------------------");



/////////////// Estimated result printing /////////////////


$display("##### Estimated multiplication result (HEX) #####");

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
       result[t][q] = 0;
     end
  end

  for (t=0; t<total_cycle; t=t+1) begin
     for (q=0; q<col; q=q+1) begin
         for (k=0; k<pr; k=k+1) begin
            result[t][q] = result[t][q] + Q[t][k] * K[q][k];
            $display("Q[%2d][%2d] * K[%2d][%2d] = %2d * %2d", t, k, q, k, Q[t][k], K[q][k]);
         end

         temp5b = result[t][q]; // Stores current dot product
         temp16b = {temp16b[139:0], temp5b}; // Concatenate results 
          $display("@cycle%2d: %3d", t, result[t][q]);
//             $display("Q[%2d][%2d] * K[%2d][%2d] = %2d * %2d", k, t, k, q, Q[t][k], K[k][q]);

     end

     //$display("%d %d %d %d %d %d %d %d", result[t][0], result[t][1], result[t][2], result[t][3], result[t][4], result[t][5], result[t][6], result[t][7]);
     //EXPECTED RESULTS 
     $display("prd @cycle%2d: %40h", t, temp16b);




  end
$display("##### Estimated Multiplication Result (Decimal) #####");
$display("---------------------------------------------------");

for (t = 0; t < total_cycle; t = t + 1) begin
    $write("Cycle %2d |", t);
    for (q = 0; q < col; q = q + 1) begin
        $write(" %6d |", result[t][q]); // Print each value with padding
    end
    $display(""); // Move to new line after printing all columns
end

$display("---------------------------------------------------");

//////////////////////////////////////////////






///// Qmem writing  /////

$display("##### Qmem writing  #####");

  for (q=0; q<total_cycle; q=q+1) begin

    #0.5 clk = 1'b0;  
    qmem_wr = 1;  if (q>0) qkmem_add = qkmem_add + 1; 
    
    mem_in[1*bw-1:0*bw] = Q[q][0];
    mem_in[2*bw-1:1*bw] = Q[q][1];
    mem_in[3*bw-1:2*bw] = Q[q][2];
    mem_in[4*bw-1:3*bw] = Q[q][3];
    mem_in[5*bw-1:4*bw] = Q[q][4];
    mem_in[6*bw-1:5*bw] = Q[q][5];
    mem_in[7*bw-1:6*bw] = Q[q][6];
    mem_in[8*bw-1:7*bw] = Q[q][7];

    #0.5 clk = 1'b1;  

  end


  #0.5 clk = 1'b0;  
  qmem_wr = 0; 
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////





///// Kmem writing  /////

$display("##### Kmem writing #####");

  for (q=0; q<col; q=q+1) begin

    #0.5 clk = 1'b0;  
    kmem_wr = 1; if (q>0) qkmem_add = qkmem_add + 1; 
    
    mem_in[1*bw-1:0*bw] = K[q][0];
    mem_in[2*bw-1:1*bw] = K[q][1];
    mem_in[3*bw-1:2*bw] = K[q][2];
    mem_in[4*bw-1:3*bw] = K[q][3];
    mem_in[5*bw-1:4*bw] = K[q][4];
    mem_in[6*bw-1:5*bw] = K[q][5];
    mem_in[7*bw-1:6*bw] = K[q][6];
    mem_in[8*bw-1:7*bw] = K[q][7];


    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  kmem_wr = 0;  
  qkmem_add = 0;
  #0.5 clk = 1'b1;  
///////////////////////////////////////////



  for (q=0; q<2; q=q+1) begin
    #0.5 clk = 1'b0;  
    #0.5 clk = 1'b1;   
  end


// MATRIX MULTIPLICATION, entire K is always needed, so its preloaded before execution 
// Q values are fetchec dynamically during execution 

/////  K data loading  /////
$display("##### K data loading to processor #####");
    // col+1 -> col + 2 to capture
  for (q=0; q<col+2; q=q+1) begin
    #0.5 clk = 1'b0;  
    load = 1; 
    if (q==1) kmem_rd = 1;
    if (q>1) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  kmem_rd = 0; qkmem_add = 0;
  #0.5 clk = 1'b1;  

  #0.5 clk = 1'b0;  
  load = 0; 
  #0.5 clk = 1'b1;  

///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end





///// execution  /////
$display("##### execute #####");
  // INCREASED TOTAL CYCLE BY 1 => CC delay from SRAM <= to load data into Q, 
  // so increased CC count 
  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    execute = 1; 
    qmem_rd = 1;

    if (q>0) begin
       qkmem_add = qkmem_add + 1;
    end

    #0.5 clk = 1'b1;  
  end

  #0.5 clk = 1'b0;  
  qmem_rd = 0; qkmem_add = 0; execute = 0;
  #0.5 clk = 1'b1;  


///////////////////////////////////////////

 for (q=0; q<10; q=q+1) begin
    #0.5 clk = 1'b0;   
    #0.5 clk = 1'b1;   
 end




////////////// output fifo rd and wb to psum mem ///////////////////
// pMEM results 
$display("##### move ofifo to pmem #####");
pmem_add = 0; 
  for (q=0; q<total_cycle; q=q+1) begin
    #0.5 clk = 1'b0;  
    ofifo_rd = 1; 
    pmem_wr = 1; 

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end
  #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b0;  
  $display("##### PMEM TO OUT #####");
  pmem_rd = 1;
  pmem_wr = 0; pmem_add = 0; ofifo_rd = 0;
  for (q=0; q<total_cycle+1; q=q+1) begin
    #0.5 clk = 1'b0;  

    if (q>0) begin
       pmem_add = pmem_add + 1;
    end
    #0.5 clk = 1'b1;  

  end

  #0.5 clk = 1'b1;  


///////////////////////////////////////////




  #0.50 $finish;


end
// Declare variables
reg [bw_psum*col-1:0] expected_out; 
integer first = 0;  // assuming 'k' is an integer index for the cycles
integer second = 0;  // assuming 'p' is the column index
//integer m = 0;  // This could be used for other shifting logic

always @(posedge clk) begin
    if ($time > 825000) 
        // Store the current value into expected_out when pmem_rd is high
        expected_out <= result[first][second];  // or whatever value you want to store in expected_out
        
        // Increment p until it reaches col-1, then reset p and increment k
        if (second < col - 1) begin
            second <= second + 1;  // Increment p until it reaches col-1
        end else begin
            second <= 0;      // Reset p to 0 when it reaches col-1
            first <= first + 1;  // Increment k when p resets
        end
end

endmodule




