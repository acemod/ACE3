#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Returns unit occupying specified vehicle seat.
 * Unit list is cached for 1 second.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Seat (Cargo Index or Turret Path) <NUMBER or ARRAY>
 *
 * Return Value:
 * Unit or objNull if seat is empty <OBJECT>
 *
 * Example:
 * [cursorObject, []] call ace_quickmount_fnc_getSeatUnit
 *
 * Public: No
 */

params ["_vehicle", "_seat"];

private _seatUnits = [_this, {
    params ["_vehicle", "_seat"];
    createHashMapFromArray (fullCrew _vehicle apply {
        _x params ["_unit", "_role", "_cargoIndex", "_turretPath"];
        private _seatId = [_turretPath, _cargoIndex] select (_role isEqualTo "cargo");
        [_seatId, _unit]
    })
}, _vehicle, QGVAR(seatUnits), 1] call EFUNC(common,cachedCall);

_seatUnits getOrDefault [_seat, objNull]
