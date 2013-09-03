# PCKeyboardHack\KeyRemap4MacBook Config

### Goals

- tap `Caps Lock` for `Escape`
- hold `Caps Lock` for `Control`
- double-tap `Left Shift` to toggle default `Caps Lock` behavior

### Setup

1. Run the following commands in terminal:
	- `mkdir -p ~/Library/Application\ Support/KeyRemap4MacBook`
	- `ln -s ~/.dotfiles/app_setting/keyremap4macbook/private.xml ~/Library/Application\ Support/KeyRemap4MacBook/private.xml`

2. Install [PCKeyboardHack](http://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html.en)
3. Install [KeyRemap4MacBook](http://pqrs.org/macosx/keyremap4macbook/)
4. Apple > System Preferences > Keyboard > Modifier Keys > Remap `Caps Lock` to `Control`
5. Launch PCKeyboardHack
6. Enable "Change Caps Lock" option, map `Caps Lock` to keycode 80
7. Launch KeyRemap4MacBook
8. In the "Change Key" tab:
	- Enable "F19 to Escape/Control"
	- Enable "Double-tap Left Shift for Caps Lock"
9. In the "Key Repeat" tab:
	- Change "[Key Overlaid Modifier] Timeout" to 300ms

### Sources

- [Toward a more useful keyboard](https://github.com/jasonrudolph/keyboard)
- [A Modern Space Cadet](http://stevelosh.com/blog/2012/10/a-modern-space-cadet/)
