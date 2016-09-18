# Git (Magit) Module
Git module for ecsmanager. This module loads and configures magit package.

## Layout
Git Module directory structure;

* config: Contains module configurations.
* config/cfg-magit.el: Contains magit package configs and keybindings.
* info.el: Contains module informations. Module informations are; name, version, description, auto package installation, auto load.
* init.el: Contains control mechanisms for module. Checks magit package, if installed loads the configuration, otherwise installs magit package (if specified in info.el file) then loads the configuration.

