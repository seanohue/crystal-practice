function calc(expr) {
    var tokenized = expr.split(' ');
    var initValue = 0;
    var operands = {
        '*': function (x, y) { return x * y; },
        '/': function (d, n) { return n / d; },
        '+': function (x, y) { return x + y; },
        '-': function (x, y) { return y - x; }
    };
    var stack = [];
    return tokenized.reduce(function (previous, current, index, list) {
        var endOfExpr = !list[index + 1];
        if (current in operands) {
            var x = +stack.pop(), y = +stack.pop();
            var result = operands[current](x, y);
            stack.push(result);
            return result;
        }
        stack.push(+current);
        return endOfExpr ? stack[index] || previous : previous;
    }, initValue);
}
console.log(calc('5 1 2 + 4 * + 3 -')); // 14
