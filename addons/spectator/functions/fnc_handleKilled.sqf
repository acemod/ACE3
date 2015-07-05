/*
 * Author: SilentSpike
 * Cache necessary details and initalize spectator on death
 *
 * Arguments:
 * 0: Corpse <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit","_killer","_delay"];
_unit = _this select 0;
_killer = _this select 1;

//Cache resettable info if player died while not already a spectator
if !(_unit getVariable [QGVAR(isSpectator),false]) then {
    GVAR(cachedGroup) = group _unit;
    GVAR(cachedSide) = side GVAR(cachedGroup);
};

[_unit] joinSilent grpNull;
if (["ace_hearing"] call EFUNC(common,isModLoaded)) then {EGVAR(hearing,disableVolumeUpdate) = true};
_delay = getNumber (missionConfigFile >> "respawnDelay");
_delay fadeSound 0;
999999 cutText ["", "BLACK", _delay];
