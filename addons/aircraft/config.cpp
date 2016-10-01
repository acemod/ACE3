#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi","Crusty","commy2","jaynus","Kimi","Alexus","Zabuza","sargken"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgLights.hpp"
#include "CfgMagazines.hpp"
#include "CfgSoundSets.hpp"
#include "CfgSoundShaders.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscInGameUI.hpp"

class ACE_Gau8ShellImpact {
	class LightExp {
		simulation = "light";
		type = "ACE_Gau8ShellExplLght";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class Explosion1
	{
		simulation = "particles";
		type = "ACE_Gau8ShellExplCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class ExpSpark
	{
		simulation = "particles";
		type = "ACE_Gau8ShellSprksCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class SmallSmoke1
	{
		simulation = "particles";
		type = "ACE_Gau8ShellSmkCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class MedDust1
	{
		simulation = "particles";
		type = "ACE_Gau8ShellDstCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	class BigDirt1
	{
		simulation = "particles";
		type = "ACE_Gau8ShellDrtCldlt";
		position[] = {0,0,0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};
