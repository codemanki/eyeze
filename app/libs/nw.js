import gui from 'nw.gui';
let tray;

export function startApp() {
  const win = gui.Window.get();
  if (process.env.NODE_ENV === 'development') {
    devHelpers(document);
    showDevTools();
    setupTray();
  }

  win.on('close', () => {
    if (tray) {
      tray.remove();
      tray = null;
    }
  })
}

function devHelpers(doc) {
  const keyDown = function (e) {
    const win = gui.Window.get();
    if ((e.ctrlKey || e.metaKey) && e.keyCode == 82) {
        // CTRL (CMD) + R reloads the page
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
    icon: 'icon.' + (platform().isOSX ? 'tiff' : 'png')
  });
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
