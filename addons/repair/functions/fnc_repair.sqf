/*
 * Author: Glowbal, KoffeinFlummi
 * Starts the repair process
 *
 * Arguments:
 * 0: The engineer <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: repair classname <STRING>
 *
 * Return Value:
 * Succesful repair started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_caller", "_target", "_hitPoint", "_className"];
TRACE_4("params",_calller,_target,_hitPoint,_className);

private ["_config", "_engineerRequired", "_items", "_locations", "_return", "_condition", "_vehicleStateCondition"];

_config = (ConfigFile >> "ACE_Repair" >> "Actions" >> _className);
if !(isClass _config) exitwith {false}; // or go for a default?

_engineerRequired = if (isNumber (_config >> "requiredEngineer")) then {
    getNumber (_config >> "requiredEngineer");
} else {
    // Check for required class
    if (isText (_config >> "requiredEngineer")) exitwith {
        missionNamespace getvariable [(getText (_config >> "requiredEngineer")), 0];
    };
    0;
};
if !([_caller, _engineerRequired] call FUNC(isEngineer)) exitwith {false};
if (isEngineOn _target) exitwith {false};
_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _items] call FUNC(hasItems))}) exitwith {false};

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
        _return = [_caller, _target, _hitPoint, _className] call _condition;
    };
};
if (!_return) exitwith {false};

_vehicleStateCondition = if (isText(_config >> "vehicleStateCondition")) then {
    missionNamespace getvariable [getText(_config >> "vehicleStateCondition"), 0]
} else {
    getNumber(_config >> "vehicleStateCondition")
};
// if (_vehicleStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitwith {false};

_locations = getArray (_config >> "repairLocations");
if ("All" in _locations) exitwith {true};

private ["_repairFacility", "_repairVeh"];
_repairFacility = {([_caller] call FUNC(isInRepairFacility)) || ([_target] call FUNC(isInRepairFacility))};
_repairVeh = {([_caller] call FUNC(isNearRepairVehicle)) || ([_target] call FUNC(isNearRepairVehicle))};

{
    if (_x == "field") exitwith {_return = true;};
    if (_x == "RepairFacility" && _repairFacility) exitwith {_return = true;};
    if (_x == "RepairVehicle" && _repairVeh) exitwith {_return = true;};
    if !(isnil _x) exitwith {
        private "_val";
        _val = missionNamespace getvariable _x;
        if (typeName _val == "SCALAR") then {
            _return = switch (_val) do {
                case 0: {true};
                case 1: _repairVeh;
                case 2: _repairFacility;
                case 3: {{call _repairFacility || call _repairVeh}};
            };
            _return = call _return;
        };
    };
} forEach _locations;

if !(_return && alive _target) exitwith {false};

_consumeItems = if (isNumber (_config >> "itemConsumed")) then {
    getNumber (_config >> "itemConsumed");
} else {
    // Check for required class
    if (isText (_config >> "itemConsumed")) exitwith {
        missionNamespace getvariable [(getText (_config >> "itemConsumed")), 0];
    };
    0;
};

_usersOfItems = [];
if (_consumeItems > 0) then {
    _usersOfItems = ([_caller, _target, _items] call FUNC(useItems)) select 1;
};

// Parse the config for the progress callback
_callbackProgress = getText (_config >> "callbackProgress");
if (_callbackProgress == "") then {
    _callbackProgress = "true";
};
if (isNil _callbackProgress) then {
    _callbackProgress = compile _callbackProgress;
} else {
    _callbackProgress = missionNamespace getvariable _callbackProgress;
};


// Player Animation
_callerAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _caller == "PRONE");
_caller setvariable [QGVAR(selectedWeaponOnrepair), currentWeapon _caller];

// Cannot use secondairy weapon for animation
if (currentWeapon _caller == secondaryWeapon _caller) then {
    _caller selectWeapon (primaryWeapon _caller);
};

_wpn = ["non", "rfl", "pst"] select (1 + ([primaryWeapon _caller, handgunWeapon _caller] find (currentWeapon _caller)));
_callerAnim = [_callerAnim, "[wpn]", _wpn] call CBA_fnc_replace;
if (vehicle _caller == _caller && {_callerAnim != ""}) then {
    if (primaryWeapon _caller == "") then {
        _caller addWeapon "ACE_FakePrimaryWeapon";
    };
    if (currentWeapon _caller == "") then {
        _caller selectWeapon (primaryWeapon _caller); // unit always has a primary weapon here
    };

    if (stance _caller == "STAND") then {
        _caller setvariable [QGVAR(repairPrevAnimCaller), "amovpknlmstpsraswrfldnon"];
    } else {
        _caller setvariable [QGVAR(repairPrevAnimCaller), animationState _caller];
    };
    [_caller, _callerAnim] call EFUNC(common,doAnimation);
};

//Get repair time
_repairTime = if (isNumber (_config >> "repairingTime")) then {
    getNumber (_config >> "repairingTime");
} else {
    if (isText (_config >> "repairingTime")) exitwith {
        _repairTimeConfig = getText(_config >> "repairingTime");
        if (isnil _repairTimeConfig) then {
            _repairTimeConfig = compile _repairTimeConfig;
        } else {
            _repairTimeConfig = missionNamespace getvariable _repairTimeConfig;
        };
        if (typeName _repairTimeConfig == "SCALAR") exitwith {
            _repairTimeConfig;
        };
        [_caller, _target, _selectionName, _className] call _repairTimeConfig;
    };
    0;
};

private ["_text", "_processText"];
_processText = getText (_config >> "displayNameProgress");
_text = format ["STR_ACE_Repair_%1", _hitPoint];
if (isLocalized _text) then {
    _text = format [_processText, localize _text];
} else {
    _text = _processText;
};

// Start repair
[
    _repairTime,
    [_caller, _target, _hitPoint, _className, _items, _usersOfItems],
    DFUNC(repair_success),
    DFUNC(repair_failure),
    _text,
    _callbackProgress,
    []
] call EFUNC(common,progressBar);

// Display Icon
_iconDisplayed = getText (_config >> "actionIconPath");
if (_iconDisplayed != "") then {
    [QGVAR(repairActionIcon), true, _iconDisplayed, [1,1,1,1], getNumber(_config >> "actionIconDisplayTime")] call EFUNC(common,displayIcon);
};

// handle display of text/hints
_displayText = "";
if (_target != _caller) then {
    _displayText = getText(_config >> "displayTextOther");
} else {
    _displayText = getText(_config >> "displayTextSelf");
};

if (_displayText != "") then {
    ["displayTextStructured", [_caller], [[_displayText, [_caller] call EFUNC(common,getName), [_target] call EFUNC(common,getName)], 1.5, _caller]] call EFUNC(common,targetEvent);
};

true;
