<timer>
  <div class="timer">{opts.duration}</div>
  <script>
    let duration = opts.duration + 1;
    let $timer;

    function tick() {
      duration--;
      if (duration < 0) {
        opts.onfinish();
      } else {
        $timer.text(duration);
        setTimeout(tick, 1000);
      }
    }

    this.on('mount', () => {
      $timer = $('.timer');
      tick();
    })
  </script>
</timer>
