/*
 * Author: Grey-Soldierman
 *
 * Prepares a mortar round with a particular charge using a timer
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: args <ARRAY>
 * 2: oldMagazine <STRING>
 * 3: newMagazine <STRING>
 * 4: chargeClass <STRING>
 * 5: chargesRequired <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player,'ACE_1Rnd_82mm_Mo_HE','ACE_1Rnd_82mm_Mo_HE_Charge_3','ACE_Propelling_Charge',1] call ace_mk6mortar_fnc_prepRoundTimer
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit","_oldMagazine","_newMagazine","_chargeClass","_chargesRequired"];

// Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

if !(isNil (_newMagazine)) exitWith {ERROR("New magazine classname required");};

_timeToPrep = configFile >> "CfgMagazines" >> _newMagazine >> QGVAR(timeToPrep);

// Default to 5 seconds if the magazine doesn't have a time to prep
if !(isNumber (_timeToPrep)) then {
    _timeToPrep = 5;
} else {
    _timeToPrep = getNumber(_timeToPrep);
};

[_timeToPrep, [_unit,_oldMagazine,_newMagazine,_chargeClass,_chargesRequired], {(_this select 0) call FUNC(prepRound);}, {}, localize LSTRING(prepRound)] call EFUNC(common,progressBar);
