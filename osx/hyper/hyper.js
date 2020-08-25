module.exports = {
  config: {
    updateChannel: 'stable',

    //font
    fontFamily: '"FiraCode-Regular", "Menlo", monospace',
    fontSize: 20,
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    letterSpacing: 0,
    lineHeight: 1.1,

    // terminal colors
    colors: {
      black: '#000000',
      red: '#f68d8c',
      green: '#a7d3a9',
      yellow: '#ffd478',
      blue: '#77aad5',
      magenta: '#d6acd5',
      cyan: '#75d4d5',
      white: '#fefefe',
      lightBlack: '#000000',
      lightRed: '#f68d8c',
      lightGreen: '#a7d3a9',
      lightYellow: '#ffd478',
      lightBlue: '#77aad5',
      lightMagenta: '#d6acd5',
      lightCyan: '#75d4d5',
      lightWhite: '#fefefe',
    },

    // window style
    backgroundColor: '#3b3b3b',
    borderColor: '#333',
    cursorAccentColor: '#3b3b3b',
    cursorBlink: true,
    cursorColor: '#d5d5d5',
    cursorShape: 'BLOCK',
    foregroundColor: '#fff',
    padding: '12px 14px',
    selectionColor: 'rgba(255,255,255,0.7)',

    // misc settings
    bell: false,
    copyOnSelect: true,
    defaultSSHApp: true,
    macOptionSelectionMode: 'vertical',
    quickEdit: true,
    shellArgs: ['--login'],
    webGLRenderer: true,
  },

  plugins: ["hyper-tabs-enhanced"],

  localPlugins: [],

  keymaps: {},
};
