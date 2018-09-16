/*
 * Author: Grey-Soldierman
 *
 * Prepares a mortar round with a particular charge using a timer
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: timeToPrep <NUMBER>
 * 2: args <ARRAY>
 * 3: oldMagazine <STRING>
 * 4: newMagazine <STRING>
 * 5: chargeClass <STRING>
 * 6: chargesRequired <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player,5,'ACE_1Rnd_82mm_Mo_HE','ACE_1Rnd_82mm_Mo_HE_Charge_3','ACE_Propelling_Charge',1] call ace_mk6mortar_fnc_prepRound
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit","_timeToPrep","_oldMagazine","_newMagazine","_chargeClass","_chargesRequired"];

// Move player into animation if player is standing
if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary", 1] call EFUNC(common,doAnimation);
};

[_timeToPrep, [_unit,_oldMagazine,_newMagazine,_chargeClass,_chargesRequired], {(_this select 0) call FUNC(prepRound);}, {}, localize LSTRING(loadingMortar)] call EFUNC(common,progressBar);
