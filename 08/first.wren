import "io" for File

var signals = File.read("./input.txt")
.trim()
.split("\n")
.map{|signal| signal.split("|")}.map{|s| s.map{|a| a.trim().split(" ")}.toList }.toList

// 1 = 2
// 4 = 4
// 7 = 3
// 8 = 7
// In the output values, how many times do digits 1, 4, 7, or 8 appear?

var acc = 0
for (signal in signals) {
	for (output in signal[1]) {
		if (output.count == 2 || output.count == 4 || output.count == 3 || output.count == 7 ) {
			acc = acc + 1
		}
	}
}

System.print("Result = %(acc)")
