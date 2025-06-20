#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_artilleryTable"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


// Common UI Stuff:
class RscText;
class RscListBox;
class RscListNBox;
class RscPicture;
class RscControlsGroupNoScrollbars;
class ScrollBar;
class RscActiveText;
class ctrlButton;

#include "RscTitles.hpp"
#include "RscRangeTable.hpp"

