<wrapper>
    <div class="container">
      <yield/>
    </div>

    <style scoped>
      :scope .container{
        position: relative;
        height: 100%;
        padding-top: 170px;
        -webkit-box-sizing: border-box;
        -webkit-transition-property: padding-top;
        -webkit-transition-duration: 1s;
      }
    </style>
  <script>
    function listeners(onOrOff) {
      if (onOrOff) {
        handleWindowResize.call(this);
        $(window).on('resize', handleWindowResize.bind(this));
      } else {
        $(window).off('resize'); // Just remove all listeners
      }
    }

    function handleWindowResize() {
      const padding = Math.max(window.innerHeight / 2 - 200, 0);

      $(this.root.children[0]).css({
        'padding-top': padding
      });
    }

    this.on('mount', listeners.bind(this, true));
    this.on('unmount', listeners.bind(this, false));
  </script>
</wrapper>
