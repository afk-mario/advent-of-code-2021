var DICT  = {
  "forward": [ 1,0 ],
  "down": [ 0,1 ],
  "up": [ 0,-1 ]
}


class Vector {
  x {_x}
  y {_y}

  construct new (x,y) {
    _x = x
    _y = y
  }

  construct instruction(instruction) {
    var direction = instruction[0]
    var ammount = Num.fromString(instruction[1])

    var entry = DICT[direction] ? DICT[direction] : 0
    _x = entry[0] * ammount
    _y = entry[1] * ammount
  }

  + (other){
    return Vector.new(_x + other.x, _y + other.y)
  }

  toString {
    return "[%(_x),%(_y)]"
  }
}

