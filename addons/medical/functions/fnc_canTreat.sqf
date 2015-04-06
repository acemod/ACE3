/*
 * Author: Glowbal
 * Check if the treatment action can be performed.
 *
 * Arguments:
 * 0: The caller <OBJECT>
 * 1: The target <OBJECT>
 * 2: Selection name <STRING>
 * 3: ACE_Medical_Treatments Classname <STRING>
 *
 * ReturnValue:
 * Can Treat <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_config", "_availableLevels", "_medicRequired", "_items", "_locations", "_return", "_condition"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;

if !(_target isKindOf "CAManBase") exitWith {false};

_config = (ConfigFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level)>=2) then {
    _config = (ConfigFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
};
if !(isClass _config) exitwith {false};

_medicRequired = if (isNumber (_config >> "requiredMedic")) then {
    getNumber (_config >> "requiredMedic");
} else {
    // Check for required class
    if (isText (_config >> "requiredMedic")) exitwith {
        missionNamespace getvariable [(getText (_config >> "requiredMedic")), 0];
    };
    0;
};
if !([_caller, _medicRequired] call FUNC(isMedic)) exitwith {false};

_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitwith {false};

_locations = getArray (_config >> "treatmentLocations");

_return = true;
if (getText (_config >> "condition") != "") then {
    _condition = getText (_config >> "condition");
    if (isnil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getvariable _condition;
    };
    if (typeName _condition == "BOOL") then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _selectionName, _className] call _condition;
    };
};
if (!_return) exitwith {false};

if ("All" in _locations) exitwith {true};

{
    if (_x == "field") exitwith {_return = true;};
    if (_x == "MedicalFacility" && {[_caller, _target] call FUNC(inMedicalFacility)}) exitwith {_return = true;};
    if (_x == "MedicalVehicle" && {[_caller, _target] call FUNC(inMedicalVehicle)}) exitwith {_return = true;};
    if !(isnil _x) exitwith {
        private "_val";
        _val = missionNamespace getvariable _x;
        if (typeName _val == "SCALAR") then {
            _return = switch (_val) {
                case 0: {true};
                case 1: {[_caller, _target] call FUNC(inMedicalVehicle)};
                case 2: {[_caller, _target] call FUNC(inMedicalFacility)};
                case 3: {[_caller, _target] call FUNC(inMedicalVehicle) || [_caller, _target] call FUNC(inMedicalFacility)};
            };
        };
    };
}foreach _locations;

_return;
