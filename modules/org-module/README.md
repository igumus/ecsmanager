# Org (Org-Mode) Module
Org module for ecsmanager. This module loads and configures org-mode package.

## Layout
Org Module directory structure;

* config : Contains module configurations.
* config/cfg-org-mode.el: Contains org-mode package configs and keybindings.
* config/cfg-org-bullets.el : Contains org-bullets package configurations.
* info.el: Contains module informations. Module informations are; name, version, description, auto package installation, auto load.
* init.el: Contains control structures for module. Checks org-bullets package, if installed loads the configuration, otherwise installs org-bullets package (if specified in info.el file) then loads the configuration.

