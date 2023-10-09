#include "..\script_component.hpp"
/*
 * Author: mrschick, johnb43
 * Puts a blindfold on a captive unit if the player has a blindfold in their inventory.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Put on (true) or take off (false) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, true] call ace_captives_fnc_doBlindfoldCaptive
 *
 * Public: No
 */

params ["_unit", "_target", "_state"];

private _dropGoggles = false;
private _previousGoggles = "";

if (_state) then { // Blindfold target
    // Check if _unit has a blindfold in its inventory, abort otherwise.
    private _carriedBlindfoldIdx = GVAR(blindfolds) findAny (_unit call EFUNC(common,uniqueItems));
    if (_carriedBlindfoldIdx == -1) exitWith { ERROR("no blindfold"); };

    private _blindfold = GVAR(blindfolds) select _carriedBlindfoldIdx;
    _unit removeItem _blindfold;

    // Remove target's goggles if it is wearing any and move them to unit's or target's inventory (if they can hold them)
    _previousGoggles = goggles _target;
    if (_previousGoggles != "") then {
        if ([_unit, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
            removeGoggles _target;
            _unit addItem _previousGoggles;
        };
        if ([_target, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
            removeGoggles _target;
            _target addItem _previousGoggles;
        };
        // If the target's goggles can fit in neither unit's nor target's inventory, drop them on the ground
        _dropGoggles = true;
    };

    _target addGoggles _blindfold;
} else { // Remove blindfold from target
    _previousGoggles = goggles _target;

    // Abort if already not wearing a blindfold
    if !(_previousGoggles in GVAR(blindfolds)) exitWith { ERROR("no blindfold"); };

    if ([_unit, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
        removeGoggles _target;
        _unit addItem _previousGoggles;
    };
    if ([_target, _previousGoggles] call CBA_fnc_canAddItem) exitWith {
        removeGoggles _target;
        _target addItem _previousGoggles;
    };
    // If the target's blindfold can fit in neither unit's nor target's inventory, drop it on the ground
    _dropGoggles = true;

    removeGoggles _target;
};

// Handle for things that need to be dropped to the ground or in a vehicle inventory
if (_dropGoggles) then {
    private _weaponHolder = nearestObject [_target, "WeaponHolder"];
    // if _target is in a vehicle, use vehicle inventory as container
    private _inVehicle = !isNull objectParent _target;
    if (_inVehicle) then {
        _weaponHolder = objectParent _target;
    };

    if (!_inVehicle && {isNull _weaponHolder || {_target distance _weaponHolder > 2}}) then {
        _weaponHolder = createVehicle ["GroundWeaponHolder", [0, 0, 0], [], 0, "NONE"];
        _weaponHolder setPosASL getPosASL _target;
    };
    _weaponHolder addItemCargoGlobal [_previousGoggles, 1];
};
