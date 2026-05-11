#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Checks if Free Seats menu can be shown.
 * Result is cached for 1 second for reuse in several visible ATM actions.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Args <ARRAY>
 * 3: Use cache <BOOL> (default: true)
 *
 * Return Value:
 * Can show menu <BOOL>
 *
 * Example:
 * [cursorObject, player] call ace_quickmount_fnc_canShowFreeSeats
 *
 * Public: No
 */

params ["_vehicle", "_unit", ["_args", []], ["_useCache", true]];

private _isInVehicle = _unit in _vehicle;

// function is called by multiple actions and MainAction
if (!_isInVehicle && {_useCache}) exitWith {
    _this set [3, false];
    [_this, LINKFUNC(canShowFreeSeats), _vehicle, QGVAR(canShowFreeSeats), 1] call EFUNC(common,cachedCall) // return
};

TRACE_6("canShowFreeSeats",_vehicle,typeOf _vehicle,_unit,_isInVehicle,_args,_useCache);

GVAR(enabled)
&& {
    GVAR(enableMenu) == 3
    || {_isInVehicle && {GVAR(enableMenu) == 2}}
    || {!_isInVehicle && {GVAR(enableMenu) == 1}}
}
&& {alive _vehicle}
&& {locked _vehicle < 2}
&& {isNull getConnectedUAVUnit _unit}
&& {simulationEnabled _vehicle}
&& {[_unit, _vehicle] call EFUNC(interaction,canInteractWithVehicleCrew)}
&& {
    vectorUp _vehicle select 2 > 0.3 // moveIn* and GetIn* don't work for flipped vehicles
    || {_vehicle isKindOf "Air"} // except Air
}
&& {
    _isInVehicle
    || {typeOf _vehicle in GVAR(initializedVehicleClasses)}
    || {
        // init vehicle actions here to skip useless checks on clients with disabled quickmount
        GVAR(initializedVehicleClasses) pushBack typeOf _vehicle;
        _vehicle call FUNC(addGetInActions);
        true
    }
}
