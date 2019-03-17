#include "script_component.hpp"
/*
 * Author: Glowbal
 * Action for loading an unconscious or dead unit in the nearest vehicle, or _vehicle if given.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: The vehicle <OBJECT> (default: objNull)
 *
 * Return Value:
 * Vehicle they are loaded into (objNull on failure) <OBJECT>
 *
 * Example:
 * [bob, kevin] call ACE_medical_treatment_treatment_fnc_actionLoadUnit
 *
 * Public: No
 */

params ["_caller", "_target", ["_vehicle", objNull]];

if ([_target] call EFUNC(common,isAwake)) exitWith {
    [QEGVAR(common,displayTextStructured), [[ELSTRING(medical,CanNotLoaded), _target call EFUNC(common,getName)], 1.5, _caller], _caller] call CBA_fnc_targetEvent;
};

if ([_target] call EFUNC(medical_status,isBeingCarried)) then {
    [_caller, _target] call EFUNC(dragging,dropObject_carry);
};

if ([_target] call EFUNC(medical_status,isBeingDragged)) then {
    [_caller, _target] call EFUNC(dragging,dropObject);
};

private _vehicle = [_caller, _target, _vehicle] call EFUNC(common,loadPerson);
if (!isNull _vehicle) then {
    private _hint = LSTRING(loadedInto);
    private _itemName = [_target, false, true] call EFUNC(common,getName);
    private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
    [[_hint, _itemName, _vehicleName], 3.0] call EFUNC(common,displayTextStructured);
};

_vehicle
