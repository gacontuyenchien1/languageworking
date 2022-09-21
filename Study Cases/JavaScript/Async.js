//#region Callback
function displayResult( a, b, cal){
    let rs = cal( a, b);
    console.log( rs );
}

function multiple( a, b){
    return a * b;
}

function addition( a, b){
    return a + b;
}

displayResult( 3, 4, multiple);
displayResult( 3, 4, addition);
//#endregion Callback

//#region Promise
console.log("=====================");
console.log("**Promise Function**\n");

function runner(){
    return new Promise( function(resolve, reject){
        console.log("let promise");
        resolve("resolve 0");
    });
}

console.log("Promise start!\n");

runner().then(
    ( mess ) => {
        console.log("===============");
        console.log("**Promise.then() 1**");
        console.log( mess );
        return new Promise( function(resolve, reject){
            console.log("promise.then() 1 new Promise()");
            resolve("resolve 1");
        }).then(
            ( mess ) => {
                console.log("promise.then() 2");
                console.log( mess );
            },
            ( mess ) => {
                console.log( mess );
            }
        );
    },
    ( mess ) => {
        console.log( mess );
    }
);
//#endregion Promise

//#region Async
console.log("=====================");
console.log("**Async Function**\n");
let asyncF = async function(){
    console.log("let asyncF");
    return "Async resolve0";
};

console.log("Before async");

asyncF().then(
    ( mess ) => {
        console.log("===============");
        console.log("**Async then() 1**");
        console.log( mess );
        return async function(){
            console.log("Async then() 1 return async");
            return "Async resolve1";
        };
    }
).then(
    ( mess ) => {
        console.log("Async then() 2 return async");
        console.log("Async then() 2 return async, ", mess() );
    }
);
//#endregion Async
