import "io" for File
import "./world" for World

var grid = File.read("./input.txt")
.trim()
.split("\n").map{|line| line.map{|num| Num.fromString(num)}.toList}.toList

var lowPoints = []

var acc = 0
var world = World.new(grid)
System.print(world)
System.print("------")

var bacines = world.bacines
System.print("------")
System.print(bacines)

var result = bacines[0] * bacines[1] * bacines[2]
System.print("Result: %(result)") 