require('./app.tag');
import { startApp } from './libs/nw';

$(() => {
  startApp();
  riot.mount('*');
});

