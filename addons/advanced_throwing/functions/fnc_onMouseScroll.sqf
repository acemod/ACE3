#include "..\script_component.hpp"
/*
 * Author: Dslyecxi, Jonpas
 * Mouse scroll wheel changed event.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_advanced_throwing_fnc_onMouseScroll
 *
 * Public: No
 */

if !(ACE_player getVariable [QGVAR(inHand), false]) exitWith {};

params ["", "_amount"];

if (ACE_player getVariable [QGVAR(dropMode), false]) then {
    private _dropDistance = ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT];
    if (_amount < 0) then {
        // Move closer
        ACE_player setVariable [QGVAR(dropDistance), (_dropDistance - THROWSTYLE_DROP_STEP) max DROP_DISTANCE_DEFAULT];
    } else {
        // Move further
        ACE_player setVariable [QGVAR(dropDistance), (_dropDistance + THROWSTYLE_DROP_STEP) min 1];
    };

    // Limit distance in vehicle
    if (!isNull objectParent ACE_player) then {
        ACE_player setVariable [QGVAR(dropDistance), (ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]) min 0.5];
    };
} else {
    private _throwProduct = ACE_player getVariable [QGVAR(throwMod), THROW_MODIFER_DEFAULT];
    if (_amount < 0) then {
        if (CBA_events_shift) then {
            ACE_player setVariable [QGVAR(throwMod), THROW_MODIFER_MAX];
        } else {
            ACE_player setVariable [QGVAR(throwMod), (_throwProduct + THROW_MODIFER_STEP) min THROW_MODIFER_MAX];
        };
    } else {
        if (CBA_events_shift) then {
            ACE_player setVariable [QGVAR(throwMod), THROW_MODIFER_MIN];
        } else {
            ACE_player setVariable [QGVAR(throwMod), (_throwProduct - THROW_MODIFER_STEP) max THROW_MODIFER_MIN];
        };
    };
    TRACE_2("Change Throw Type",_amount,ACE_player getVariable QGVAR(throwMod));
};
