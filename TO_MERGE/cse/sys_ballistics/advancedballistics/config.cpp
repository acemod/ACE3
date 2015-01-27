#define ST_LEFT 0
#define ST_RIGHT 1
#define ST_CENTER 2

class CfgPatches
{
	class cse_ab_advancedballistics
	{
		units[]={};
		weapons[]={};
		requiredVersion=1.26;
		requiredAddons[]=
		{
			
		};
		version="2.7";
		author[]=
		{
			"Ruthberg"
		};
	};
};
class CfgAddons
{
	class PreloadAddons
	{
		class cse_ab_advancedballistics
		{
			list[]=
			{
				"cse_ab_advancedballistics"
			};
		};
	};
};

#include "CfgAmmo.h"
#include "CfgMagazines.h"
#include "CfgWeapons.h"
#include "CfgSounds.h"
#include "CfgVehicles.h"
#include "CfgFunctions.h"
#include "Combat_Space_Enhancement.h"
#include "UI.h"