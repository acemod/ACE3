#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"KoffeinFlummi","Crusty","commy2","jaynus","Kimi","Alexus","Zabuza"};
        authorUrl = "https://github.com/KoffeinFlummi/";
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgCloudlets.hpp"
#include "CfgLights.hpp"
#include "RscInGameUI.hpp"

class Gau8ShellImpact
{
	class LightExp
	{
		simulation = "light";
		type = "Gau8ShellExplLght";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class Explosion1
	{
		simulation = "particles";
		type = "Gau8ShellExplCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class ExpSpark
	{
		simulation = "particles";
		type = "Gau8ShellSprksCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class SmallSmoke1
	{
		simulation = "particles";
		type = "Gau8ShellSmkCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class MedDust1
	{
		simulation = "particles";
		type = "Gau8ShellDstCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class BigDirt1
	{
		simulation = "particles";
		type = "Gau8ShellDrtCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};