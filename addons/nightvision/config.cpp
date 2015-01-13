#include "script_component.hpp"

class CfgPatches {
  class ADDON {
    units[] = {};
    weapons[] = {"ACE_NVG_Gen1", "ACE_NVG_Gen2", /*"ACE_NVG_Gen3",*/ "ACE_NVG_Gen4", "ACE_NVG_Wide"};
    requiredVersion = 0.60;
    requiredAddons[] = {"ace_common"};
    author[] = {"commy2", "KoffeinFlummi", "PabstMirror"};
    authorUrl = "https://github.com/commy2/";
    VERSION_CONFIG;
  };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"


// class EGVAR(common,Default_Keys) {  //???
class ACE_common_Default_Keys {
  class increaseNVGBrightness {
    displayName = "$STR_ACE_NightVision_IncreaseNVGBrightness";
    condition = QUOTE( currentVisionMode _player == 1 );
    statement = QUOTE( [_player, _vehicle] call FUNC(increaseNVGBrightness) );
    key = 201;
    shift = 0;
    control = 0;
    alt = 1;
    allowHolding = 1;
  };
  class decreaseNVGBrightness {
    displayName = "$STR_ACE_NightVision_DecreaseNVGBrightness";
    condition = QUOTE( currentVisionMode _player == 1 );
    statement = QUOTE( [_player, _vehicle] call FUNC(decreaseNVGBrightness) );
    key = 209;
    shift = 0;
    control = 0;
    alt = 1;
    allowHolding = 1;
  };
};
