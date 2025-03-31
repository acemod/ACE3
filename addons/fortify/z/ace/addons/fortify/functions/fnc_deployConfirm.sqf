#include "script_component.hpp"
/*
 * Author: Kingsley
 * Confirms the deployment.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Fortify Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, wall] call ace_fortify_fnc_deployConfirm
 *
 * Public: No
 */

params ["_unit", "_object","_cost","_time"];
TRACE_2("deployConfirm",_unit,_object);
_timeAdjusted = _time; 


// Check if Specialist
if ([_unit] call ace_fortify_fnc_isSpecialist) then {
    _timeAdjusted = round (_time / 2);
};

// Play Animation
if (_timeAdjusted == 20) then {
    [_unit, "Acts_carFixingWheel", 1] call ace_common_fnc_doAnimation;
} else {
    if (_timeAdjusted > 3) then {
        [_unit, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
    } else {
        [_unit, "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
    };
};

// ACE Progress Bar
[_timeAdjusted, _this, {
    // Parameter Init
    _args = _this select 0;
    _args params ["_unit", "_object","_cost","_time"];

    // Update Cost
    if (_cost == -1) then {
        _unit removeItem "ACE_Fortication_Material";
    } else {
        private _remain = ace_trenches_trenchSupplies - _cost;
        if (_remain < 0) exitWith {hint "Not enough Resources"};
        ace_trenches_trenchSupplies = _remain;
        publicVariable "ace_trenches_trenchSupplies";
        private _str = format ["%1 Resources left", _remain];
        [_str, 1.5] call ace_common_fnc_displayTextStructured;
    };

    private _typeOf = typeOf _object;
    private _posASL = getPosASL _object;
    private _vectorUp = vectorUp _object;
    private _vectorDir = vectorDir _object;

    deleteVehicle _object;

    private _newObject = _typeOf createVehicle _posASL;
    _newObject setPosASL _posASL;
    _newObject setVectorDirAndUp [_vectorDir, _vectorUp];
    _newObject setVariable ["ace_fortify_CTIME",CBA_missionTime,true];
    
    // Server will use this event to run the jip compatible QGVAR(addActionToObject) event
    [QGVAR(objectPlaced), [_unit, _newObject, _cost, _time]] call CBA_fnc_globalEvent;
/*
    if (cba_events_control) then {
        // Re-run if ctrl key held
        [_unit, _unit, [_side, _typeOf, [GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)]]] call DFUNC(deployObject);
    };*/
},{["Canceled", 1.5] call ace_common_fnc_displayTextStructured; deleteVehicle (_this select 0 select 1);}, "Constructing..."] call ace_common_fnc_progressBar;