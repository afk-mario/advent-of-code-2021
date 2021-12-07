import "./vector" for Vector

class Line {
  a {_a}
  b {_b}

  construct new (a,b) {
    _a = a
    _b = b
  }

  construct new (x1,y1,x2,y2) {
    _a = Vector.new(x1,y1)
    _b = Vector.new(x2,y2)
  }

  points {
    var arr = []

    if (a.x == b.x) {
      var x = a.x
      for (y in _a.y.._b.y) {
        arr.add(Vector.new(x, y))
      }
    }

    if (a.y == b.y) {
      var y = a.y
      for (x in _a.x.._b.x) {
        arr.add(Vector.new(x, y))
      }
    }
    return arr
  }

  pointsDiagonal {
    var vector = _a + _b
    var angle = vector.angle
    var xDelta = _b.x - _a.x
    var yDelta = _b.y - _a.y
    System.print("%(_a) -> %(_b): %(xDelta.abs)")

    if (xDelta.abs == yDelta.abs) {
      var arr = []
      System.print("Delta=[%(xDelta), %(yDelta)]")
      for (i in 0..xDelta.abs) {
        var x = _a.x + (i * xDelta.sign)
        var y = _a.y + (i * yDelta.sign)
        arr.add(Vector.new(x, y))
      }
    
      return arr
    }

    return points
  }

  toString {
    return "[%(_a.x),%(_a.y)]->[%(_b.x),%(_b.y)]"
  }
}

