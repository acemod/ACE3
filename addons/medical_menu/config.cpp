#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_medical"};
    version = VERSION;
    author[] = {$STR_ACE_Common_ACETeam, "Glowbal"};
    authorUrl = "http://ace3mod.com"; 
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
#include "ui\define.hpp"
#include "ui\menu.hpp"
