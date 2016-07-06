//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
private _currentFireMode = _currentShooter getVariable ["ace_missileguidance_attackProfile", "JAV_TOP"];

if(_currentFireMode == "JAV_TOP") then {
    __JavelinIGUITop ctrlSetTextColor __ColorGreen;
    __JavelinIGUIDir ctrlSetTextColor __ColorGray;
} else {
    __JavelinIGUITop ctrlSetTextColor __ColorGray;
    __JavelinIGUIDir ctrlSetTextColor __ColorGreen;
};
