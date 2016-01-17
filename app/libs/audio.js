const SOUNDS = [
  'audio1'
].map((sound) => {
  return {sound, resource: new Audio(`assets/audio/${sound}.wav`)}
});

class AudioManager {
  constructor() {
    this.currentSound = SOUNDS[0].resource;
  }

  play() {
    this.currentSound.play();
  }

}

export default new AudioManager();
