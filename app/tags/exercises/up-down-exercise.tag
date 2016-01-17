require('../timer.tag');

<up-down-exercise>
  <style scoped>
    :scope .dot:before {
      top: 0;
      left: 50%;
      margin-top: -15px;
      margin-left: -15px;

      -webkit-animation-name: animation2;

      -webkit-animation-duration: 4s;

      -webkit-animation-iteration-count: infinite;
    }

    @-webkit-keyframes animation2 {
      0% {
        opacity: .1;
        left: 50%;
        top: 50%;
      }
      20% {
        opacity: 1;
        top: 3%;
      }
      25% {
        opacity: 1;
        top: 3%;
      }
      45% {
        opacity: .1;
        top: 50%;
      }
      50% {
        opacity: .1;
        top: 50%;
      }
      70% {
        opacity: 1;
        top: 99%;
      }
      75% {
        opacity: 1;
        top: 99%;
      }
      95% {
        opacity: .1;
        top: 50%;
      }
      100% {
        opacity: .1;
        top: 50%;
      }
    }
  </style>

  <div class="dot"></div>
  <div class="title">
    <span>Up-down</span>
    <timer duration={opts.exercise.duration} onFinish={opts.next} />
  </div>
  <div class="text">
    For a second old your eyes in the upper and low points
  </div>
</up-down-exercise>
