#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_Misc", "ACE_bananaItem", "ACE_Flag_Black", "ACE_Flag_White"};
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
};

class ACE_ExtensionsHashes {
    class ace_advanced_ballistics {
        dll = "bbfbd04bced4e4766298903944ff2d0e3da7586a";
        dll_x64 = "95bdf812ebb52d4e87c4b1b980dfa785d4f980a7";
    };
    class ace_artillerytables {
        dll = "f6db1088a08e1c98f3718159a653df3ba11df773";
        dll_x64 = "d3f76b3b95ffe9c6ab6ded137ae41edcab81a9f0";
    };
    class ace_break_line {
        dll = "c1f0b83ced1f36849c8aaf23f27c889d7d7e1344";
        dll_x64 = "8622873962f4c4d3bbe05891242f21ba69845d11";
    };
    class ace_clipboard {
        dll = "cde2eceb8bac3a119c53a957e332f1a2f9cd8dcb";
        dll_x64 = "d5e8660018b9c9e870a0d4e6005a65afe48b00d3";
    };
    class ace_fcs {
        dll = "58b36db51209f61f2b63fc2469b1c74efd581012";
        dll_x64 = "4db527f03bbe71d5004647ad6b12d0263b0c3af9";
    };
};
