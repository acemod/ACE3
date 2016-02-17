/*
 * Author: PabstMirror
 * Updates the hearing protection for player on earbuds/helmet change
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_hearing_fnc_updateHearingProtection
 *
 * Public: No
 */
#include "script_component.hpp"

TRACE_1("params",_this);

if (isNull ACE_player) exitWith {GVAR(damageCoefficent) = 0;};

GVAR(damageCoefficent) = if (ACE_player getVariable ["ACE_hasEarPlugsin", false]) then {0.25} else {1};
if (headgear ACE_player != "") then { //headgear hearing protection
    private _protection = (getNumber (configFile >> "CfgWeapons" >> (headgear ACE_player) >> QGVAR(protection))) min 1;
    if (_protection > 0) then {
        GVAR(damageCoefficent) = GVAR(damageCoefficent) * (1 - _protection);
    };
};
