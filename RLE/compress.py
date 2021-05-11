# 8 bits 1-bit 0/1 ....... => repitionis (0-127) 8 8 8 8

from skimage import io
import numpy as np
import matplotlib as mb
from matplotlib import pyplot,cm
def convertImgToUINT8(img_o):
    img = np.copy(img_o)
    img = img.astype(np.float64) / np.max(img)
    img = 255 * img
    img = img.astype(np.uint8)
    return img
img = io.imread("img.jpeg",as_gray=True)
img = convertImgToUINT8(img)
print(img[0][0])
compressed_arr =[]

string = ""
for i in range(img.shape[0]):
    for j in range(img.shape[1]):
        number_bin = (bin(img[i][j])[2:]) 
        number_bin = number_bin.zfill(8)
        string += number_bin


##  compress
print(string[0:8])
pos = 0 
value = 0 
repitions = 0
while pos < len(string):
    #print(pos)
    curr_val = string[pos]
    repitions = 1
    pos = pos + 1
    while pos < len(string) and string[pos] == curr_val:
        repitions += 1
        pos += 1
        if repitions == 127:
            break
    temp_string = (bin(repitions)[2:])
    #print(temp_string)
    temp_string = temp_string.zfill(7)
    compressed_string = curr_val+temp_string
    #print(compressed_string)
    #print(temp_string,curr_val,compressed_string)
    # 000000001 => 1 => 0b1
    compressed_arr.append(int(compressed_string,2)) 
    #print(compressed_arr[-1])
    #break


### decompress 
'''
img_decompressed = np.zeros(img.shape[0]*img.shape[1])
img_decompressed_string = ""
for i in range(len(compressed_arr)):
    temp = (bin(compressed_arr[i])[2:]).zfill(8)
    #print("temp",temp)
    curr_val = temp[0]
    repitions =  int(temp[1:],2)
    #print(curr_val,repitions)
    #break
    img_decompressed_string += curr_val*repitions
i = 0 
j=0
print(img_decompressed_string[0:8])
while i < len(img_decompressed_string):
    byte = img_decompressed_string[i:i+8]
    i += 8
    if not byte:
        break
    img_decompressed[j] = int(byte,2)
    j+=1

img_decompressed = img_decompressed.reshape(img.shape)
io.imshow(img_decompressed)

pyplot.imshow(img_decompressed,cmap=cm.gray)
pyplot.show()

for i in range(img.shape[0]):
    for j in range(img.shape[1]):
        if img_decompressed[i][j] != img[i][j]:
           print("error ", img_decompressed[i][j] , img[i][j])


'''