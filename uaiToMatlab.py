import numpy as np
import sys

if __name__ == '__main__':
	visnum = int(sys.argv[1])
	hidnum = int(sys.argv[2])
	inputName = sys.argv[3]
	lines = open(inputName, 'r').readlines()
	lines = map(lambda x: x.strip(), lines)
	i = 0
	while lines[i] != '':
		i = i+1
	i += 1 # starting at the first 2
	# visible biases
	visbiases = []
	while len(visbiases) != visnum:
		bias = float(lines[i+1].split()[-1])
		i += 2
		visbiases.append(bias)

	# hidden biases
	hidbiases = []
	while len(hidbiases) != hidnum:
		bias = float(lines[i+1].split()[-1])
		i += 2
		hidbiases.append(bias)

	# vis to hid
	vishid = []
	while len(vishid) != visnum:
		potential = []
		while len(potential) != hidnum:
			prob = float(lines[i+2].split()[-1])
			i += 3
			potential.append(prob)
		vishid.append(potential)

	print visbiases
	print hidbiases
	print vishid


