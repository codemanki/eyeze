require('../timer.tag');

<diagonal-exercise>
  <style scoped>
    :scope .dot:before {
      top: 100%;
      left: 0;
      margin-top: -15px;
      margin-left: -15px;

      -webkit-animation-name: animation4;

      -webkit-animation-duration: 5s;

      -webkit-animation-iteration-count: infinite;
    }

    @-webkit-keyframes animation4 {
      0% {
        top: 100%;
        left: 0;
        opacity: 1;
      }
      25% {
        top: 0;
        left: 0;
        opacity: 1;
      }
      37.5% {
        opacity: .1;
      }
      50% {
        top: 100%;
        left: 100%;
        opacity: 1;
      }
      75% {
        top: 0;
        left: 100%;
        opacity: 1;
      }
      87.5% {
        opacity: .1;
      }
      100% {
        top: 100%;
        left: 0;
        opacity: 1;
      }
    }
  </style>

  <div class="dot"></div>
  <div class="title">
    <span>Along the diagonal</span>
    <timer duration={opts.exercise.duration} onFinish={opts.next} />
  </div>
  <div class="text">
    Look at the corners, as the dot shows you
  </div>
</diagonal-exercise>
