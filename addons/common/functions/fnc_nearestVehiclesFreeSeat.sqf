#include "script_component.hpp"
/*
 * Author: 654wak654
 * Returns a list of vehicles near given unit that the unit can be a passenger in.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Distance <NUMBER><OPTIONAL>
 * 2: Restriceted to cargo only <BOOL><OPTIONAL>
 *
 * Return Value:
 * Nearest vehicles with a free seat <ARRAY>
 *
 * Example:
 * [cursorObject] call ace_common_fnc_nearestVehiclesFreeSeat
 *
 * Public: Yes
 */

params ["_unit", ["_distance", 10], ["_cargoOnly", false]];

private _nearVehicles = nearestObjects [_unit, ["Car", "Air", "Tank", "Ship_F", "Pod_Heli_Transport_04_crewed_base_F"], _distance];
_nearVehicles select {
    // Filter cargo seats that will eject unconscious units (e.g. quad bike)
    private _canSitInCargo = (!(_unit getVariable ['ACE_isUnconscious', false])) || {(getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "ejectDeadCargo")) == 0};
    ((fullCrew [_x, "", true]) findIf {
        _x params ["_body", "_role", "_cargoIndex"];
        (isNull _body) // seat empty
        && {_role != "DRIVER"} // not driver seat
        && {_canSitInCargo || {_cargoIndex == -1}} // won't be ejected (uncon)
        && {(!_cargoOnly) || {_cargoIndex != -1}} // not restricted (captive)
    }) > -1
}
