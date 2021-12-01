class Second {
  construct new (input) {
    _input = input.toList
  }

  getValue (index) {
    if (index < _input.count ){
      return _input[index]
    }else {
      return 0
    }
  }

  solve () {
    var result = 0
      var count = _input.count

      for (i in 0..count){
        var a = getValue( i) +
          getValue( i + 1) +
          getValue( i + 2)

          var b = getValue( i + 1) +
          getValue( i + 2) +
          getValue( i + 3)

          if (b > a) {
            result = result + 1
          }
      }

    return result
  }
}
