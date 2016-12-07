import csv
in_fnam = "Report/output.csv"
out_fnam = "Report/output_new.csv"
input = open(in_fnam, 'rt',encoding='ascii')
output = open(out_fnam, 'w',newline='')
writer = csv.writer(output)
for row in csv.reader(input):
    print(row)
    if not row:
        pass
    else:
        writer.writerow(row)
input.close()
output.close()