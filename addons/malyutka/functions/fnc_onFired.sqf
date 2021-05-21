#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Handle the firing of a Malyutka
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_onFired
 *
 * Public: No
 */
params ["_unit", "", "", "", "", "", "_projectile"];
// projectile is a dummy to trigger this event handler
deleteVehicle _projectile;

private _controlBox = vehicle _unit;

private _currentAmmoState = (_controlBox getVariable QGVAR(vehicleAmmo));
_controlBox setVariable [QGVAR(vehicleAmmo), _currentAmmoState - 1, true];

private _statuses = _controlBox getVariable QGVAR(plugStatus);
private _availableIndex = _statuses findIf { (_x isNotEqualTo objNull) && (someAmmo _x) };
if (_availableIndex >= 0) then {
    private _malyutka = _statuses select _availableIndex;
    _malyutka animate ["missile_hide", 1];
    [_malyutka, QGVAR(9m14)] call BIS_fnc_fire;
} else {
    // how did we get here?
    private _statusesData = _statuses apply { (_x isNotEqualTo objNull) && (someAmmo _x) };
    WARNING_3("Managed to fire when no control boxes were ready to fire",_availableIndex,_statuses,_statusesData);
};

