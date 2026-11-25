#include "..\script_component.hpp"
/*
 * Author: commy2
 * Recalculate the units loadCoef to emulate a mass added to uniform, vest or backpack.
 *
 * Arguments:
 * 0: The Unit (usually the player) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call ace_movement_fnc_handleVirtualMass
 *
 * Public: No
 */

params ["_unit"];

if (isNull _unit) exitWith {};

// add sum of virtual loads
private _virtualLoad = 0;

{
    _virtualLoad = _virtualLoad + (_x getVariable [QGVAR(vLoad), 0]);
} forEach [
    _unit,
    uniformContainer _unit,
    vestContainer _unit,
    backpackContainer _unit
];

_unit setVariable [QGVAR(totalLoad), (loadAbs _unit + _virtualLoad)];

// get absolute vanilla load
private _absLoad = getNumber (configFile >> "CfgInventoryGlobalVariable" >> "maxSoldierLoad");

// try to preserve other changes to the "LoadCoef" unitTrait
private _currentLoadCoef = _unit getUnitTrait "loadCoef";
private _loadCoef = _unit getVariable QGVAR(loadCoef);

// If something else changed the trait since it was last set here, use that as the new base value
if (isNil "_loadCoef" || {(_unit getVariable [QGVAR(lastLoadCoef), _currentLoadCoef]) != _currentLoadCoef}) then {
    _loadCoef = _currentLoadCoef;
    _unit setVariable [QGVAR(loadCoef), _loadCoef, true];
};

// calc. new "virtual" loadCoef
private _virtualLoadCoef = (1 + _virtualLoad / _absLoad) * _loadCoef;

_unit setUnitTrait ["loadCoef", _virtualLoadCoef];
_unit setVariable [QGVAR(lastLoadCoef), _unit getUnitTrait "loadCoef"];
