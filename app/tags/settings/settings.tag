<settings>
  <div class="settingsContainer">
    <div class="header">Settings</div>
  </div>
  <style scoped>
    :scope .settingsContainer {
      position: absolute;
      height: 100%;
      width: 100%;
      background: -webkit-linear-gradient(to left, #517fa4 , #243949); /* Chrome 10-25, Safari 5.1-6 */
      background: linear-gradient(to left, #517fa4 , #243949); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
      color: #fff;
      font-size: 16px;
      text-align: left;
      font-family: 'PT Sans', sans-serif;
    }

    :scope .settingsContainer .header {
      font-size: 34px;
      color: #fff;
      max-width: 400px;
      margin: 0 auto;
      line-height: 30px;
      text-align: center;
      margin-top: 30px;
    }
  </style>
  <script>
    this.on('mount', () => {
      $('body').fadeIn(500);
    });
  </script>
</settings>
