#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Checks if Free Seats menu can be shown.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Args <ARRAY>
 *
 * Return Value:
 * Can show menu <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_quickmount_fnc_canShowFreeSeats
 *
 * Public: No
 */

params ["_vehicle", "_unit", "_args"];

private _isInVehicle = _unit in _vehicle;

GVAR(enabled)
&& {
    GVAR(enableMenu) == 3
    || {_isInVehicle && {GVAR(enableMenu) == 2}}
    || {!_isInVehicle && {GVAR(enableMenu) == 1}}
}
&& {alive _vehicle}
&& {2 > locked _vehicle}
&& {isNull getConnectedUAVUnit _unit}
&& {simulationEnabled _vehicle}
&& {
    [_unit, _vehicle] call EFUNC(interaction,canInteractWithVehicleCrew)
}
&& {
    0.3 < vectorUp _vehicle select 2 // moveIn* and GetIn* don't work for flipped vehicles
    || {_vehicle isKindOf "Air"} // except Air
}
&& {
    _isInVehicle
    || {
        // because Get In action has its own statement
        // we have to cache subactions in args and reuse them in insertChildren code
        private _subActions = call FUNC(addFreeSeatsActions);
        _args set [0, _subActions];
        [] isNotEqualTo _subActions
    }
}
