import AppSettings from './settings';
import AudioManager from './audio';

const exercises = [
  {name: 'intro',            duration: -1},
  {name: 'relax-exercise',   duration: 25},
  {name: 'up-down-exercise', duration: 25}
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
    AudioManager.play();

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
