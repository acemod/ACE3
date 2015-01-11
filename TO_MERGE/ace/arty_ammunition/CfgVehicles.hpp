#include "\x\cba\addons\xeh\script_xeh.hpp"
class CfgVehicles {
	class ACE_Arty_BaseThing;
	class ACE_Arty_ShellHolder;
	#include "60mm\CfgVehicles.hpp"
	#include "81mm\CfgVehicles.hpp"
	#include "82mm\CfgVehicles.hpp"
	#include "105mm\CfgVehicles.hpp"
	#include "120mm\CfgVehicles.hpp"
	#include "155mm\CfgVehicles.hpp"
	#include "CfgAmmoBoxes.hpp"
	class Sound;
	class ace_arty_roundSoundSource:Sound {
		scope = 2;
		sound = "ace_arty_roundSoundSourceSound";
		displayName = "arty sound";
	};
};
