require('./background.tag');
require('./wrapper.tag');
require('./exercise.tag');

import Core from '../libs/core';
<app>
  <background></background>
  <wrapper>
    <exercise observable={parent.core}></exercise>
  </wrapper>
  <script>
    this.core   = Core; // pass Core object to exercise options
    const $body = $('body');

    this.on('mount', () => {
      $body.fadeIn(2000);
      // Bottle neck. Core should start after body is visible and everything is mounted
      setTimeout(() => {
        Core.start();
      }, 2100);
    });

    this.on('unmount', () => {
      // Make body hidden again
      $body.hide();
    });
  </script>
</app>
