#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_Misc", "ACE_bananaItem"};
        weapons[] = {"ACE_ItemCore", "ACE_FakePrimaryWeapon", "ACE_Banana"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main", "ace_modules"};
        author = CSTRING(ACETeam);
        authors[] = {"KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG_COMMON;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgLocationTypes.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgMoves.hpp"
#include "CfgVoice.hpp"
#include "CfgUnitInsignia.hpp"
#include "CfgEden.hpp"
#include "RscInfoType.hpp"

// UI stuff
class RscText;
class RscPicture;
class RscProgress;
class RscStructuredText;
class RscMapControl;
class ctrlStructuredText;
class RscControlsGroupNoScrollbars;
#include "CfgUIGrids.hpp"
#include "Dialogs.hpp"
#include "RscTitles.hpp"
#include "CompassControl.hpp"

#include "define.hpp"

class ACE_Extensions {
    extensions[] = {};
};

class ACE_Tests {
    vehicleTransportInventory = QPATHTOF(dev\test_vehicleInventory.sqf);
    mapConfigs = QPATHTOF(dev\test_mapConfigs.sqf);
};
