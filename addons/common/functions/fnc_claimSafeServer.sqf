#include "script_component.hpp"
/*
 * Author: commy2, PabstMirror
 * Unit claims the ownership over an object. This is used to prevent multiple players from draging the same ammo box or using up the same wheel when repairing etc.
 * This function only runs on the server and handles the "ace_common_claimSafe" event. It provides a network safe way claiming objects as all claims are run on server.
 * Return event is passed [_unit, _target, _success] for new claims, no event on claim release
 *
 * Arguments:
 * 0: Unit that claims another object. ObjNull to remove claim. <OBJECT>
 * 1: The object that gets claimed. <OBJECT>
 * 2: Lock the claimed object aswell? (optional: false) <BOOL>
 * 3: Target event to trigger for calling machine (called where _unit is local) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, flag, true, "claimReturn"] call ace_common_fnc_claimSafeServer
 *
 * Public: Yes
 */

params ["_unit", "_target", ["_lockTarget", false], ["_returnEvent", ""]];

private _owner = _target getVariable [QGVAR(owner), objNull];
TRACE_4("claimSafeServer",_unit,_target,_returnEvent,_owner);

if (!isNull _owner && {!isNull _unit} && {_unit != _owner}) exitWith {
    WARNING_1("Claiming already owned object. - %1",_this);
    if (_returnEvent == "") exitWith {};
    [_returnEvent, [_unit, _target, false], _unit] call CBA_fnc_targetEvent;
};

// transfer this immediately
_target setVariable [QGVAR(owner), _unit, true];

// lock target object
if (_lockTarget) then {
    private _canBeDisassembled = !([] isEqualTo getArray (_target call CBA_fnc_getObjectConfig >> "assembleInfo" >> "dissasembleTo")) && { !([false, true] select (_target getVariable [QEGVAR(csw,assemblyMode), 0])) };
    if (!isNull _unit) then {
        [QGVAR(lockVehicle), _target, _target] call CBA_fnc_targetEvent;
        if (_canBeDisassembled) then {
            _target enableWeaponDisassembly false;
        };
    } else {
        [QGVAR(unlockVehicle), _target, _target] call CBA_fnc_targetEvent;
        if (_canBeDisassembled) then {
            _target enableWeaponDisassembly true;
        };
    };
};

if (!isNull _unit) then {
    TRACE_2("claim success",_unit,_target);
    if (_returnEvent == "") exitWith {};
    [_returnEvent, [_unit, _target, true], _unit] call CBA_fnc_targetEvent;
};
