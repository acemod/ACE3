#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common"};
    author[] = {"Combat Space Enhancement"};
    authorUrl = "http://csemod.com";
    VERSION_CONFIG;
  };
};

class CfgAddons {
  class PreloadAddons {
    class ADDON {
      list[] = {QUOTE(ADDON)};
    };
  };
};


#include "CfgEventHandlers.hpp"
#include "gui\define.hpp"
#include "gui\settingsMenu.hpp"
#include "gui\pauseMenu.hpp"