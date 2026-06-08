#include "..\script_component.hpp"
/*
 * Author: commy2
 * Used to normalize depends hitpoints - sets their damage to damage of parent or parents.
 *
 * Arguments:
 * 0: Local Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle] call ace_repair_fnc_normalizeHitPoints
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_2("params",_vehicle,typeOf _vehicle);

// Can't execute all commands if the vehicle isn't local, exit if that's so
if !(local _vehicle) exitWith {ERROR_1("Vehicle Not Local %1",_vehicle);};

([_vehicle] call FUNC(getSelectionsToIgnore)) params ["", "_dependsIndexMap", "_complexDependsMap"];

{ // apply normalized damage to all depends hitpoints
    private _damage = _vehicle getHitIndex _y;
    if (_y == -1) then { // handle complex depends parents
        (_complexDependsMap get _x) params ["_parentHitPointScript", "_parentHitPointArray"];
        if (_parentHitPointScript == "total") then {
            _damage = damage _vehicle;
        } else {
            {
                _parentHitPointScript = [_parentHitPointScript, _x, str (_vehicle getHitPointDamage _x)] call CBA_fnc_replace;
            } forEach _parentHitPointArray;
            TRACE_1("complex script",_parentHitPointScript);
            _damage = call compile _parentHitPointScript;
        };
    };
    TRACE_2("setting depends hitpoint",_x,_damage);
    _vehicle setHitIndex [_x, _damage];
} forEach _dependsIndexMap;
