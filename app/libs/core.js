const exercises = [
  {name: 'intro',          duration: -1},
  {name: 'relax-exercies', duration: 20}
]

class Core {
  constructor() {
    riot.observable(this);
  }

  start() {
    this.reset();
    executeStep.call(this);
  }

  next() {
    if (this.step < exercises.length - 1) {
      this.step++;
      executeStep.call(this);
    }
  }

  reset() {
    this.step = 0;
  }

}

function executeStep() {
  const exercise = exercises[this.step];
  this.trigger('render', exercise);
}


export default new Core();
