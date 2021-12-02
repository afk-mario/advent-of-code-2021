import "./vector" for Vector

class Submarine {
  construct new() {
    _position = Vector.new(0,0)
    _aim = 0
  }

  position { _position }

  forward(n){
    _position = _position + Vector.new(n, n * _aim)
  }

  down(n){
    _aim = _aim + n
  }

  up(n){
    _aim = _aim - n
  }

  toString {
    return "---------\nSubmarine\n---------\nposition %(_position.toString)\naim %(_aim)"
  }
}