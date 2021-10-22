#include "script_component.hpp"
/*
 * Author: mharis001
 * Adds the given intel item (magazine) to the given unit.
 * Must be called on the server.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item <STRING>
 * 3: Data <STRING>
 *
 * Return Value:
 * Successful <BOOL>
 *
 * Example:
 * [_unit, "acex_intelitems_notepad", "Notes!"] call ace_intelitems_fnc_addIntel
 *
 * Public: Yes
 */

if (canSuspend) exitWith {
    [FUNC(addIntel), _this] call CBA_fnc_directCall;
};

params [["_unit", objNull, [objNull]], ["_item", "", [""]], ["_data", "", [""]]];

if (
    !isServer
    || {!(_unit isKindOf "CAManBase")}
    || {!(_unit canAdd _item)}
    || {getNumber (configFile >> "CfgMagazines" >> _item >> QGVAR(intel)) != 1}
) exitWith { ERROR_1("addIntel failed - %1",_this); false };

// Add the magazine item to the unit's inventory and get its id
private _magazinesBefore = [_unit, _item] call CBA_fnc_getMagazineIndex;
_unit addMagazine [_item, 1];
private _magazinesAfter = [_unit, _item] call CBA_fnc_getMagazineIndex;

private _magazineId = _magazinesAfter - _magazinesBefore;
if (_magazineId isEqualTo []) exitWith {false};

// Assign an intel index to the added magazine id and set its data
private _index = [_magazineId select 0] call FUNC(handleMagIndex);
SET_DATA(_index,_data);

true
