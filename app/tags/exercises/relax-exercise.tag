<relax-exercise>
  <style scoped>
    :scope .dot:before {
      top: 86%;
      left: 50%;
      margin-left: -15px;
      opacity: 0.5;
      -webkit-animation-name: animation;

      -webkit-animation-duration: 1.5s;

      -webkit-animation-iteration-count: infinite;
    }

    @-webkit-keyframes animation {
      0% {
        -webkit-transform: scale(1);
        opacity: 0.5;
      }

      20% {
        -webkit-transform: scale(1.5);
        opacity: 1;
      }

      100% {
        -webkit-transform: scale(1);
        opacity: 0.5;
      }
    }
  </style>
  <div class="dot"></div>
  <div class="title">
    <span>Relax</span>
    <div class="timer">100186</div>
  </div>
  <div class="text">
    Close your eyes until you hear a signal
  </div>
</relax-exercise>
