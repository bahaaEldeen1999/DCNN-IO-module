module decompress(in1,in2,out,byteIndx,bitIndx,done,work);
input[7:0] in1,in2;
output done; 
output[255:0] out;
output[31:0] byteIndx;
output[2:0] bitIndx;

integer i ;
integer  j ;
integer rep ;
integer currValue ;
reg[7:0] temp;
reg[255:0] tempOut;
integer k=7;
integer doneTemp=0;
integer tempRepLoop ;
integer  tempByteIndx,tempBitIndx;
input work;
always @(in1 , in2,work) begin
    
doneTemp = 0;
rep = in1[6:0]; 
 currValue = in1[7];
 tempBitIndx = 7;
 j=0;
 i=16;
 $display("currValue %d\n",currValue);
     repeat (16) begin

       //  $display("rep  %d  \n",rep);
         if (rep>0) begin
             // write from th left to the right
             tempByteIndx = j; 
             if (rep>=8) begin 
               k = 0;
               repeat (8) begin
                   temp[k] = currValue;
                   k = k+1;
               end
             end
             else begin 
                 //temp = {(8){0}}; 
                 k=7;
                 tempRepLoop = rep;
                 repeat (8) begin 
                    if (tempRepLoop > 0 ) begin
                        tempRepLoop = tempRepLoop-1;
                        temp[k] = currValue;
                        k = k-1;
                        tempBitIndx = k;
                    end
                    else  begin
                        temp[k] = currValue==1?0:1;
                        //$display("print %d\n",(currValue==1?0:1));
                        k=k-1;
                    end
                   
                 end
             end
             
          //   $display("temp %d\n",temp);
             // tempOut[j*8:(j+1)*8-1] = temp;
            
         end
         else begin 
             k =0;
             repeat (8) begin
                  temp[k] = currValue==1?0:1;
                  k = k+1;
             end
         end 
          k =0;
             repeat (8) begin
                  tempOut[255-(j*8+k)] = temp[8-k-1];
                  k = k+1;
             end
         rep = rep-8;
         j=j+1;
     end 
     doneTemp = 1;


end

assign byteIndx = tempByteIndx;
assign bitIndx = tempBitIndx;
assign  out = tempOut;
assign done = doneTemp;
endmodule;

// 
// 