import "io" for File

var signals = File.read("./input.txt")
.trim()
.split("\n")
.map{|signal| signal.split("|")}.map{|s| s.map{|a| a.trim().split(" ")}.toList }.toList

var result = 0
for (signal in signals) {
	var map = {}
	var arr = List.filled(10, null)
	for (pattern in signal[0]) {
		var value = null
		if (pattern.count == 2) {
			value = 1
		}else if(pattern.count == 4) {
			value = 4
		}else if(pattern.count == 3) {
			value = 7
		}else if(pattern.count == 7) {
			value = 8
		}

		map[pattern] = value
		if (value) {
			arr[value] = pattern
		}
	}


	// Lines index
	//  ..0..
	// .     .
	// 6     1
	// .     .
	//  ..2..
	// .     .
	// 5     3
	// .     .
	//  ..4..

	var lines = List.filled(7, null)

	// 6
	for (pattern in signal[0]) {
		if (pattern.count == 6) {
 			for (letter in arr[1]) {
 				if (!pattern.contains(letter)) {
 					lines[1] = letter
 					map[pattern] = 6
 					arr[6] = pattern
 				}
			}
		}
	}

	// 5
	for (pattern in signal[0]) {
		if (pattern.count == 5) {
 			if (!pattern.contains(lines[1])) {
 				map[pattern] = 5
				arr[5] = pattern
 				for (letter in arr[8]) {
 					if (letter != lines[1] && !pattern.contains(letter)){
 						lines[5] = letter
 					}
 				}
 			}
		}
	}

	// 9
	for (pattern in signal[0]) {
		if (pattern.count == 6) {
 			if (!pattern.contains(lines[5])) {
 				map[pattern] = 9
				arr[9] = pattern
 			}
		}
	}

	// 3
	for (pattern in signal[0]) {
		if (pattern.count == 5 && pattern != arr[5]) {
 			if (!pattern.contains(lines[5])) {
 				map[pattern] = 3
				arr[3] = pattern
 				for (letter in arr[8]) {
 					if (letter != lines[5] && !pattern.contains(letter)){
 						lines[6] = letter
 					}
 				}
 			}
		}
	}

	// 2
	for (pattern in signal[0]) {
		if (pattern.count == 5 && pattern != arr[3]) {
 			if (!pattern.contains(lines[6])) {
 				map[pattern] = 2
				arr[2] = pattern
 			}
		}
	}

	// 0
	for (pattern in signal[0]) {
		if (!arr.contains(pattern)) {
			map[pattern] = 0
			arr[0] = pattern
		}
	}

	var ecc = ""
	for (output in signal[1]) {
		// Find the pattern that has the same count and 
		// contains all letter from the output
		var res = arr.where{|pattern| pattern.all{|letter| output.contains(letter) && output.count == pattern.count}}.toList
		var index = res[0]
		var value = map[index]
		ecc = "%(ecc)%(value)"
	}

	System.print("%(signal[1]) - %(ecc)")
	result = result + Num.fromString(ecc)
}

System.print("\n\nResult = %(result)\n\n")
