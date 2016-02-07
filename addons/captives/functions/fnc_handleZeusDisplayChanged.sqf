/*
 * Author: PabstMirror
 * Handles ZeusDisplayChanged event
 * Need to reset showHUD after closing zeus
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Display is now open <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [bob1, false] call ACE_captives_fnc_handleZeusDisplayChanged
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit","_zeusIsOpen"];

//set showHUD based on unit status:
if (!_zeusIsOpen) then {
    if ((_unit getVariable [QGVAR(isHandcuffed), false]) || {_unit getVariable [QGVAR(isSurrendering), false]}) then {
        TRACE_1("Player Change (showHUD false)",_unit);
        ["captive", [false, false, false, false, false, false, false, false]] call EFUNC(common,showHud);
    } else {
        TRACE_1("Player Change (showHUD true)",_unit);
        ["captive", []] call EFUNC(common,showHud); //same as showHud true;
    };
};
