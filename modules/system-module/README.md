# System Module
System module for ecsmanager. This module contains system wide configurations.

## Layout
System Module directory structure;

* config : Contains module configurations.
* config/cfg-bell.el : Contains visible and ring bell configurations.
* config/cfg-buffer-move.el : Contains buffer-move package keybindins.
* config/cfg-package.el : Contains extensions for 'package' package.
* config/cfg-personal.el : Contains personal information (user name, mail) settings.
* config/cfg-shell.el : Contains configurations for term package.
* config/cfg-smex.el : Contains smex package configurations.
* config/cfg-system-kbd.el : Contains system wide keybindings.
* config/cfg-ui.el : Contains configurations for user interface.
* lib : Contains extra packages.
* lib/buffer-move.el: Package for buffer movements.
* info.el: Contains module informations. Module informations are; name, version, description, auto package installation, auto load.
* init.el: Contains control structures for module. Loads bunch of other configurations and checks smex package, if installed loads the configuration, otherwise installs smex package (if specified in info.el file) then loads the configuration.

