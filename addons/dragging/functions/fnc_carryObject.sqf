#include "..\script_component.hpp"
/*
 * Author: commy2
 * Handles attaching and setting up a carried object. Called from ace_dragging_fnc_startCarryPFH.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_carryObject;
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// Get attachTo offset and direction
private _position = _target getVariable [QGVAR(carryPosition), [0, 0, 0]];
private _direction = _target getVariable [QGVAR(carryDirection), 0];

// Handle objects vs. persons
if (_target isKindOf "CAManBase") then {
    [_unit, "AcinPercMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    [_target, "AinjPfalMstpSnonWnonDf_carried_dead", 2] call EFUNC(common,doAnimation);

    // Attach person
    _target attachTo [_unit, _position, "LeftShoulder"];
} else {
    // Add height offset of model
    private _offset = ((_target modelToWorldVisual [0, 0, 0]) select 2) - ((_unit modelToWorldVisual [0, 0, 0]) select 2);

    _position = _position vectorAdd [0, 0, _offset];

    // Attach object
    _target attachTo [_unit, _position];
};

[QEGVAR(common,setDir), [_target, _direction], _target] call CBA_fnc_targetEvent;

_unit setVariable [QGVAR(isCarrying), true, true];
_unit setVariable [QGVAR(carriedObject), _target, true];

// Add drop action
_unit setVariable [QGVAR(releaseActionID), [
    _unit, "DefaultAction",
    {!isNull ((_this select 0) getVariable [QGVAR(carriedObject), objNull])},
    {[_this select 0, (_this select 0) getVariable [QGVAR(carriedObject), objNull], true] call FUNC(dropObject_carry)}
] call EFUNC(common,addActionEventHandler)];

// Add anim changed EH
[_unit, "AnimChanged", FUNC(handleAnimChanged), [_unit]] call CBA_fnc_addBISEventHandler;

// Prevent UAVs from firing
private _UAVCrew = _target call EFUNC(common,getVehicleUAVCrew);

if (_UAVCrew isNotEqualTo []) then {
    {
        _target deleteVehicleCrew _x;
    } forEach _UAVCrew;

    _target setVariable [QGVAR(isUAV), true, true];
};

// Check everything
[FUNC(carryObjectPFH), 0.5, [_unit, _target, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

// Reset current dragging height
GVAR(currentHeightChange) = 0;
