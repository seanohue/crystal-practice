function calc(expr) {
  const tokenized: string[] = expr.split(' ');
  const initValue: number = 0;
  const operands = {
    '*': (x: number, y: number) => x * y,
    '/': (d: number, n: number) => n / d,
    '+': (x: number, y: number) => x + y,
    '-': (x: number, y: number) => y - x,
  };

  let stack: number[] = [];

  return tokenized.reduce((previous, current, index, list) => {
    const endOfExpr: boolean = !list[index + 1];

    if (current in operands) {
      let x: number = +stack.pop(),
          y: number = +stack.pop();
      let result: number = operands[current](x, y);
      stack.push(result);
      return result;
    }

    stack.push(+current);
    return endOfExpr ? stack[index] || previous : previous;
  }, initValue);
}

console.log(calc('5 1 2 + 4 * + 3 -')); // 14
