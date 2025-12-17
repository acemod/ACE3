class CfgPatches
{
	class compat_aegis_realisticweights
	{
		name="ACE3 - Realistic Weights Aegis Patch";
		units[]={};
		weapons[]={};
		requiredVersion=2.2;
		requiredAddons[]=
		{
			"ace_realisticweights",
			"A3_Aegis_Weapons_F_Aegis"
		};
		skipWhenMissingDependencies = 1;
		author="$STR_ace_common_ACETeam";
		authors[]=
		{
			"PoToo"
		};
		url="$STR_ace_main_URL";
		version=3.2;
		versionStr="3.20.0.104";
		versionAr[]={3,20,0,104};
	};
};

#include "CfgWeapons.hpp"