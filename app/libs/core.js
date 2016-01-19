import AppSettings from './settings';
import AudioManager from './audio';

const exercises = [
  {name: 'intro',                duration: -1},
  {name: 'relax-exercise',       duration: 20},
  {name: 'up-down-exercise',     duration: 20},
  {name: 'clip-eyes-exercise',   duration: 10},
  {name: 'left-right-exercise',  duration: 20},
  {name: 'diagonal-exercise',    duration: 20},
  {name: 'clip-eyes-exercise',   duration: 10},
  {name: 'clockwise-exercise',   duration: 20},
  {name: 'spirally-exercise',    duration: 20},
  {name: 'clip-eyes-exercise',   duration: 10},
  {name: 'distance-exercise',    duration: 25},
  {name: 'relax-final-exercise', duration: 15},
  {name: 'outro',                duration: 10}
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
    } else {
      //finished!
    }
  }

  reset() {
    this.step = AppSettings.getItem('showIntro') ? 0 : 1;
  }

}

function executeStep() {
  const exercise = exercises[this.step];
  this.trigger('render', exercise);
}


export default new Core();
