require('../checkbox.tag');

<settings>
  <div class="settingsContainer">
    <div class="header">Settings</div>
    <table>
      <tr>
        <td>
          <div class="optionTitle">Take a break</div>
          <div class="optionDescription">every N minutes/never</div>
        </td>
        <td>
          <select name="breakInterval">
            <option value="0">never</option>
            <option value="15">15 min</option>
            <option value="30">30 min</option>
            <option value="45">45 min</option>
            <option value="60">1 hour</option>
            <option value="90">1.5 hours</option>
            <option value="120">2 hours</option>
            <option value="240">4 hours</option>
            <option value="360">6 hours</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>
          <div class="optionTitle">Launch at start</div>
          <div class="optionDescription">auto start with system</div>
        </td>
        <td>
          <checkbox name="autoStart"/>
        </td>
      </tr>
      <tr>
        <td>
          <div class="optionTitle">Disable gradient background</div>
          <div class="optionDescription">lowers cpu usage, turn on weak machines</div>
        </td>
        <td>
          <checkbox name="enableGradientBackground"/>
        </td>
      </tr>
      <tr>
        <td>
          <div class="optionTitle">Show intro slide</div>
          <div class="optionDescription">slide with instructions</div>
        </td>
        <td>
          <checkbox name="skipInto"/>
        </td>
      </tr>
    </table>
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

    :scope .optionTitle {
      font-size: 18px;
      font-weight: 400;
    }

    :scope .optionDescription {
      font-size: 14px;
    }

    :scope table {
      margin: 30px auto;
      border-collapse: separate;
      border-spacing: 10px;
      border: 0;
      width: 600px;
    }

  </style>
  <script>
    this.on('mount', () => {
      $('body').fadeIn(500);
    });
  </script>
</settings>
