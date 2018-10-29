#include "script_component.hpp"
/*
 * Author: Dystopian
 * Check if Eject action can be shown.
 *
 * Arguments:
 * 0: Unit who calls action <OBJECT>
 * 1: Vehicle which action is attached to <OBJECT>
 *
 * Return Value:
 * Can show <BOOL>
 *
 * Example:
 * [player, vehicle player] call ace_aircraft_fnc_canShowEject
 *
 * Public: No
 */

#define FULLCREW_UNIT       0
#define FULLCREW_ROLE       1
#define FULLCREW_TURRETPATH 3

params ["_unit", "_vehicle"];

_vehicle == vehicle _unit
&& {2 > locked _vehicle}
&& {
    private _ejectVarName = "";
    {
        if (_unit == _x select FULLCREW_UNIT) exitWith {
            _ejectVarName = format [QGVAR(ejectAction_%1_%2), _x select FULLCREW_ROLE, _x select FULLCREW_TURRETPATH];
        };
    } count fullCrew _vehicle;
    _vehicle getVariable [_ejectVarName, false]
}
