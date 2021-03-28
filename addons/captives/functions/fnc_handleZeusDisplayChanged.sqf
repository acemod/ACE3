#include "script_component.hpp"
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
 * None
 *
 * Example:
 * [bob1, false] call ACE_captives_fnc_handleZeusDisplayChanged
 *
 * Public: No
 */

if ((ACE_player getVariable [QGVAR(isHandcuffed), false]) || {ACE_player getVariable [QGVAR(isSurrendering), false]}) then {
    TRACE_1("Player Change (showHUD false)",ACE_player);
    ["captive", [false, false, false, false, false, false, false, false, false, true]] call EFUNC(common,showHud);
} else {
    TRACE_1("Player Change (showHUD true)",ACE_player);
    ["captive", []] call EFUNC(common,showHud); //same as showHud true;
};
