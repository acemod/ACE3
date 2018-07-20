/*
 * Author: commy2
 * Handles playerChanged.  Resets "showHUD" based on handcuff status
 *
 * Arguments:
 * 0: _newUnit <OBJECT>
 * 1: _oldUnit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [bob1, bob2] call ACE_captives_fnc_handlePlayerChange
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_newUnit","_oldUnit"];

//set showHUD based on new unit status:
if ((_newUnit getVariable [QGVAR(isHandcuffed), false]) || {_newUnit getVariable [QGVAR(isSurrendering), false]}) then {
    TRACE_1("Player Change (showHUD false)",_newUnit);
    ["captive", [false, false, false, false, false, false, false, false, false, true]] call EFUNC(common,showHud);
} else {
    TRACE_1("Player Change (showHUD true)",_newUnit);
    ["captive", []] call EFUNC(common,showHud); //same as showHud true;
};

//If old player was escorting, stop
if (_oldUnit getVariable [QGVAR(isEscorting), false]) then {
    _oldUnit setVariable [QGVAR(isEscorting), false, true];
};
