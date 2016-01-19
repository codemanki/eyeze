const DEFAULT_SETTINGS = {
  skipInto: false,
  autoStart: false,
  breakInterval: 0,
  enableGradientBackground: true
};

let settings = getSettings();

export default {
  getItem: (item) => {
    return settings[item];
  },

  getAll: () => {
    return settings;
  },

  save: (item, value) => {
    settings[item] = value;
    localStorage.setItem('settings', JSON.stringify(settings));
  }
}

function getSettings() {
  let result;
  try {
    result = JSON.parse(localStorage.settings);
  } catch (e) {
    // No settings, save defaults
    localStorage.setItem('settings', JSON.stringify(DEFAULT_SETTINGS));
    result = DEFAULT_SETTINGS;
  }

  return result;
}
