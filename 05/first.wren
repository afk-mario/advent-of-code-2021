import "io" for File
import "./line" for Line

var input = File.read("./input.txt").trim().split("\n").map{|item| item.split(",").map{|num| Num.fromString(num)}.toList}
var lines = input.map{|arr| Line.new(arr[0], arr[1], arr[2], arr[3])}


var grid = {}
var points = []
var acc = 0

for (line in lines) {
	for (point in line.points) {
		var id = "%(point.x)-%(point.y)"
		if (grid[id] == null) {
			grid[id] = 1
		}else {
			System.print(id)
			if(grid[id] == 1) {
				acc = acc + 1
			}
			grid[id] = grid[id] + 1
		}
	}
// 	points.addAll(line.points)
}

// for (point in points) {
// 		var x = point.x
// 		var y = point.y
// 		if (grid[y] == null) {
// 			grid[y] = []
// 		}

// 		if (grid[y][x] == null) {
// 			grid[y][x] = 0
// 		}

// 		grid[y][x] = grid[x][y] + 1
// 	}


System.print(acc)
