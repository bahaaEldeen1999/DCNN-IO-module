def float_to_bin(number):
    # seperates intger part and decimal part
    int_part, dec_part = str(number).split(".")

    # Convert the two parts from string to integer
    int_part = int(int_part)
    dec_part = int(dec_part)

    # Convert intger part to binary
    result = '{0:05b}'.format(int_part)
    # result = bin(int_part).lstrip("0b") + "."

    # convert decimal part to binary
    for x in range(11):
        while dec_part > 1:
            dec_part /= 10

        binary_bit, dec_part = str(dec_part * 2).split(".")
        result += binary_bit
        dec_part = int(dec_part)

    return result


input_name = "weightsdense_2.txt"
output_name = "output/bin_" + input_name
output_file = open(output_name, "w")
lines = []

with open(input_name) as f:
    lines = f.readlines()

for line in lines:
    if (not line.startswith('--')) and (not line.startswith(' ')) and (not line.startswith('\n')):
        numbers = line.split()
        for i in numbers:
            output_file.write(float_to_bin('{:.10f}'.format(float(i))))
            output_file.write('\n')
