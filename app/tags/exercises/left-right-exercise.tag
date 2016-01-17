require('../timer.tag');

<left-right-exercise>
  <style scoped>
    :scope .dot:before {
      top: 50%;
      left: 0;
      margin-top: -15px;
      margin-left: -15px;

      -webkit-animation-name: animation3;

      -webkit-animation-duration: 4s;

      -webkit-animation-iteration-count: infinite;
    }

    @-webkit-keyframes animation3 {
      0% {
        opacity: .1;
        left: 50%;
        top: 50%;
      }
      20% {
        opacity: 1;
        left: 0;
      }
      25% {
        opacity: 1;
        left: 0;
      }
      45% {
        opacity: .1;
        left: 50%;
      }
      50% {
        opacity: .1;
        left: 50%;
      }
      70% {
        opacity: 1;
        left: 100%;
      }
      75% {
        opacity: 1;
        left: 100%;
      }
      95% {
        opacity: .1;
        left: 50%;
      }
      100% {
        opacity: .1;
        left: 50%;
      }
    }
  </style>

  <div class="dot"></div>
  <div class="title">
    <span>Left-Right</span>
    <timer duration={opts.exercise.duration} onFinish={opts.next} />
  </div>
  <div class="text">
    Move your eyes as much as possible left and right, but by doing this you should not feel any discomfort
  </div>
</left-right-exercise>
