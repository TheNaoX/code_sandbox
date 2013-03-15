//Callbacks

var now = function(fn, variable){
  console.log('1');
  return fn(variable);
}

//Another callback example

setTimeout(function(){
  now(function(string){ console.log(string) }, "whatever");
  console.log('this has being executed later');
},1000);

//contexts

var a = {
  name: 'antonio'
}

var cualquiera = function(lastname, phone){
  console.log(this.name);
  console.log(lastname);
  console.log(phone);
  console.log(arguments);
}

cualquiera.call(a,'chavez', '3121125642');

// Closures

(function(a,b,c){
  console.log(this, a,b,c);
  return function(d){
    console.log(d)
  }
}).call({}, 1,2,3)('Tamarindo');
