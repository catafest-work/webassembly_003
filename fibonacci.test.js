const fs = require('fs');
let fibonacci;

beforeAll(async() => {
  const wasm = fs.readFileSync('./fibonacci.wasm');
  const buffer = new Uint8Array(wasm);
  fibonacci = await WebAssembly.instantiate(buffer)
  .then(res => res.instance.exports);
});

//const fibonacci = require('./fibonacci.js');

test('fibonacci 0 ', () => expect(fibonacci.fibonacci(0)).toBe(0));
test('fibonacci 1 ', () => expect(fibonacci.fibonacci(1)).toBe(1));
test('fibonacci 2 ', () => expect(fibonacci.fibonacci(2)).toBe(1));
test('fibonacci 3 ', () => expect(fibonacci.fibonacci(3)).toBe(2));
test('fibonacci 4 ', () => expect(fibonacci.fibonacci(4)).toBe(3));
test('fibonacci 5 ', () => expect(fibonacci.fibonacci(5)).toBe(5));
test('fibonacci 5 ', () => expect(fibonacci.fibonacci(6)).toBe(8));
test('fibonacci 17 ', () => expect(fibonacci.fibonacci(17)).toBe(1597));
//test('fibonacci 37 ', () => expect(fibonacci.fibonacci(37)).toBe(24157817));
//test('fibonacci __ ', () => expect(fibonacci.fibonacci(__)).toBe(__));