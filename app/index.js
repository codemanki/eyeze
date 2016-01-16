require('./tags/app.tag');
import { initApp } from './libs/nw';

$(() => {
  initApp();
  riot.mount('*');
});

