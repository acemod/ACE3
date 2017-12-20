#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Box_Misc", "ACE_bananaItem"};
        weapons[] = {"ACE_ItemCore","ACE_FakePrimaryWeapon", "ACE_Banana"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main","ace_modules"};
        author = CSTRING(ACETeam);
        authors[] = {"KoffeinFlummi"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG_COMMON;
    };
};

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

#include "ACE_Settings.hpp"
#include "define.hpp"
#include <ProgressScreen.hpp>
#include <HintConfig.hpp>
#include <RscInfoType.hpp>
#include "CompassControl.hpp"

class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_displayText[] = {{((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40)),safeZoneY + 0.175 * safezoneH, (10 *(((safezoneW / safezoneH) min 1.2) / 40)), (2 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))}, "(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };

        class Variables {
            class grid_ACE_displayText {
                displayName = "ACE Hint";
                description = "Textual in game feedback to the player.";
                preview = "\a3\Ui_f\data\GUI\Cfg\UIGrids\grid_hint_ca.paa";
                saveToProfile[] = {0,1};
            };
        };
    };
};

class ACE_Extensions {
    extensions[] = {};
};

class ACE_Tests {
    vehicleTransportInventory = QPATHTOF(dev\test_vehicleInventory.sqf);
    mapConfigs = QPATHTOF(dev\test_mapConfigs.sqf);
};
