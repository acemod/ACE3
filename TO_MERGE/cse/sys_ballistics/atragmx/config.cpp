#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class CfgPatches
{
	class cse_ab_atragmx
	{
		units[]={};
		weapons[]= {"cse_ab_ATragMX"};
		requiredVersion=1.26;
		requiredAddons[]= {"cse_f_modules", "cse_main", "cse_f_configuration"};
		version="1.0";
		author[]= {"Ruthberg"};
	};
};
class CfgAddons
{
	class PreloadAddons
	{
		class cse_ab_atragmx
		{
			list[]=
			{
				"cse_ab_atragmx"
			};
		};
	};
};

#include "Combat_Space_Enhancement.h"
#include "CfgFunctions.h"
#include "CfgWeapons.h"
#include "CfgVehicles.h"
#include "UI.h"