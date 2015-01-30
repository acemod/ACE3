
#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ACE_main"};
    version = VERSION;
    author[] = {$STR_ACE_Common_ACETeam};
    authorUrl = "http://csemod.com"; // TODO website link?
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

// TODO Port over the UI defines
#include "GUI.hpp"
#include "empty.hpp"
