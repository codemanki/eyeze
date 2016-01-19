require('./tags/app.tag');
require('./tags/settings/settings.tag');
import { initApp } from './libs/nw';
$(() => {
  const appObservable = initApp();
  let appTag;

  appObservable.on('start', () => {
    appTag = riot.mount('app')[0];
  });

  appObservable.on('settings', () => {
    appTag = riot.mount('settings')[0];
  });

  appObservable.on('stop', () => {
    appTag.unmount(true);
  });
});

