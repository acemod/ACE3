// by commy2

#include "script_component.hpp"

GVAR(flashbangPPEffectCC) = ppEffectCreate ["ColorCorrections", 4265];
GVAR(flashbangPPEffectCC) ppEffectForceInNVG true;

["ACE3",
localize "STR_ACE_Grenades_SwitchGrenadeMode",
{_this call FUNC(nextMode)},
[9, [false, false, false]],  //8 key
false,
"keydown"] call cba_fnc_registerKeybind;
