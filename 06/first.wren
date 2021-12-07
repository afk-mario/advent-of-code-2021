import "io" for File

var fishes = File.read("./input.txt")
.trim()
.split(",").map{|item| Num.fromString(item)}.toList

var days = 80

System.print("Initial State = %(fishes)")
for (i in 1..days) {
	for (j in 0..fishes.count - 1) {
		fishes[j] = fishes[j] - 1

		if (fishes[j] < 0) {
			fishes[j] = 6
			fishes.add(8)
		}
	}
	System.print("Day %(i) = %(fishes)")
}

System.print(fishes)
System.print("Result = %(fishes.count)")