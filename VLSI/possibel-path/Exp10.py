fname = input("Enter file name: ")
f = open(fname,'r')
g = {}
ip = []
op = []

c = f.readline()
while c != '':
    if c[0:5] == 'input' or c[0:6] == 'output' or c[0:4] == 'wire' or c[0:3] == 'reg':
        j = 0
        n = ''
        for i in c:
            if i == ' ' or i == ']':
                j = 1
            elif i == '[':
                j = 0
            elif j == 1:
                if i == ',' or i == ';':
                    if c[0:5] == 'input':
                        ip.append(n)
                    elif c[0:6] == 'output':
                        op.append(n)
                    g[n] = []
                    n = ''
                else:
                    n = n + i
    elif c[0:6] == 'module':
        j = 0
        n = ''
        for i in c:
            if i == ' ':
                j = 1
            elif j == 1:
                if i == '(':
                    print("\nModule name: ",n)
                    n = ''
                else:
                    n = n + i
    else:
        j = 0
        k = 0
        n = ''
        gate = ''
        for i in c:
            if i == ' ' or i == ']':
                j = 1
            elif i == '[':
                j = 0
            elif j == 1:
                if i == '(':
                    g[n] = []
                    gate = n
                    n =''
                elif i == ',' or i == ')':
                    k = k + 1
                    if k == 1:
                        g[gate].append(n)
                        n = ''
                    else:
                        g[n].append(gate)
                        n = ''
                else:
                    n = n + i
    c = f.readline()

f.close()

def display(l,s):
    l = l + ' ---> ' +s
    if s in op:
        print(l)
    else:
        for i in g[s]:
            display(l,i)

l = 'Inputs: '
for i in ip:
    l = l + i + ', '
print(l)

l = 'Outputs: '
for i in op:
    l = l + i + ', '
print(l)

print("\nAll possible paths from input to output:\n")

l = ''
for i in ip:
    l = l + i
    for j in g[i]:
        display(l,j)
    l = ''

