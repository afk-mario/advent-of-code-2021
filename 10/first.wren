import "io" for File

var lines = File.read("./input.txt")
.trim()
.split("\n").toList

var openDict = {
	"(": ")",
	"[": "]",
	"{": "}",
	"<": ">",
}

var closeDict = {
	")": 3,
	"]": 57,
	"}": 1197,
	">": 25137,
}

var result = 0
var a = "["

for (line in lines) {
	System.print("\n%(line)")
	var open = []
	var isLineValid = true
	var i = 0
	for(char in line) {
		if (isLineValid) {
			var isOpen = openDict.containsKey(char)
			if (isOpen) {
				open.add(char)
			} else {
				var lastOpen = open[-1]
				var lastClose = openDict[lastOpen]
				if(char != lastClose) {
					System.print("Invalid at [%(i)] %(char) - %(closeDict[char])")
					result = result + closeDict[char]
					isLineValid = false
				}else {
					open.removeAt(-1)
				}
			}
		}
		i = i + 1
	}
	if (isLineValid) {
		System.print("Valid line")
	}
}

System.print(result)
