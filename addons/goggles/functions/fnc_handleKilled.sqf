#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, commy2
 * Handles the player dying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Example:
 * [bob] call ace_goggles_fnc_handleKilled
 *
 * Public: No
 */

params ["_unit"];

if (_unit != ACE_player) exitWith {true};
if (GVAR(effects) == 0) exitWith {true};

call FUNC(removeGlassesEffect);

if (GVAR(effects) == 2) then {
    GVAR(PostProcessEyes) ppEffectEnable false;

    SETGLASSES(_unit,GLASSESDEFAULT);

    _unit setVariable ["ACE_EyesDamaged", false];

    if (GVAR(DustHandler) != -1) then {
        [GVAR(DustHandler)] call CBA_fnc_removePerFrameHandler;
    };
    GVAR(DustHandler) = -1;
};

true
