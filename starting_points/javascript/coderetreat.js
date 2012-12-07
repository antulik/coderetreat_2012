function foo() {
  return "qix";
}


function tick(world) {

  var new_world = {};


  for (var cell in world) {

    var count = countAround(world, cell);

    if (count == 2 || count == 3) {
      new_world[cell] = true
    }

    var around = cellsAround(cell);
    for (var i = 0; i < around.length; i++){
      var _cell = around[i];

      if (world[_cell] != true){
        var _count = countAround(world, _cell);
        if (_count == 3){
          new_world[_cell] = true
        }
      }
    }
  }

  return new_world;
}

function countAround(world, cell) {
  var cells = cellsAround(cell);

  var count = 0;
  for (var i = 0; i < cells.length; i++){
    if (world[cells[i]] == true) {
      count++;
    }
  }
  return count;
}

function cellsAround(cell) {
  cell = cell.split(',')
  var x = parseInt(cell[0]);
  var y = parseInt(cell[1]);

  var cells = [];
  for (var _x = x - 1; _x <= x + 1; _x++) {

    for (var _y = y - 1; _y <= y + 1; _y++) {
      var key = _x + "," + _y;

      if (key != cell) {
        cells.push(key);
      }
    }
  }

  return cells;
}