require('../timer.tag');

<clockwise-exercise>
  <style scoped>
    :scope .dot:before {
      top: 50%;
    }

    :scope .dot {
      -webkit-animation-name: animation5;

      -webkit-animation-duration: 4s;
      -webkit-animation-iteration-count: infinite;
      -webkit-animation-timing-function: linear;
    }

    @-webkit-keyframes animation5 {
      0% {
        -webkit-transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
      }
    }
  </style>

  <div class="dot"></div>
  <div class="title">
    <span>Clockwise direction</span>
    <timer duration={opts.exercise.duration} onFinish={opts.next} />
  </div>
  <div class="text">
    Do not hurry, do it smoothly
  </div>
</clockwise-exercise>
