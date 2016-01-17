require('../timer.tag');

<spirally-exercise>
  <style scoped>
    :scope .dot:before {
      top: 10px;
      left: 50%;
      opacity: 0;

      -webkit-animation-name: animation6Before;

      -webkit-animation-duration: 6s;
      -webkit-animation-iteration-count: infinite;
      -webkit-animation-timing-function: linear;
    }

    :scope .dot {
      -webkit-animation-name: animation6;

      -webkit-animation-duration: 5s;
      -webkit-animation-iteration-count: infinite;
      -webkit-animation-timing-function: linear;
    }

    @-webkit-keyframes animation6 {
      0% {
        -webkit-transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(-1080deg);
      }
    }

    @-webkit-keyframes animation6Before {
      0% {
        top: 10px;
        left: 50%;
        opacity: 1;
      }
      100% {
        top: 50%;
        left: 50%;
        opacity: 0;
      }
    }
  </style>

  <div class="dot"></div>
  <div class="title">
    <span>Spirally</span>
    <timer duration={opts.exercise.duration} onFinish={opts.next} />
  </div>
  <div class="text">
    Try to do no less than 4 turns
  </div>
</spirally-exercise>
