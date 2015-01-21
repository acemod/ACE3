#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class CfgPatches
{
	class cse_ab_kestrel4500
	{
		units[]={};
		weapons[]= {"cse_ab_Kestrel4500"};
		requiredVersion=1.26;
		requiredAddons[]= {"cse_f_modules", "cse_main", "cse_f_configuration"};
		version="1.3";
		author[]= {"Ruthberg"};
	};
};
class CfgAddons
{
	class PreloadAddons
	{
		class cse_ab_kestrel4500
		{
			list[]=
			{
				"cse_ab_kestrel4500"
			};
		};
	};
};

#include "combat_space_enhancement.h"
#include "CfgWeapons.h"
#include "CfgVehicles.h"
#include "CfgFunctions.h"
#include "CfgSounds.h"
#include "UI.h"