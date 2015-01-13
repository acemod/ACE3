
#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ACE_gui","ACE_main"};
    version = VERSION;
    author[] = {$STR_ACE_Core_ACETeam};
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

#include "CfgFactionClasses.hpp"
#include "CfgVehicles.hpp"
#include "CFgEventHandlers.hpp"

// TODO Port over the UI defines
#include "ui\define.hpp"
#include "ui\empty.hpp"
#include "ui\effects.hpp"