#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Collect the temperature of all the spare barrels a unit has and send a hint
 * to a client. Runs on the server.
 *
 * Arguments:
 * 0: Target unit of the hint <OBJECT>
 * 1: Unit that has the spare barrels <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, "bob"] call ace_overheating_fnc_sendSpareBarrelsTemperaturesHint
 *
 *
 * Public: No
 */

params ["_player","_unit"];

// Find all spare barrel the player has
TRACE_2("sendSpareBarrelsTemperatureHunt",_player,_unit);
//Get the weapon of the target unit
private _weapon = currentWeapon _player;
//Get the classname of the spare barrel of that weapon
private _weaponBarrelClass = getText (configFile >> 'CfgWeapons' >> _weapon >> QGVAR(barrelClassname));
//If the weapon has no defined classname then use the ACE one
if(_weaponBarrelClass == "") then {
    _weaponBarrelClass = "ACE_SpareBarrel";
};
private _allBarrels = [_unit, _weaponBarrelClass] call CBA_fnc_getMagazineIndex;
TRACE_1("_allBarrels",_allBarrels);
if ((count _allBarrels) < 1) exitWith {};

// Determine the temp of each barrel
private _temps = [];
{
    private _temp = 0;
    if ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashHasKey) then {
        _temp = ([GVAR(storedSpareBarrels), _x] call CBA_fnc_hashGet) select 0;
    };
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
private _size = 1.0;
if (_countCool > 0) then {
    _output pushBack _countCool;
    _output pushBack LSTRING(BarrelCool);
    _output pushBack "<br/>";
    _size = _size + 0.5;
};
if (_countWarm > 0) then {
    _output pushBack _countWarm;
    _output pushBack LSTRING(BarrelWarm);
    _output pushBack "<br/>";
    _size = _size + 0.5;
};
if (_countHot > 0) then {
    _output pushBack _countHot;
    _output pushBack LSTRING(BarrelHot);
    _output pushBack "<br/>";
    _size = _size + 0.5;
};
if (_countVeryHot > 0) then {
    _output pushBack _countVeryHot;
    _output pushBack LSTRING(BarrelVeryHot);
    _output pushBack "<br/>";
    _size = _size + 0.5;
};
if (_countExtremelyHot > 0) then {
    _output pushBack _countExtremelyHot;
    _output pushBack LSTRING(BarrelExtremelyHot);
    _size = _size + 0.5;
};

TRACE_1("_output",_output);
[QEGVAR(common,displayTextStructured), [_output, _size, _player], [_player]] call CBA_fnc_targetEvent;
