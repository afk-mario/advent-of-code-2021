import "io" for File
import "./line" for Line
import "./grid-map" for GridMap

var lines = File.read("./input.txt")
.trim()
.split("\n")
.map{|item| item.replace(" -> ", ",").split(",")
.map{|num| Num.fromString(num)}.toList}
.map{|arr| Line.new(arr[0], arr[1], arr[2], arr[3])}



var grid = GridMap.new(lines)


System.print(grid.size)
System.print("Result = %(grid.overlap)")