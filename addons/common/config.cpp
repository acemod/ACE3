#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_Misc", "ACE_bananaItem", "ACE_Flag_Black", "ACE_Flag_White", "ACE_ModuleLSDVehicles"};
        weapons[] = {"ACE_ItemCore", "ACE_FakePrimaryWeapon", "ACE_Banana"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main","ace_modules"};
        author = CSTRING(ACETeam);
        authors[] = {"KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEden.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgLocationTypes.hpp"
#include "CfgGesturesMale.hpp"
#include "CfgMagazines.hpp"
#include "CfgMoves.hpp"
#include "CfgSounds.hpp"
#include "CfgUnitInsignia.hpp"
#include "CfgVehicles.hpp"
#include "CfgVoice.hpp"
#include "CfgWeapons.hpp"
#include "CfgWrapperUI.hpp"

class ACE_Rsc_Display_Base {
    idd = -1;
    type = 0;
    style = 48;
    name = "";
    duration = 999999;
    fadeIn = 0;
    fadeOut = 0;
    font = "TahomaB";
    size = 1;
    colorBackground[] = {1, 1, 1, 0};
    colorText[] = {1, 1, 1, 1};
};

class ACE_Rsc_Control_Base {
    idc = 1;
    type = 0;
    style = 48;
    lineSpacing = 0;
    moving = 1;
    text = "";
    size = 1;
    sizeEx = 0;
    font = "TahomaB";
    colorBackground[] = {1, 1, 1, 0};
    colorText[] = {1, 1, 1, 1};
    x = 0;
    y = 0;
    w = 0;
    h = 0;
};

class ctrlMapEmpty;

#include "ACE_Settings.hpp"
#include "define.hpp"
#include "ProgressScreen.hpp"
#include "DisableMouseDialog.hpp"
#include "HintConfig.hpp"
#include "RscInfoType.hpp"
#include "CompassControl.hpp"
#include "CfgUIGrids.hpp"

class ACE_Tests {
    vehicleTransportInventory = QPATHTOF(dev\test_vehicleInventory.sqf);
    mapConfigs = QPATHTOF(dev\test_mapConfigs.sqf);
    cfgPatches = QPATHTOF(dev\test_cfgPatches.sqf);
    configCommands = QPATHTOF(dev\test_configCommands.sqf);
};

#ifdef ACE_CONFIG_COMMANDS_TEST
class GVAR(configCommandTestClasses) {
    class GVAR(testBase) {
        class GVAR(subclass1) {
            test = 1;
        };
    };
    class GVAR(test1): GVAR(testBase) {};
    class GVAR(test2): GVAR(testBase) {
        class GVAR(subclass1): GVAR(subclass1) {};
    };
    class GVAR(test3): GVAR(testBase) {
        class GVAR(subclass1): GVAR(subclass1) {
            test = 1;
        };
    };
    class GVAR(test4): GVAR(testBase) {
        class GVAR(subclass2): GVAR(subclass1) {};
    };
    class GVAR(test5): GVAR(testBase) {
        class GVAR(subclass2): GVAR(subclass1) {
            test = 1;
        };
    };
};
#endif

#include "ACE_ExtensionsHashes.hpp"
