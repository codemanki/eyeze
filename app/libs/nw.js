import gui from 'nw.gui';
let tray;
const observable = riot.observable();

export function initApp() {
  const win = gui.Window.get();

  if (process.env.NODE_ENV === 'development') {
    devHelpers(document);
    showDevTools();
    setupTray();
  }

  win.on('close', function() {
    removeTray();
    this.close(true);
  });

  return observable;
}

function removeTray() {
  if (tray) {
    tray.remove();
    tray = null;
  }
}

function devHelpers(doc) {
  const keyDown = function (e) {
    const win = gui.Window.get();
    if ((e.ctrlKey || e.metaKey) && e.keyCode == 82) {
        // CTRL (CMD) + R reloads the page
      removeTray();
      win.reload();
    }

    if ((e.ctrlKey || e.metaKey) && e.keyCode == 81) {
      // CTRL (CMD) + Q closes app
      gui.App.quit();
    }

    if ((e.ctrlKey || e.metaKey) && e.shiftKey && e.keyCode == 73) {
      // CTRL (CMD) + SHIFT + I shows devtools window
      win.showDevTools();
    }
  }

  doc.addEventListener('keydown', keyDown, false);
};

function showDevTools() {
  const win = gui.Window.get();
  win.showDevTools();
}

function setupTray() {
  tray = new gui.Tray({
    icon: '/assets/icon.' + (platform().isOSX ? 'tiff' : 'png')
  });

  // Setup menu
  let menu = new gui.Menu();
  menu.append(new gui.MenuItem({ type: 'normal', label: 'Start', click: startApp }));
  menu.append(new gui.MenuItem({ type: 'normal', label: 'Stop', click: stopApp }));
  menu.append(new gui.MenuItem({ type: 'normal', label: 'Quit', click: quitApp }));

  tray.menu = menu;
}

function stopApp() {
  let win = gui.Window.get();
  observable.trigger('stop');
  if (win) {
    win.hide();
  }
}

function quitApp() {
  let win = gui.Window.get();
  observable.trigger('stop');
  if (win) {
    win.close();
  }
}

function startApp() {
  const inDevelopment = process.env.NODE_ENV === 'development';
  let win = gui.Window.get();
  let windowSizeOptions = {
    width: window.screen.width, height: window.screen.height
  };

  if (inDevelopment) {
    windowSizeOptions.width = 1024;
    windowSizeOptions.height = 768;
  }

  observable.trigger('start');

  win.resizeTo(windowSizeOptions.width, windowSizeOptions.height);
  win.moveTo(0,0);
  win.show();
}

function platform() {
  let platform = process.platform;
  const arch = process.arch === 'ia32' ? '32' : '64';

  platform = platform.indexOf('win') === 0 ? 'win'
          : platform.indexOf('darwin') === 0 ? 'osx'
          : 'linux';

  return {
    isOSX: platform === 'osx',
    isWindows: platform === 'win',
    isLinux: platform === 'linux',
    name: platform + arch,
    type: platform,
    arch: arch
  };
}


