# Themes Module
Themes module for ecsmanager. This modules loads and configures color-theme package.

## Layout
Themes Module directory structure;

* config: Contains module configurations.
* config/cfg-color-theme.el: Contains color-theme package configs and sets custom theme.
* info.el: Contains module informations. Module informations are; name, version, description, auto package installation, auto load.
* init.el: Contains control mechanisms for module. Checks color-theme package, if installed loads the configuration, otherwise installs color-theme package (if specified in info.el file) then loads the configuration.
* lib: Contains extra package files.
* lib/cyberpunk.el: [cyberpunk theme](https://github.com/overtone/emacs-live/)
* lib/gandalf.el: [gandalf theme](https://github.com/overtone/emacs-live/)

