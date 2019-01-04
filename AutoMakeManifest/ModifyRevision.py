import sys

with open(sys.argv[1], 'r') as file:
    filedata = file.readlines()

new_filedata = ''

for line in filedata:
    working_repo = '"' + sys.argv[2] + '"'

    if working_repo in line :
        splited_line = line.split('/>')[0]
        line = splited_line + ' revision="' + sys.argv[3] + '"/>\n'
    
    new_filedata += line

with open(sys.argv[1], 'w') as file:
    file.write(new_filedata)