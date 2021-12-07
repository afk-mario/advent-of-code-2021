import "io" for File

var crabs = File.read("./input.txt")
.trim()
.split(",").map{|item| Num.fromString(item)}.toList

var max = crabs.reduce(0,  Fn.new{|acc, curr| acc.max(curr)})
var positions = List.filled(max, 0)
// System.print("Crabs=%(crabs)")
System.print("Max=%(max)")


var least = null
for (position in 0..max-1) {
	var fuel = crabs.reduce(
		0,
		Fn.new{|acc, curr| 
			var steps = (curr - position).abs
			var sum = (steps / 2) * (1 + steps)
			return acc + sum
		}
	)
	var map  = {"position": position, "fuel": fuel}
	if (least == null ) {
		least = map
	}
	if (least["fuel"] > fuel) {
		least = map
	}
}


System.print("Least = %(least)")
