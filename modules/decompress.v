module decompress(in1,in2,out,byteIndx,bitIndx,done,work);
input[7:0] in1,in2;
output done; 
output[255:0] out;
output[31:0] byteIndx;
output[2:0] bitIndx;

integer c;
integer rep ;
integer currValue ;
integer rep2 ;
integer currValue2 ;

reg[255:0] tempOut;

integer doneTemp=0;

integer index;
input work;
always @(in1 , in2, work) begin
c=0;
doneTemp = 0;
rep = in1[6:0]; 
 currValue = in1[7];
 rep2 = in2[6:0]; 
 currValue2 = in2[7];
 index=255;
     repeat (256) begin

         if (rep>0) begin
            rep=rep-1;
            tempOut[index] = currValue;
            index=index-1;
            end
            if(rep==0 && c==0) begin
                rep=rep2;
                currValue=currValue2;
                c=1;
            end
     end 
     
     doneTemp = 1;


end
assign  byteIndx = (in1[6:0]+in2[6:0])/8;
assign bitIndx = 7-(in1[6:0]+in2[6:0])%8;
assign  out = tempOut;
assign done = doneTemp;
endmodule;