#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class ACE_Extensions {
    class ace_artillerytables {
        windows = 1;
        client = 1;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


// Common UI Stuff:
class RscText;
class RscListbox;
class RscListNBox;
class RscPicture;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class ScrollBar;
class RscActiveText;
class RscStructuredText;
class ctrlButton;

#include "RscTitles.hpp"
#include "RscRangeTable.hpp"

