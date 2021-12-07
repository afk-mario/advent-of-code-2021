class Board {
	solved { _solved }

	construct new(grid) {
		_height = grid.count
		_width = 5
		_map = {}
		_hits = List.filled(_height, [])
		_board = List.filled(_height, [])
		_lastHit = -1
		_solved = false

		for (i in 0.._height - 1) {
			_hits[i] = List.filled(_width, false)
		}

		for (y in 0..grid.count - 1) {
			var row = grid[y]
			_board[y] = row.split(" ").where{|item| item != ""}.toList
			_width = _board[y].count
		}

		for (y in 0.._height - 1) {
			var row = _board[y]
			for (x in 0.._width - 1 ) {
				var num = row[x]
				_map[num] = [x,y]
			}
		}
	}

	hit(num) {
		var coords = _map[num]
		if (coords) {
// 			System.print("%(num) at %(coords)")
			_hits[coords[1]][coords[0]] = true
			_lastHit = num
		}

	}

	score {
		var sum = 0

		for (y in 0.._height - 1) {
			for (x in 0.._width - 1) {
				if (!_hits[y][x]) {
					var num = _board[y][x]
					sum = sum + Num.fromString(num)
				}
			}
		}

		System.print("Sum=%(sum) last=%(_lastHit)")
		return sum * Num.fromString(_lastHit)
	}

	won {
		for (row in _hits) {
			var rowScore = row.reduce(0, Fn.new{|acc, curr| curr ? acc + 1 : acc})
			if (rowScore >= _width) {
				_solved = true
				return true
			}
		}
			
		var columnScore = List.filled(_width, 0)

		for (y in 0.._height - 1) {
			for (x in 0.._width - 1) {
				var rowScore = 0
				if (_hits[y][x]) {
					rowScore = rowScore + 1
					columnScore[x] = columnScore[x] + 1
				}
				if (rowScore >= _width) {
					_solved = true
					return true
				}
			}
		}

		for (score in columnScore) {
			if (score >= _height) {
				_solved = true
				return true
			}
		}

		return false
	}

	toString {
		var string = "width=%(_width) height=%(_height)\n"

		for (y in 0.._height - 1) {
			var row = _board[y]
			for (x in 0.._width - 1 ) {
				var num = row[x]
				if (_hits[y][x]) {
					string = "%(string) *"
				}else {
					string = "%(string) -"
				}
				string = "%(string) %(num.toString)"
			}
			string = "%(string)\n"
		}

		return string
	}
}