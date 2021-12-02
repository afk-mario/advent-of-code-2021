import "io" for File
import "./submarine" for Submarine

class Second {
  construct new (input){
    _input = input
    _sub = Submarine.new()
  }

  solve {
    for (i in _input) {
      var instruction = i[0]
      var n = Num.fromString(i[1])
      if (instruction == "forward") {
        _sub.forward(n)
      }
      else if(instruction == "down") {
        _sub.down(n)
      }
      else if(instruction == "up") {
        _sub.up(n)
      }
    }
    return _sub.position
  }
}