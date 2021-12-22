
class World {
	grid { _grid }
	lowPoints { _lowPoints }
	vecinos { [[0,-1], [1, 0], [0, 1], [-1, 0]] }

	construct new(grid) {
		_grid = grid
		lowPoints = grid
	}

	insideGrid(x, y) {
		if (y < 0 || x < 0) {
			return false
		}

		if (y > _grid.count - 1 ) {
			return false
		}

		var row = _grid[y]

		if (x > row.count - 1) {
			return false
		}

		return true
	}

	lowPoints = (value) {
		_lowPoints = []
		for(y in 0.._grid.count -1) {
			var row = _grid[y]
			for (x in 0..row.count-1) {
				var isLower = true
				var num = row[x]
				for (coords in vecinos) {
					var nx = x + coords[0]
					var ny = y + coords[1]
					var inside = insideGrid(nx,ny)

					if (inside) {
						var vecino = _grid[ny][nx]
						if (vecino <= num) {
							isLower = false
						}
					}
				}

				if (isLower) {
					_lowPoints.add([x, y, num])
				}
			}
		}
	}

	bacines {
		var sizes = []
		for (point in lowPoints) {

			var x = point[0]
			var y = point[1]
			var size = getBacineSize(x, y, {})
			sizes.add(size)
			System.print("[x=%(point[0]), y=%(point[1]), value=%(point[2])] Size= %(size)")
		}
		sizes = sizes.sort{|a, b| a > b}
		return sizes
	}

	getBacineSize (x, y, set) {
		var n = []

		for (vecino in vecinos) {
			var nx = x + vecino[0]
			var ny = y + vecino[1]
			var id = "%(nx)-%(ny)"
			var inside = insideGrid(nx, ny)
			var contains = set.containsKey(id)
			if (inside && !contains) {
				var value = _grid[ny][nx]
				if (value < 9) {
					System.print("Found at x=%(nx), y=%(ny) = %(value)")
					n.add([nx, ny, value])
					set[id] = value
				}
			}
		}

		var size = 0
		for (vecino in n) {
			var nx = vecino[0]
			var ny = vecino[1]

			size = size + getBacineSize(nx, ny, set)
		}

		return size + n.count

	}

	toString {
		var string = ""

		for (y in 0.._grid.count - 1) {
			var row = _grid[y]
			for (x in 0..row.count - 1 ) {
				var num = row[x]
				string = "%(string) %(num.toString)"
			}
			string = "%(string)\n"
		}
		
		string = "%(string) \n\n Low points:"

		for (point in _lowPoints) {
			string = "%(string)\n[x=%(point[0]), y=%(point[1]), value=%(point[2])]"
		}


		return string 
	}
}