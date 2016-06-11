#include "script_component.hpp"

// Cancel placement on right mouse button
["MouseButtonDown", {
    params ["", "_key"];

    if (_key != 1 || {!(ACE_player setVariable [QGVAR(connecting), false])} || {ACE_player getVariable [QGVAR(stage), 0] != 0}) exitWith {};

    [ACE_player] call FUNC(cancelConnect);
}] call CBA_fnc_addDisplayHandler;
