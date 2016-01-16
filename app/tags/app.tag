require('./background.tag');
require('./wrapper.tag');
require('./exercise.tag');

import Core from '../libs/core';

<app>
  <background></background>
  <wrapper>
    <exercise observable={parent.observable}></exercise>
  </wrapper>
  <script>
    this.observable = riot.observable();
    const bindedRender = this.observable.trigger.bind(this.observable, 'render');
    const bindedNext = Core.trigger.bind(Core, 'next');

    toggleObserved(onOrOff) {
      const method = onOrOff ? 'on' : 'off';
      Core[method]('render', bindedRender);
      this.observable[method]('next', bindedNext);
    }

    this.on('mount', () => {
      this.toggleObserved(true);
      Core.start();
      $('body').fadeIn(2000);
    });

    this.on('unmount', this.toggleObserved.bind(this, false));
  </script>
</app>
