require('../button-link.tag');
require('../checkbox.tag');
import AppSettings from  '../../libs/settings';

<intro>
  <style scoped>
    :scope .container {
      max-width: 600px;
      padding: 0 32px;
      margin: 0 auto;
      color: #fff;
      font-size: 16px;
      text-align: left;
    }

    :scope .container .introTitle {
      font-size: 40px;
      letter-spacing: -1px;
      line-height: 35px;
      max-width: 600px;
      text-align: left;
      padding-bottom: 32px;
    }

    :scope .container .navigation {
      padding-top: 12px;
    }

    :scope .container .navigation buttonLink {
      margin-left: 24px;
    }
  </style>
  <script>
    start() {
      opts.next();
      return true;
    }
    onSkipIntroClick(e) {
      // Directly edit property
      AppSettings.save('showIntro', !(!!e.target.checked));
      return true;
    }
  </script>
  <div class="container">
    <div class="introTitle">
      Guidelines
    </div>
    <div class="content">
      <p>This gymnastics includes the set of exercises. At run time your eyes need to follow the direction indicated by the dot.</p>
      <p>The dot shows only the direction of the eyes rotation. Move your eyes as much as possible in the indicated direction, but by doing this you should not feel any discomfort.</p>
      <p>In extreme points hold your eyes for a second.</p>
      <p>After finishing of each exercise you can blink eyes for a few seconds.</p>
      <p>Total time of the exercise: 3 minutes 25 seconds.</p>
    <div>
    <div class="navigation">
      <checkbox name="showIntro" text="Skip intro next time" onChangeHandler={onSkipIntroClick}/>
      <buttonLink text="Start" onclick={start}/>
    </div>
  </div>
</intro>
