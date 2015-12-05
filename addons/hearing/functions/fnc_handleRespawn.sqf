/*
 * Author: PabstMirror
 * Reset earplugs on respawn, and then re-add if appropriate
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ACE_hearing_fnc_handleRespawn;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];
TRACE_2("params",_unit,typeOf _unit);

if (!local _unit) exitWith {}; //XEH should only be called on local units

private _respawn = [0] call BIS_fnc_missionRespawnType;

//if respawn is not Group or side:
if (_respawn <= 3) then {
    //Remove earplugs if they have them:
    if (_unit getVariable ["ACE_hasEarPlugsin", false]) then {
        TRACE_1("had EarPlugs in - removing",_unit);
        _unit setVariable ["ACE_hasEarPlugsin", false, true];
    };
};

//Re-add if they need them:
[_unit] call FUNC(addEarPlugs);
