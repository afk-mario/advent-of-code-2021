import "io" for File
import "./vector" for Vector

class First {
  construct new (input){
    _input = input
  }

  solve {
    var position = Vector.new(0, 0)
    for (i in _input) {
      var instruction = Vector.instruction(i)
      position = position + instruction
    }
    return position
  }
}