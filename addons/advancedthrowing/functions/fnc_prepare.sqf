/*
 * Author: Dslyecxi, Jonpas
 * Prepares throwable or selects the next.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit] call ace_advancedthrowing_fnc_prepare
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// Select next throwable if one already in hand
if (GVAR(inHand)) exitWith {
    if (!GVAR(primed)) then {
        [_unit] call EFUNC(weaponselect,selectNextGrenade);
    };
};

// Try selecting next throwable if none currently selected
if ((currentThrowable _unit) select 0 == "" && {!([_unit] call EFUNC(weaponselect,selectNextGrenade))}) exitWith {
    [_unit, "No valid throwables"] call FUNC(exitThrowMode);
};


GVAR(inHand) = true;

// Add controls hint if enabled
if (GVAR(showMouseControls)) then {
    [
        localize LSTRING(Throw),
        format ["%1 / %2", localize ELSTRING(common,Cancel), localize LSTRING(DropCooked)],
        format ["%1 / %2", localize LSTRING(ChangeMode), localize LSTRING(Cook)]
    ] call EFUNC(interaction,showMouseHint);
};

// Add throw action to suppress weapon firing (not possible to suppress mouseButtonDown event)
_unit setVariable [QGVAR(throwAction), [
    _unit, "DefaultAction", {true}, {true}
] call EFUNC(common,addActionEventHandler)];

// Draw throwable and throw arc if enabled
GVAR(draw3DHandle) = addMissionEventHandler ["Draw3D", {
    call FUNC(drawThrowable);
    if (GVAR(showThrowArc)) then {
        call FUNC(drawArc);
    };
}];
