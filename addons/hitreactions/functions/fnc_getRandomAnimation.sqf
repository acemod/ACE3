/*
 * Author: commy2
 * Get a random fall animation for the unit.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * Fall animation <STRING>
 *
 * Example:
 * [bob] call ACE_hitreactions_fnc_getRandomAnimation
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

private _weapon = currentWeapon _unit;

if (_weapon == "") exitWith {
    "AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon"
};

if (_weapon == primaryWeapon _unit) exitWith {
    if (_unit call EFUNC(common,isPlayer)) then {
        private _isRunning = _velocity > 4;

        [
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
            ["AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon_2", "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"] select _isRunning,
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft",
            "AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright"
        ] select floor random 4
    } else {
        "AmovPercMsprSlowWrfldf_AmovPpneMstpSrasWrflDnon"
    };
};

if (_weapon == handgunWeapon _unit) exitWith {
    if (_unit call EFUNC(common,isPlayer)) then {
        [
            "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
            "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon",
            "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft",
            "AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright"
        ] select floor random 4
    } else {
        "AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon"
    };
};

""
