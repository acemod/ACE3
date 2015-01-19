#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Box_Misc"};
        weapons[] = {"ACE_ItemCore","ACE_FakePrimaryWeapon"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main", "ace_gui"};
        author[] = {"KoffeinFlummi"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"

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
    access = 0;
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

class ACE_canInteractConditions {
    class GVAR(notOnMap) {
        condition = "!visibleMap";
    };
};

class ACE_Options {
    class enableNumberHotkeys {
        displayName = "$STR_ACE_Common_EnableNumberHotkeys";
        default = 1;
    };
};

#include <MainMenu.hpp>
#include <MenuConfig.hpp>
#include <ProgressScreen.hpp>
#include <HintConfig.hpp>

/*
class RscControlsGroupNoScrollbars;
class RscAttributeInventory: RscControlsGroupNoScrollbars {
    onSetFocus = QUOTE([ARR_3(_this,""RscAttributeInventory"",'CuratorCommon')] call (uinamespace getvariable ""BIS_fnc_initCuratorAttribute""); _this select 0 call DFUNC(addCuratorUnloadEventhandler););
};
*/

#include <RscInfoType.hpp>
#include <FixPickup.hpp>
#include <FixAnimations.hpp>
#include <NoVoice.hpp>

