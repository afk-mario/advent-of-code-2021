import "io" for File
var input = File.read("./input.txt").trim().split("\n")
var columns = [
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
	{"0": 0, "1": 0},
]


for (i in input) {
	var index = 0
	for (j in i) {
		columns[index][j] = columns[index][j] + 1
		index = index + 1
	}
}

// Each bit in the gamma rate can be determined by
// finding the most common bit in the corresponding position of all numbers in the diagnostic report.
var gama = ""

// The epsilon rate is calculated in a similar way;
// rather than use the most common bit, the least common bit from each position is used.
var epsilon = ""

for (i in columns) {
	if (i["0"] > i["1"]) {
		gama = "%(gama)0"
		epsilon = "%(epsilon)1"
	}else {
		gama = "%(gama)1"
		epsilon = "%(epsilon)0"
	}
}

System.print(gama)
System.print(epsilon)
