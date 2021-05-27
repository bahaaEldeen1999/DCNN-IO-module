f = open("compressOutput.txt", "r")
f2 = open("memOutput.txt", "r")
startingOffset=16
imageSize=1024
for i in range(startingOffset):
    f2.readline()
x=["bin_filtersconv2d_1.txt","bin_biasesconv2d_1.txt",
   "bin_filtersconv2d_2.txt","bin_biasesconv2d_2.txt",
   "bin_filtersconv2d_3.txt","bin_biasesconv2d_3.txt",
    "bin_biasesdense_1.txt","bin_weightsdense_1.txt",
    "bin_biasesdense_2.txt","bin_weightsdense_2.txt"]
fres = open("result.txt", "w")

for k in x:
    with open(k) as f4:
        for line in f4:
            lin2=line.strip('\n')
            newLine=f2.readline()
            number_bin = (bin(int(newLine.strip()))[2:]) 
            number_bin = number_bin.zfill(8)
            newLine=f2.readline()
            number_bin2 = (bin(int(newLine.strip()))[2:]) 
            number_bin2 = number_bin2.zfill(8)
            if(lin2!=(number_bin+number_bin2)):
                print(False)
        
for i in range(imageSize):
    a=f.readline().strip()
    b=f2.readline().strip()
    fres.write(a+" "+b+" \n")
    if(a!=b):
        print(False)

fres.close()