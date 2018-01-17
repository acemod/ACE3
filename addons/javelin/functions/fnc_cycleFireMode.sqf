//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
private _currentFireMode = _currentShooter getVariable["ace_missileguidance_attackProfile", "JAV_TOP"];

if(_currentFireMode == "JAV_DIR") then {
    _currentFireMode = "JAV_TOP";
} else {
    _currentFireMode = "JAV_DIR";
};
_currentShooter setVariable["ace_missileguidance_attackProfile", _currentFireMode, false];
