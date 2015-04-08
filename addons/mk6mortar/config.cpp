#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_RangeTable_82mm"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"PabstMirror"};
        authorUrl = "https://github.com/acemod";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class RscText;
class RscListbox;
class RscListNBox;
class RscPicture;
class RscControlsGroup;
class ScrollBar;
class RscActiveText;

#include "RscInGameUI.hpp"
#include "RscRangeTable.hpp"

class ACE_Settings {
    //These settings effect gameplay difficutly:  defaults will leave the mortar the same as vanilla
    class GVAR(airResistanceEnabled) {
        value = 0;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowComputerRangefinder) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
    class GVAR(allowCompass) {
        value = 1;
        typeName = "BOOL";
        isClientSetable = 0;
    };
};
