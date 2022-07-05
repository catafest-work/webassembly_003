module.exports = function fibonacci(index) {
  let fibn = 0;
  let finn1 = 1;
  let fibn2 = 0;
  let n = index;
  
  while(n > 0) {
    fibn2 = fibn1;
    fibn1 = fibn;
    fibn = fibn1 + fibn2;
    n--;
  }

  return 0;
}