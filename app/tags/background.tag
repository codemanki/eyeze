<background>
  <style scoped>
    :scope {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
    }
  </style>
  <script>
    const GRADIENTS = [
      {start: [69, 126, 128], stop: [145, 203, 205]},
      {start: [53, 76, 116], stop: [82, 123, 156]},
      {start: [201, 91, 119], stop: [137, 93, 160]},
      {start: [138, 219, 176], stop: [157, 197, 120]},
      {start: [233, 126, 130], stop: [242, 166, 109]},
      {start: [146, 122, 155], stop: [193, 96, 161]},
      {start: [172, 26, 1], stop: [152, 93, 131]}
    ];
    const TRANSITION_TIME = 20;
    const FPS = 60;
    let currentAnimationStep = 0;
    const ANIMATION_STEPS = Math.round(TRANSITION_TIME * FPS); // total amount of steps
    let rgbSteps = {
        start: [0, 0, 0],
        stop: [0, 0, 0]
    }; // how much to alter each rgb value

    let rgbValues = {
        start: [0, 0, 0],
        stop: [0, 0, 0]
    }; // the current rgb values, gets altered by rgb steps on each interval

    let gradientIndex = 0; // where we are in the gradients array
    let nextGradientIndex = 1; // what index of the gradients array is next
    let colors = [];

    function getNextGradientIndex(index) {
      return (index + 1 < GRADIENTS.length) ? index + 1 : 0;
    }

    function animationStepSize(a, b) {
      return (a - b) / ANIMATION_STEPS;
    }

    function performAnimationStep() {
      Object.keys(rgbValues).forEach((key) => {
        for (var i = 0; i < 3; i++) {
          rgbValues[key][i] = GRADIENTS[gradientIndex][key][i];
          rgbSteps[key][i] = animationStepSize(GRADIENTS[nextGradientIndex][key][i], rgbValues[key][i]);
        }
      });

    }

    function updateGradient(styleAttr) {
      // Make a step
      Object.keys(rgbValues).forEach((key) => {
        for (var i = 0; i < 3; i++) {
          rgbValues[key][i] += rgbSteps[key][i];
        }
      });

      const color1 = `rgb(${rgbValues.start[0] | 0}, ${rgbValues.start[1] | 0}, ${rgbValues.start[2] | 0})`;
      const color2 = `rgb(${rgbValues.stop[0] | 0}, ${rgbValues.stop[1] | 0}, ${rgbValues.stop[2] | 0})`;

      if (colors[0] !== color1 || colors[1] !== color2) {
        styleAttr.backgroundImage = `-webkit-gradient(linear, left bottom, right top, from(${color1}), to(${color2}))`;
        colors = [color1, color2];
      }

      if (++currentAnimationStep > ANIMATION_STEPS) {
        currentAnimationStep = 0;
        gradientIndex = getNextGradientIndex(gradientIndex);
        nextGradientIndex = getNextGradientIndex(nextGradientIndex);
        performAnimationStep();
      }
    }

    this.on('mount', () => {
      performAnimationStep();
      setInterval(updateGradient.bind(this, this.root.style), Math.round(1000 / FPS));
    });
  </script>
</background>
