f = open("compressOutput.txt", "r")
f2 = open("memOutput.txt", "r")
startingOffset=18
imageSize=1024
for i in range(startingOffset):
    f2.readline()
x=[
    "../modules/parameters/bin_filtersconv2d_1.txt","../modules/parameters/bin_biasesconv2d_1.txt",
    "../modules/parameters/bin_filtersconv2d_2.txt","../modules/parameters/bin_biasesconv2d_2.txt",
   "../modules/parameters/bin_filtersconv2d_3.txt","../modules/parameters/bin_biasesconv2d_3.txt",
    "../modules/parameters/bin_biasesdense_1.txt","../modules/parameters/bin_weightsdense_1.txt",
    "../modules/parameters/bin_biasesdense_2.txt","../modules/parameters/bin_weightsdense_2.txt"
]
fres = open("result.txt", "w")

for k in x:
    with open(k) as f4:
        for line in f4:
            lin2=line.strip('\n')
            newLine=f2.readline()
            number_bin = (bin(int(newLine.strip()))[2:]) 
            number_bin= number_bin.zfill(16)
            if(lin2!=(number_bin)):
               print(False)
for i in range(imageSize):
    a=f.readline().strip()
    b=f2.readline().strip()
    fres.write(a+" "+b+" \n")
    if(a!=b):
        print(False)

fres.close()
