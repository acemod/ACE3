/*
	File Name: config.cpp
	Author: Jak Keen
*/
#include "script_component.hpp"

class CfgPatches
{
    class ADDON
	{
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

class ACE_BackgroundBase
{
	type = 0;
	idc = -1;
	style = 48;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "RobotoCondensed";
	text = "";
	sizeEx = 0.032;
};

class RscTitles
{
	class ACE_FoodStats
	{
		duration = 1e+011;
		idd = 1113;
		movingenable = 0;
		onLoad = "uiNamespace setVariable ['ACE_FoodStats', _this select 0];";
		onUnload = "uiNamespace setVariable ['ACE_FoodStats', displayNull];";
		
		class controlsBackground
		{
			class ACE_FoodStatus: ACE_BackgroundBase
			{
				text = QPATHTOF(data\gui\food.paa);
				colorText[] = {0,1,0,1};
				idc = 11131;
				x = "0.955313 * safezoneW + safezoneX";
				y = "0.90 * safezoneH + safezoneY";
				w = 0.05;
				h = 0.09;
			};
			
			class ACE_DrinkStatus: ACE_BackgroundBase
			{
				text = QPATHTOF(data\gui\water.paa);
				colorText[] = {0,1,0,1};
				idc = 11132;
				x = "0.955313 * safezoneW + safezoneX";
				y = "0.85 * safezoneH + safezoneY";
				w = 0.05;
				h = 0.09;
			};
			
			class ACE_Camelbak: ACE_BackgroundBase
			{
				text = QPATHTOF(data\gui\camelbak.paa);
				colorText[] = {0,1,0,1};
				idc = 11133;
				x = "0.955313 * safezoneW + safezoneX";
				y = "0.80 * safezoneH + safezoneY";
				w = 0.05;
				h = 0.09;
			};
		};
	};
};

class CfgSounds
{
	sounds[] = {};

	class eating
	{
		name = "eating";
		sound[] = {QPATHTOF(sounds\eating.ogg), 1, 1, 3};
		titles[] = {0, ""};
	};

	class drinking
	{
		name = "drinking";
		sound[] = {QPATHTOF(sounds\drinking.ogg), 1, 1, 3};
		titles[] = {0, ""};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "ACE_Settings.hpp"