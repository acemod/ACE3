// by commy2

#include "script_component.hpp"

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

// class ACE_Core_Default_Keys {
// class switchGrenadeMode {
// displayName = "$STR_ACE_Grenades_SwitchGrenadeMode";
// condition = "[_player] call ACE_Core_fnc_canUseWeapon";
// statement = "call ACE_Grenades_fnc_nextMode";
// key = 9;//34;
// shift = 0;
// control = 0;
// alt = 0;//1;
// };
// };

["ACE3",
localize "STR_ACE_Grenades_SwitchGrenadeMode",
{_this call FUNC(nextMode)},
[17, [false, false, false]],  //8 key
false,
"keydown"] call cba_fnc_registerKeybind;