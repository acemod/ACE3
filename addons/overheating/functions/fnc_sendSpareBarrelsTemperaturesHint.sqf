#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Collect the temperature of all the spare barrels a unit has and send a hint
 * to a client. Runs on the server.
 *
 * Arguments:
 * 0: Target unit of the hint <OBJECT>
 * 1: Unit that has the spare barrels <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, player] call ace_overheating_fnc_sendSpareBarrelsTemperaturesHint
 *
 *
 * Public: No
 */

params ["_player", "_unit"];

// Find all spare barrel the player has
TRACE_2("sendSpareBarrelsTemperatureHunt",_player,_unit);
//Get the weapon of the target unit
private _weapon = currentWeapon _player;
//Get the classname of the spare barrel of that weapon
private _weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(barrelClassname));
//If the weapon has no defined classname then use the ACE one
if (_weaponBarrelClass == "") then {
    _weaponBarrelClass = "ACE_SpareBarrel";
};
private _allBarrels = [_unit, _weaponBarrelClass] call CBA_fnc_getMagazineIndex;
TRACE_1("_allBarrels",_allBarrels);
if (_allBarrels isEqualTo []) exitWith {};

// Determine the temp of each barrel
private _temps = [];
{
    private _temp = GVAR(storedSpareBarrels) getOrDefault [_x, [0]] select 0;
    _temps pushBack _temp;
} forEach _allBarrels;
TRACE_1("_temps",_temps);

// Count cool
private _countCool = {_x < 20} count _temps;
private _countWarm = {(_x >= 20) && (_x < 100)} count _temps;
private _countHot = {(_x >= 100) && (_x < 200)} count _temps;
private _countVeryHot = {(_x >= 200) && (_x < 600)} count _temps;
private _countExtremelyHot = {_x >= 600} count _temps;
private _output = ["%1 %2%3%4 %5%6%7 %8%9%10 %11%12%13 %14"];
private _emptyLine = ["", "", ""];

_output append ([_emptyLine, [_countCool, LSTRING(BarrelCool), "<br/>"]] select (_countCool > 0));
_output append ([_emptyLine, [_countWarm, LSTRING(BarrelWarm), "<br/>"]] select (_countWarm > 0));
_output append ([_emptyLine, [_countHot, LSTRING(BarrelHot), "<br/>"]] select (_countHot > 0));
_output append ([_emptyLine, [_countVeryHot, LSTRING(BarrelVeryHot), "<br/>"]] select (_countVeryHot > 0));
_output append ([_emptyLine, [_countExtremelyHot, LSTRING(BarrelExtremelyHot), "<br/>"]] select (_countExtremelyHot > 0));

private _size = 1 + 0.5 * ({_x isEqualTo "<br/>"} count _output);

TRACE_1("_output",_output);
[QEGVAR(common,displayTextStructured), [_output, _size, _player], [_player]] call CBA_fnc_targetEvent;
