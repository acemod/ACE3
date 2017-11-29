/*
 * Author: commy2
 * Unit claims the ownership over an object. This is used to prevent multiple players from draging the same ammo box or using up the same wheel when repairing etc.
 *
 * Arguments:
 * 0: Unit that claims another object. ObjNull to remove claim. <OBJECT>
 * 1: The object that gets claimed. <OBJECT>
 * 2: Lock the claimed object aswell? (optional: false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, flag, true] call ace_common_fnc_claim
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target", ["_lockTarget", false]];

private _owner = _target getVariable [QGVAR(owner), objNull];

if (!isNull _owner && {!isNull _unit} && {_unit != _owner}) then {
    ERROR("Claiming already owned object.");
};

// transfer this immediately
_target setVariable [QGVAR(owner), _unit, true];

// lock target object
if (_lockTarget) then {
    private _canBeDisassembled = !([] isEqualTo getArray (_target call CBA_fnc_getObjectConfig >> "assembleInfo" >> "dissasembleTo"));
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

/*
systemChat str locked _target;
systemChat str (_target getVariable [QGVAR(lockStatus), locked _target]);
*/
