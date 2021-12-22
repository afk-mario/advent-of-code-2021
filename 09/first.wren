import "io" for File

var map = File.read("./input.txt")
.trim()
.split("\n").map{|line| line.map{|num| Num.fromString(num)}.toList}.toList

var vecinos = [[0,-1], [1, 0], [0, 1], [-1, 0]]

var acc = 0

for(y in 0..map.count -1) {
	var row = map[y]
	for (x in 0..row.count-1) {
		var isLower = true
		var num = row[x]
// 		System.print("")
// 		System.print("---------\nTesting %(num) at [%(x), %(y)]")
		for (coords in vecinos) {
			var nx = x + coords[0]
			var ny = y + coords[1]
			
// 			System.print("Against -> %(nx) %(ny)")

			if (ny < map.count && ny > -1) {
				if (nx < map[ny].count && nx > -1) {
					var vecino = map[ny][nx]
// 					System.print("Vecino = %(vecino) at [%(nx), %(ny)]")

					if (vecino <= num) {
						isLower = false
					}
				}
			}
		}

		if (isLower) {
			System.print("---------\nFound lower: %(num) at [%(x), %(y)]")
			acc = acc + num + 1
		}
	}
}

System.print("Result: %(acc)")