function init() {
    var i = 0; // name is a local variable created by init
    function count() {
      i++;
    }

    function show(){
        console.log(i);
    }
    return {
        count,
        show
    }
  }
let var1 = init();
var1.count();
var1.show();

function makeConstAdder(x){
    return addX = (y) => {
        return x + y;
    }
}

const add5 = makeConstAdder(5);
const add10 = makeConstAdder(10);
console.log( add5(1) );
console.log( add10(1) );


function outer() {
    const x = 5;
    if (Math.random() > 0.5) {
      const y = 6;
      return () => console.log(x, y);
    }
  }
  
outer()(); // logs 5 6
  
