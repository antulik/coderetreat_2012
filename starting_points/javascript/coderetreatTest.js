//test('is foo "bar" ?', function() {
//    equals(foo(), "bar");
//})

test('rule 1', function(){
  var world = {
    '0,1':true,
    '0,0':true
  }

  var keys = Object.keys( tick(world));

  equal(keys.length, 0, 'Cell 2 neighbor cells died');
});

test('rule 2 - 3 friends', function(){
  var world = {
    '0,0':true,
    '0,1':true,
    '1,0':true,
    '1,1':true
  }

  var new_world = tick(world);
  var keys = Object.keys(new_world);

  equal(keys.length, 4, '4 cells live');
  deepEqual(new_world, world, "World haven't changed")
});

test('rule 2 - 2 friends', function(){
  var world = {
    '0,0':true,
    '1,0':true,
    '1,1':true
  }

  var new_world = tick(world);

  ok(new_world['1,0'], "Cell with two neighbours lives");
});

test('rule 4 - Blinker (period 2)', function(){
  var world = {
    '1,0':true,
    '1,1':true,
    '1,2':true
  }

  var new_world = tick(world);
  var keys = Object.keys(new_world);

  equal(keys.length, 3, '3 cells live');
  deepEqual(new_world, {
    '0,1':true, '1,1':true, '2,1':true
  }, "Blinker (period 2)")
});


