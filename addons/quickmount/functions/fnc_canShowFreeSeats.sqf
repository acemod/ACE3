#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Checks if Free Seats menu can be shown.
 * Result is cached for 1 second for reuse in several visible ATM actions.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Menu (true for menu, false for 3d interactions) <BOOL> (default: true)
 * 3: Use cache <BOOL> (default: true)
 *
 * Return Value:
 * Can show menu <BOOL>
 *
 * Example:
 * [cursorObject, player, true] call ace_quickmount_fnc_canShowFreeSeats
 *
 * Public: No
 */

params ["_vehicle", "_unit", ["_menu", true], ["_useCache", true]];

// function is called by multiple actions
if (!_menu && _useCache) exitWith {
    _this set [3, false];
    [_this, LINKFUNC(canShowFreeSeats), _vehicle, QGVAR(canShowFreeSeats_3d), 1] call EFUNC(common,cachedCall) // return
};

private _isInVehicle = _unit in _vehicle;

TRACE_6("canShowFreeSeats",_vehicle,typeOf _vehicle,_unit,_isInVehicle,_menu,_useCache);

GVAR(enabled)
&& {
    if (_menu) then {
        // add 3d interactions for vehicles now
        GVAR(initializedVehicleClasses) getOrDefaultCall [typeOf _vehicle, {
            _vehicle call FUNC(addGetInActions);
            true
        }, true];
        GVAR(enableMenu) == 3
        || {_isInVehicle && {GVAR(enableMenu) == 2}}
        || {!_isInVehicle && {GVAR(enableMenu) == 1}}
    } else {
        switch (GVAR(enable3d)) do {
            case 2: {true};
            case 1: {CBA_events_shift};
            default {false};
        }
    }
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
