<timer>
  <div class="timer">{opts.duration}</div>
  <script>
    let duration = opts.duration + 1;
    let $timer;
    let timerId;

    function tick() {
      duration--;
      if (duration < 0) {
        opts.onfinish();
      } else {
        $timer.text(duration);
        timerId = setTimeout(tick, 1000);
      }
    }

    this.on('mount', () => {
      $timer = $('.timer');
      tick();
    });

    this.on('unmount', () => {
      if (timerId) {
        clearTimeout(timerId);
      }
    });
  </script>
</timer>
