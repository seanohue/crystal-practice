class Dice {
    constructor(public sides: number) { }
    roll(amount: number) {
        return Math.round(Math.random() * this.sides) * amount;
    }
};

var d20 = new Dice(20);
var d6 = new Dice(6);

console.log("Rolling 2d20... ", d20.roll(2));
console.log("Rolling 3d6... ", d6.roll(3));
