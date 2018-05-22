/*
    File Name: config.cpp
    Author: Jak Keen
*/
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        authors[] = {"Jak Keen"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class ACE_BackgroundBase {
    type = 0;
    idc = -1;
    style = 48;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,1,0,1};
    font = "RobotoCondensed";
    text = "";
    sizeEx = 0.032;

    x = "0.970976 * safezoneW + safezoneX";
    w = "0.0192628 * safezoneW";
    h = "0.046183 * safezoneH";
};

class RscTitles {
    class ACE_FoodStats {
        duration = 1e+011;
        idd = 1113;
        movingenable = 0;
        onLoad = "uiNamespace setVariable ['ACE_FoodStats', _this select 0];";
        onUnload = "uiNamespace setVariable ['ACE_FoodStats', displayNull];";
        
        class controlsBackground {
            class ACE_FoodStatus: ACE_BackgroundBase {
                text = QPATHTOF(data\gui\food.paa);
                idc = 11131;

                y = "0.891455 * safezoneH + safezoneY";
            };
            
            class ACE_DrinkStatus: ACE_BackgroundBase {
                text = QPATHTOF(data\gui\water.paa);
                idc = 11132;

                y = "0.840874 * safezoneH + safezoneY";
            };
            
            class ACE_Camelbak: ACE_BackgroundBase {
                text = QPATHTOF(data\gui\camelbak.paa);
                idc = 11133;

                y = "0.79689 * safezoneH + safezoneY";
            };
        };
    };
};

class CfgSounds {
    sounds[] = {};

    class ACE_Eating {
        name = "ACE_Eating";
        sound[] = {QPATHTOF(sounds\eating.ogg), 1, 1, 3};
        titles[] = {0, ""};
    };

    class ACE_Drinking {
        name = "ACE_Drinking";
        sound[] = {QPATHTOF(sounds\drinking.ogg), 1, 1, 3};
        titles[] = {0, ""};
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Settings.hpp"