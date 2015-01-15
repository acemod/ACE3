#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ACE_gui","ACE_common"};
    version = VERSION;
    versionDesc = "ACE Weapon Resting";
    author[] = {$STR_ACE_Core_ACETeam, "Combat Space Enhancement", "Tupolov", "Glowbal", "Ruthberg"};
    authorUrl = "http://csemod.com";
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
#include "CfgSounds.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgMovesMaleSdr.hpp"
