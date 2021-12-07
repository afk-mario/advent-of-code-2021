import "io" for File

var fishes = File.read("./input.txt")
.trim()
.split(",").map{|item| Num.fromString(item)}.toList

var counters = List.filled(9, 0)
var days = 256

for (fish in fishes) {
	counters[fish] = counters[fish] + 1
}

System.print("Initial State = %(fishes)")
System.print("Total = %(counters.reduce(0,Fn.new{|acc, curr| acc + curr})) - %(counters)")
System.print("-------------------------")
for (i in 1..days) {
	var toReset = counters[0]
	var toBorn = counters[0]

	counters[0] = counters[1]
	counters[1] = counters[2]
	counters[2] = counters[3]
	counters[3] = counters[4]
	counters[4] = counters[5]
	counters[5] = counters[6]

	counters[6] = counters[7] + toReset
	counters[7] = counters[8]

	counters[8] = toBorn

	System.print("Day %(i) = %(counters)")
}

var result = counters.reduce(0,Fn.new{|acc, curr| acc + curr})

System.print("Result = %(result)")