#include "script_component.hpp"
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
        ACE_player setVariable [QGVAR(dropDistance), (_dropDistance - 0.1) max DROP_DISTANCE_DEFAULT];
    } else {
        // Move further
        ACE_player setVariable [QGVAR(dropDistance), (_dropDistance + 0.1) min 1];
    };

    // Limit distance in vehicle
    if (vehicle ACE_player != ACE_player) then {
        ACE_player setVariable [QGVAR(dropDistance), (ACE_player getVariable [QGVAR(dropDistance), DROP_DISTANCE_DEFAULT]) min 0.5];
    };
} else {
    private _throwType = ACE_player getVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];
    if (_amount < 0) then {
        if (_throwType == "high") then {
            ACE_player setVariable [QGVAR(throwType), THROW_TYPE_DEFAULT];
        };
    } else {
        if (_throwType == "normal") then {
            ACE_player setVariable [QGVAR(throwType), "high"];
        };
    };
    TRACE_2("Change Throw Type",_amount,ACE_player getVariable QGVAR(throwType));
};
