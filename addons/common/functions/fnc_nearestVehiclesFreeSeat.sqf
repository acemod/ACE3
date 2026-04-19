#include "..\script_component.hpp"
/*
 * Author: 654wak654
 * Returns a list of vehicles near given unit that the unit can be a passenger in.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Distance <NUMBER> (default: 10)
 * 2: Restricted to cargo only <BOOL> (default: false)
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
    private _vehicle = _x;
    alive _vehicle
    && {locked _vehicle < 2}
    && {simulationEnabled _vehicle}
    && {vectorUp _vehicle select 2 > 0.3} // flipped vehicles
    && {
        // Filter cargo seats that will eject unconscious units (e.g. quad bike)
        private _canSitInCargo = (_unit call EFUNC(common,isAwake)) || {(getNumber (configOf _vehicle >> "ejectDeadCargo")) == 0};
        ((fullCrew [_vehicle, "", true]) findIf {
            _x params ["_body", "_role", "_cargoIndex"];
            (isNull _body) // seat empty
            && {
                _role != "DRIVER" // not driver seat
                || {!alive _unit} // dead unit in medical
                || {_unit isKindOf QEGVAR(dragging,clone)} // dead unit in dragging
            }
            && {_canSitInCargo || {_cargoIndex == -1}} // won't be ejected (uncon)
            && {(!_cargoOnly) || {_cargoIndex != -1}} // not restricted (captive)
        }) > -1
    }
}
