import "io" for File
import "./board" for Board

var input = File.read("./input.txt")
.trim()
var numbers = input.split("\n")[0]
var boardsInput = input[numbers.count..-1].trim().split("\n").where{|line| line != ""}.toList
numbers = numbers.split(",")


System.print(numbers)

var count = (boardsInput.count/5) - 1
var boards = []

for(i in 0..count) {
	var initial = i * 5
	var final = ((i + 1) * 5) - 1
	var boardNumbers = boardsInput[initial..final]	
	boards.add(Board.new(boardNumbers))
}


var solved = 0

for (num in numbers) {
	for (board in boards) {
		board.hit(num)
		if (!board.solved) {
			if (board.won) {
				solved = solved + 1
				if (solved == boards.count) {
					System.print(board)
					System.print("WON=%(board.score)")
					return null
				}
			}
		}
	}
}