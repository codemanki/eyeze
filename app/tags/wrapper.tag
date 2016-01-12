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
      const method = onOrOff ? 'on' : 'off';
      this._handleWindowResize = this._handleWindowResize || handleWindowResize.bind(this);

      $(window)[method]('resize', this._handleWindowResize);
      if (onOrOff) {
        this._handleWindowResize();
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
