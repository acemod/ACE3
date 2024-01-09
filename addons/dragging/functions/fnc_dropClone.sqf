#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut, johnb43
 * Drops a draggable / carryable clone of a dead unit.
 *
 * Arguments:
 * 0: Unit dragging / carrying <OBJECT>
 * 1: Clone <OBJECT>
 * 2: If unit is in building <BOOL>
 *
 * Return Value:
 * Original unit <OBJECT>
 *
 * Example:
 * [player, cursorObject, false] call ace_dragging_fnc_dropClone;
 *
 * Public: No
 */

params ["_unit", "_clone", "_inBuilding"];

(_clone getVariable [QGVAR(original), []]) params [
    ["_target", objNull],
    ["_isInRemainsCollector", true],
    ["_isObjectHidden", false],
    ["_simulationEnabled", true]
];

// Check if unit was deleted
if (!isNull _target) then {
    // Turn on PhysX so that the corpse doesn't desync when moved
    [QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

    private _posASL = getPosASL _clone;

    if (_inBuilding) then {
        _posASL = _posASL vectorAdd [0, 0, 0.05];
    };

    [{
        params ["_target", "", "", "", "_posASL", "_dir"];

        // Make sure PhysX is on
        [QEGVAR(common,awake), [_target, true]] call CBA_fnc_globalEvent;

        // Set the unit's direction
        [QEGVAR(common,setDir), [_target, _dir], _target] call CBA_fnc_targetEvent;

        // Bring unit back to clone's position
        _target setPosASL _posASL;

        [{
            params ["_target", "_clone", "_isObjectHidden", "_simulationEnabled"];

            if (!_isObjectHidden) then {
                [QEGVAR(common,hideObjectGlobal), [_target, false]] call CBA_fnc_serverEvent;
            };

            if (_simulationEnabled) then {
                [QEGVAR(common,enableSimulationGlobal), [_target, true]] call CBA_fnc_serverEvent;
            };

            deleteVehicle _clone;
        }, _this, 0.25] call CBA_fnc_waitAndExecute;
    }, [_target, _clone, _isObjectHidden, _simulationEnabled, _posASL, getDir _unit + 180], 0.25] call CBA_fnc_waitAndExecute;

    if (_isInRemainsCollector) then {
        addToRemainsCollector [_target];
    };
};

// Detach first to prevent objNull in attachedObjects
detach _clone;
deleteVehicle _clone;

_target
