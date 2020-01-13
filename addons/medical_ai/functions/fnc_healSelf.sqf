#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Makes the unit heal itself.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_medical_ai_fnc_healSelf
 *
 * Public: No
 */

// Player will have to do this manually of course
if ([_this] call EFUNC(common,isPlayer)) exitWith {};
// Can't heal self when unconscious
if IS_UNCONSCIOUS(_this) exitWith {
    _this setVariable [QGVAR(currentTreatment), nil];
};

[_this, _this] call FUNC(healingLogic);
