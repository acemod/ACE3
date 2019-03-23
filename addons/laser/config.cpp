#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp" 
#include "CfgEventhandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


class RscControlsGroup;
class VScrollbar;
class HScrollbar;
class RscText;
class RscMapControl;
class RscControlsGroupNoScrollbars;
class RscPictureKeepAspect;

#include "RscInGameUI.hpp"
#include "RscTitles.hpp"
