#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dani (TCVM)"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class RscOpticsValue;
class RscControlsGroupNoScrollbars;
class RscPicture;
class RscLine;
class RscMapControl;
class RscText;

#define COLOR_WHITE {0.8745,0.8745,0.8745,1}
#define COLOR_BLACK {0,0,0,1}

#include "ACE_GuidanceConfig.hpp"
#include "RscTitles.hpp"
#include "RscInGameUI.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"

