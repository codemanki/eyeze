// Simplify this
require('./exercises/intro.tag');
require('./exercises/relax-exercise.tag');
require('./exercises/up-down-exercise.tag');
require('./exercises/clip-eyes-exercise.tag');
require('./exercises/left-right-exercise.tag');
require('./exercises/diagonal-exercise.tag');
require('./exercises/clockwise-exercise.tag');
require('./exercises/spirally-exercise.tag');
require('./exercises/distance-exercise.tag');
require('./exercises/relax-final-exercise.tag');
require('./exercises/outro.tag');


<exercise>
  <style>
    .exercise_wrapper {
      max-width: 600px;
      padding: 0 32px;
      margin: 0 auto;
      color: #fff;
      font-size: 16px;
      text-align: left;
      font-family: 'PT Sans', sans-serif;
    }

    .exercise_wrapper .title {
      font-size: 34px;
      color: #fff;
      max-width: 400px;
      margin: 0 auto;
      line-height: 30px;
      text-align: center;
    }

    .exercise_wrapper .text {
      color: #fff;
      font-size: 18px;
      text-align: center;
      max-width: 400px;
      margin: 0 auto;
    }

    .exercise_wrapper .timer {
      text-align: center;
      margin: 0 auto;
      font-size: 80px;
      color: #fff;
      position: relative;
      font-weight: bold;
      padding-top: 80px;
      padding-bottom: 90px;
    }

    .exercise_wrapper .dot {
      position: absolute;
      top: 20px;
      right: 20px;
      left: 20px;
      bottom: 20px;
    }

    .exercise_wrapper .dot:before {
      content: '';
      position: absolute;
      width: 30px;
      height: 30px;
      border-radius: 50%;
      background: #fff;
    }
  </style>
  <div class="exercise_wrapper"></div>
  <script>
    let exerciseTag;
    function onRender(exercise) {
      exerciseTag = riot.mount('.exercise_wrapper', exercise.name, {
        exercise, next: opts.observable.next.bind(opts.observable)
      })[0];
    }

    this.on('mount', function() {
      opts.observable.on('render', onRender.bind(this));
    });

    this.on('unmount', () => {
      exerciseTag.trigger('unmount'); // Send unmount signal to dynamic exercise
      opts.observable.off('*');
    });
  </script>
</exercise>
