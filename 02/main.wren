import "io" for File
import "./first" for First
import "./second" for Second

var input = File.read("./input.txt").trim().split("\n").map{ |item| item.split(" ") }

var first = First.new(input).solve
System.print("First %(first) = %(first.x * first.y)")

var second = Second.new(input).solve
System.print("Second %(second) = %(second.x * second.y)")
