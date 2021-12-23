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
	")": 1,
	"]": 2,
	"}": 3,
	">": 4,
}

var scores = []
for (line in lines) {
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
// 					System.print("Invalid at [%(i)] %(char)")
// 					System.print("\n%(line)")
					isLineValid = false
				}else {
					open.removeAt(-1)
				}
			}
		}
		i = i + 1
	}


	if (isLineValid) {
		var score = 0
		var closeString = ""

		for (char in open) {
			var closeChar = openDict[char]
			closeString = "%(closeChar)%(closeString)"
		}

		for (char in closeString) {
			var value = closeDict[char]
			score = (score * 5) + value
		}

		scores.add(score)

		System.print("Valid line score=%(score)")
		System.print("%(closeString)")
		System.print("%(line)\n")
	}
}

scores = scores.sort()
var index = (scores.count / 2).floor
var result = scores[index]
System.print(scores)
System.print("Index = %(index)  Result = %(result)")