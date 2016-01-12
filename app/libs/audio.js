const SOUNDS = [
  'audio1'
].map((sound) => {
  return {sound, resource: new Audio(`resources/audio/${sound}.wav`)}
});

class AudioManager {
  constructor() {
    this.currentSound = SOUNDS[0].resource;
    riot.observable(this);
    this.listenToEvents();
  }

  _play() {
    this.currentSound.play();
  }

  listenToEvents() {
    this.on('play', this._play.bind(this));
  }
}


export default new AudioManager();
