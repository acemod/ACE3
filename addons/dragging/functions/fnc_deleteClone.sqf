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
 * [player, cursorObject, false] call ace_dragging_fnc_deleteClone;
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

// API
[QGVAR(cloneDeleted), [_clone, _target]] call CBA_fnc_localEvent;

// Check if unit was deleted
if (!isNull _target) then {
    private _posATL = getPosATL _clone;

    if (_inBuilding) then {
        _posATL = _posATL vectorAdd [0, 0, 0.05];
    };

    // Make sure position isn't underground
    if (_posATL select 2 < 0.05) then {
        _posATL set [2, 0.05];
    };

    // Move the unit globally (important, as it desyncs the corpse position otherwise)
    [QGVAR(moveCorpse), [_target, getDir _unit + 180, _posATL]] call CBA_fnc_globalEvent;

    // Unhide unit
    if (!_isObjectHidden) then {
        [QEGVAR(common,hideObjectGlobal), [_target, false]] call CBA_fnc_serverEvent;
    };

    // Enable simulation again
    if (_simulationEnabled) then {
        [QEGVAR(common,enableSimulationGlobal), [_target, true]] call CBA_fnc_serverEvent;
    };

    // Detach first to prevent objNull in attachedObjects
    detach _clone;
    deleteVehicle _clone;

    // Get which curators had this object as editable
    if (["ace_zeus"] call EFUNC(common,isModLoaded)) then {
        private _objectCurators = _target getVariable [QGVAR(objectCurators), []];

        if (_objectCurators isEqualTo []) exitWith {};

        [QEGVAR(zeus,addObjects), [[_target], _objectCurators]] call CBA_fnc_serverEvent;
    };

    if (_isInRemainsCollector) then {
        addToRemainsCollector [_target];
    };
} else {
    // Detach first to prevent objNull in attachedObjects
    detach _clone;
    deleteVehicle _clone;
};

_target
