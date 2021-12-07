class Vector {
  x {_x}
  y {_y}

  construct new (x,y) {
    _x = x
    _y = y
  }

  + (other){
    return Vector.new(_x + other.x, _y + other.y)
  }

  angle { 
    return (y/x).atan * 180 / Num.pi
  }

  toString {
    return "[%(_x),%(_y)]"
  }
}