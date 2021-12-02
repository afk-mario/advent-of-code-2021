class First {
  construct new (input){
    _input = input
  }

  solve() {
    var last = 0
    var result = 0

    for (i in _input) {
      if (i > last && last > 0 ) {
        result = result + 1
      }
      last = i
    }
    return result
  }
}