import "io" for File
import "./first" for First
import "./second" for Second

var input = File.read("./input.txt").trim().split("\n").map{|item| Num.fromString(item) }


var first = First.new(input)
System.print("Result first: %(first.solve())")

var second = Second.new(input)
System.print("Result second: %(second.solve())")