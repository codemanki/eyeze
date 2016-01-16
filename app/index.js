require('./tags/app.tag');
import { initApp } from './libs/nw';
$(() => {
  const appObservable = initApp();
  let appTag;

  appObservable.on('start', () => {
    appTag = riot.mount('*')[0];
  });

  appObservable.on('stop', () => {
    appTag.unmount(true);
  });
});

