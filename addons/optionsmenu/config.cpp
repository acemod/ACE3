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
class ACE_Options {
  class GVAR(testOption) {
    displayName = "Config Test";
    description = "Config Description";
    default = 1;
    values[] = {"Yeah", "Naa"};
  };
};
class ACE_Colors {
  class GVAR(testColor) {
    displayName = "Color Config Test";
    description = "Color Config Description";
    default[] = {0,1,1,1};
  };
};


#include "CfgEventHandlers.hpp"
#include "gui\define.hpp"
#include "gui\settingsMenu.hpp"
#include "gui\pauseMenu.hpp"