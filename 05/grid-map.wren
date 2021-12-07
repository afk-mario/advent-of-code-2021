class GridMap {
	width { _width }
	height { _height }
	lines { _lines }
	lines = (value) {
		_lines = value
		_width = value.reduce(0,Fn.new{|acc, curr| acc.max(curr.a.x.max(curr.b.x))}) + 1
		_height = value.reduce(0,Fn.new{|acc, curr| acc.max(curr.a.y.max(curr.b.y))}) + 1
		
	}

	construct new () {
		lines = []
	}

	construct new (plines) {
		lines = plines
	}

	size {
		return "width: %(_width) height: %(height)"
	}

	grid {
		var grid = List.filled(_height, [])
		for (i in 0.._height-1) {
			grid[i] = List.filled(_width, 0)
		}
		return grid
	}

	overlap {
		var grid = List.filled(_height, [])
		for (i in 0.._height-1) {
			grid[i] = List.filled(_width, 0)
		}
		var acc = 0
		for (line in _lines) {
			for (point in line.pointsDiagonal) {
				var x = point.x
				var y = point.y
				grid[y][x] = grid[y][x] + 1
				if (grid[y][x] == 2) {
					acc = acc + 1
				}
			}
		}

// 		var string = ""
// 		for (y in grid) {
// 			for (x in y) {
// 				string = "%(string)%(x == 0 ? "." : x)"
// 			}
// 			string = "%(string)\n"
// 		}

// 		System.print(string)
		
		return acc
	}

	toString {
		var string = "width: %(_width) height: %(height)"
		for (line in _lines) {
			string = "%(string)\n%(line)"
		}
		return string
	}
}