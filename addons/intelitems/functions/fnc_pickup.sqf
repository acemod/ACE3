#include "script_component.hpp"
/*
 * Author: PabstMirror, mharis001
 * Picks up an intel object by converting it into a unique magazine.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_intelitems_fnc_pickup
 *
 * Public: No
 */

params ["_object", "_player"];

private _magazineClass = getText (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(magazine));
private _index = _object getVariable [QGVAR(index), -1];

// Add magazine to inventory and get its id
private _magazinesBefore = [_player, _magazineClass] call CBA_fnc_getMagazineIndex;
_player addMagazine _magazineClass;
private _magazinesAfter = [_player, _magazineClass] call CBA_fnc_getMagazineIndex;

private _magazineId = _magazinesAfter - _magazinesBefore;
if (_magazineId isEqualTo []) exitWith {};

_magazineId = _magazineId select 0;

// Delete object as it now exists as a magazine
deleteVehicle _object;

if (_index == -1) then {
    // Need new intel index from server
    [QGVAR(handleMagIndex), _magazineId] call CBA_fnc_serverEvent;
} else {
    // Can simply broadcast index for magazine id
    GVAR(intelMap) setVariable [_magazineId, _index, true];
};
