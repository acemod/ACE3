#include "script_component.hpp"

#define RECOMPILE 0

class CfgPatches
{
	class ace_finger
	{
		units[]={};
		weapons[]={};

		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"ace_common"};

		author[]=
		{
			"Drill"
		};
		authorUrl = "https://github.com/TheDrill/";
		
		addon_version=6;
		
		VERSION_CONFIG;
	};
};

class CfgFunctions
{
	class ace_finger
	{
		class Main
		{
			file="\z\ace\addons\finger\code";
			class _init
			{
				preInit=0;
				postInit=1;
				recompile=RECOMPILE;
			};

			class _mainLoop {recompile=RECOMPILE;};
			class _comm {recompile=RECOMPILE;};
			class _fp_handler {recompile=RECOMPILE;};
			class _OEF_renderer {recompile=RECOMPILE;};
		};
	};
};



#include "ACE_Settings.hpp"

