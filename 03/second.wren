import "io" for File
var input = File.read("./input.txt").trim().split("\n")

// For example, to determine the oxygen generator rating value using the same example diagnostic report from above:

//     Start with all 12 numbers and consider only the first bit of each number. There are more 1 bits (7) than 0 bits (5), so keep only the 7 numbers with a 1 in the first position: 11110, 10110, 10111, 10101, 11100, 10000, and 11001.
//     Then, consider the second bit of the 7 remaining numbers: there are more 0 bits (4) than 1 bits (3), so keep only the 4 numbers with a 0 in the second position: 10110, 10111, 10101, and 10000.
//     In the third position, three of the four numbers have a 1, so keep those three: 10110, 10111, and 10101.
//     In the fourth position, two of the three numbers have a 1, so keep those two: 10110 and 10111.
//     In the fifth position, there are an equal number of 0 bits and 1 bits (one each). So, to find the oxygen generator rating, keep the number with a 1 in that position: 10111.
//     As there is only one number left, stop; the oxygen generator rating is 10111, or 23 in decimal.


var oxygen = ""
var scrubber = ""
var criteria = input.count - 1
var columns = input[0].count - 1
var arr = input

for (column in 0..columns) {
	var zero = []
	var one = []
	System.print("criteria=%(arr.count)")
	for (num in arr) {
		var bit = num[column]
		System.print("Num=%(num) bit=%(bit) column=%(column)")
		if (bit == "0") {
			zero.add(num)
		}else {
			one.add(num)
		}
	}
	if (one.count > zero.count || one.count == zero.count) {
		arr = one
		oxygen = "%(oxygen)1"
	} else if (one.count < zero.count) {
		arr = zero
		oxygen = "%(oxygen)0"
	}
	System.print("------------------------")
	System.print("zero=%(zero)")
	System.print("one=%(one)")
	System.print("------------------------\n")
}


System.print("------------------------")
System.print("--------SCRUBBER--------")
System.print("------------------------\n\n\n")

arr = input
for (column in 0..columns) {
	var zero = []
	var one = []
	System.print("criteria=%(arr.count)")
	if (arr.count > 1) {
		for (num in arr) {
			var bit = num[column]
			System.print("Num=%(num) bit=%(bit) column=%(column)")
			if (bit == "0") {
				zero.add(num)
			}else {
				one.add(num)
			}
		}

		if (one.count > zero.count) {
			arr = zero
			scrubber = "%(scrubber)0"
		} else if (one.count < zero.count) {
			arr = one
			scrubber = "%(scrubber)1"
		}else {
			arr = zero
			scrubber = "%(scrubber)0"
		}
	} else {
		scrubber = arr[0]
	}

	System.print("------------------------")
	System.print("zero=%(zero)")
	System.print("one=%(one)")
	System.print("------------------------\n")
}


System.print("o=%(oxygen) - 10111")
System.print("s=%(scrubber) - 01010")