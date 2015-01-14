#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {};
    requiredVersion = REQUIRED_VERSION;
    requiredAddons[] = {"ace_common"};
    author[] = {"commy2", "KoffeinFlummi"};
    authorUrl = "https://github.com/commy2/";
    VERSION_CONFIG;
  };
};

class ACE_Core_Default_Keys {
  class switchGrenadeMode {
    displayName = "$STR_ACE_Grenades_SwitchGrenadeMode";
    condition = "[_player] call ACE_Core_fnc_canUseWeapon";
    statement = "call ACE_Grenades_fnc_nextMode";
    key = 9;//34;
    shift = 0;
    control = 0;
    alt = 0;//1;
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgAmmo.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
