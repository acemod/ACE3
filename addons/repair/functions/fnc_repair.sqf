/*
 * Author: Glowbal, KoffeinFlummi
 * Starts the repair process.
 *
 * Arguments:
 * 0: Unit that does the repairing <OBJECT>
 * 1: Vehicle to repair <OBJECT>
 * 2: Selected hitpoint or hitpointIndex <STRING>or<NUMBER>
 * 3: Repair Action Classname <STRING>
 *
 * Return Value:
 * Succesful Repair Started <BOOL>
 *
 * Example:
 * [unit, vehicle, "hitpoint", "classname"] call ace_repair_fnc_repair
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_caller", "_target", "_hitPoint", "_className"];
TRACE_4("params",_caller,_target,_hitPoint,_className);

private _config = (ConfigFile >> "ACE_Repair" >> "Actions" >> _className);
if !(isClass _config) exitWith {false}; // or go for a default?

private _engineerRequired = if (isNumber (_config >> "requiredEngineer")) then {
    getNumber (_config >> "requiredEngineer");
} else {
    // Check for required class
    if (isText (_config >> "requiredEngineer")) exitWith {
        missionNamespace getVariable [(getText (_config >> "requiredEngineer")), 0];
    };
    0;
};
if !([_caller, _engineerRequired] call FUNC(isEngineer)) exitWith {false};

if ((isEngineOn _target) && {GVAR(autoShutOffEngineWhenStartingRepair)}) then {
    [QEGVAR(common,engineOn), [_target, false], _target] call CBA_fnc_targetEvent;
};
if ((isEngineOn _target) && {!GVAR(autoShutOffEngineWhenStartingRepair)}) exitWith {
    [LSTRING(shutOffEngineWarning), 1.5, _caller] call EFUNC(common,displayTextStructured);
    false
};

//Items can be an array of required items or a string to a ACE_Setting array
private _items = if (isArray (_config >> "items")) then {
    getArray (_config >> "items");
} else {
    private _settingName = getText (_config >> "items");
    private _settingItemsArray = getArray (configFile >> "ACE_Settings" >> _settingName >> "_values");
    if ((isNil _settingName) || {(missionNamespace getVariable _settingName) >= (count _settingItemsArray)}) exitWith {
        ERROR("bad setting"); ["BAD"]
    };
    _settingItemsArray select (missionNamespace getVariable _settingName);
};
if (count _items > 0 && {!([_caller, _items] call FUNC(hasItems))}) exitWith {false};

private _return = true;
if (getText (_config >> "condition") != "") then {
    private _condition = getText (_config >> "condition");
    if (isNil _condition) then {
        _condition = compile _condition;
    } else {
        _condition = missionNamespace getVariable _condition;
    };
    if (_condition isEqualType false) then {
        _return = _condition;
    } else {
        _return = [_caller, _target, _hitPoint, _className] call _condition;
    };
};
if (!_return) exitWith {false};

// private _vehicleStateCondition = if (isText(_config >> "vehicleStateCondition")) then {
    // missionNamespace getVariable [getText(_config >> "vehicleStateCondition"), 0]
// } else {
    // getNumber(_config >> "vehicleStateCondition")
// };
// if (_vehicleStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitWith {false};

private _repairLocations = getArray (_config >> "repairLocations");
if (!("All" in _repairLocations)) then {
    private _repairFacility = {([_caller] call FUNC(isInRepairFacility)) || ([_target] call FUNC(isInRepairFacility))};
    private _repairVeh = {([_caller] call FUNC(isNearRepairVehicle)) || ([_target] call FUNC(isNearRepairVehicle))};
    {
        if (_x == "field") exitWith {_return = true;};
        if (_x == "RepairFacility" && _repairFacility) exitWith {_return = true;};
        if (_x == "RepairVehicle" && _repairVeh) exitWith {_return = true;};
        if !(isNil _x) exitWith {
            private _val = missionNamespace getVariable _x;
            if (_val isEqualType 0) then {
                _return = switch (_val) do {
                    case 0: {true}; //useAnywhere
                    case 1: {call _repairVeh}; //repairVehicleOnly
                    case 2: {call _repairFacility}; //repairFacilityOnly
                    case 3: {(call _repairFacility) || {call _repairVeh}}; //vehicleAndFacility
                    default {false}; //Disabled
                };
            };
        };
    } forEach _repairLocations;
};

private _requiredObjects = getArray (_config >> "claimObjects");
private _claimObjectsAvailable = [];
if (!(_requiredObjects isEqualTo [])) then {
    _claimObjectsAvailable = [_caller, 5, _requiredObjects] call FUNC(getClaimObjects);
    if (_claimObjectsAvailable isEqualTo []) then {
        TRACE_2("Missing Required Objects",_requiredObjects,_claimObjectsAvailable);
        _return = false
    };
};

if !(_return && alive _target) exitWith {false};
//Last exitWith: repair_success or repair_failure will be run

//Claim required objects
{
    TRACE_2("Claiming", _x, (typeOf _x));
    [_caller, _x, false] call EFUNC(common,claim);
} forEach _claimObjectsAvailable;

private _consumeItems = if (isNumber (_config >> "itemConsumed")) then {
    getNumber (_config >> "itemConsumed");
} else {
    // Check for required class
    if (isText (_config >> "itemConsumed")) exitWith {
        missionNamespace getVariable [(getText (_config >> "itemConsumed")), 0];
    };
    0;
};

private _usersOfItems = [];
if (_consumeItems > 0) then {
    _usersOfItems = ([_caller, _items] call FUNC(useItems)) select 1;
};

// Parse the config for the progress callback
private _callbackProgress = getText (_config >> "callbackProgress");
if (_callbackProgress == "") then {
    _callbackProgress = "true";
};
if (isNil _callbackProgress) then {
    _callbackProgress = compile _callbackProgress;
} else {
    _callbackProgress = missionNamespace getVariable _callbackProgress;
};


// Player Animation
private _callerAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _caller == "PRONE");
_caller setVariable [QGVAR(selectedWeaponOnrepair), currentWeapon _caller];

// Cannot use secondairy weapon for animation
if (currentWeapon _caller == secondaryWeapon _caller) then {
    _caller selectWeapon (primaryWeapon _caller);
};

private _wpn = ["non", "rfl", "pst"] select (1 + ([primaryWeapon _caller, handgunWeapon _caller] find (currentWeapon _caller)));
_callerAnim = [_callerAnim, "[wpn]", _wpn] call CBA_fnc_replace;
if (vehicle _caller == _caller && {_callerAnim != ""}) then {
    if (primaryWeapon _caller == "") then {
        _caller addWeapon "ACE_FakePrimaryWeapon";
    };
    if (currentWeapon _caller == "") then {
        _caller selectWeapon (primaryWeapon _caller); // unit always has a primary weapon here
    };

    if !(_caller call EFUNC(common,isSwimming)) then {
        if (stance _caller == "STAND") then {
            _caller setVariable [QGVAR(repairPrevAnimCaller), "amovpknlmstpsraswrfldnon"];
        } else {
            _caller setVariable [QGVAR(repairPrevAnimCaller), animationState _caller];
        };
        [_caller, _callerAnim] call EFUNC(common,doAnimation);
    };
};

private _soundPosition = AGLToASL (_caller modelToWorldVisual (_caller selectionPosition "RightHand"));
["Acts_carFixingWheel", _soundPosition, nil, 50] call EFUNC(common,playConfigSound3D);

// Get repair time
private _repairTime = [
    configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(repairTimes) >> configName _config,
    "number",
    -1
] call CBA_fnc_getConfigEntry;

if (_repairTime < 0) then {
    _repairTime = if (isNumber (_config >> "repairingTime")) then {
        getNumber (_config >> "repairingTime");
    } else {
        if (isText (_config >> "repairingTime")) exitWith {
            private _repairTimeConfig = getText (_config >> "repairingTime");
            if (isNil _repairTimeConfig) then {
                _repairTimeConfig = compile _repairTimeConfig;
            } else {
                _repairTimeConfig = missionNamespace getVariable _repairTimeConfig;
            };
            if (_repairTimeConfig isEqualType 0) exitWith {
                _repairTimeConfig;
            };
            [_caller, _target, _hitPoint, _className] call _repairTimeConfig;
        };
        0;
    };
};

// Find localized string
private _hitPointClassname = if (_hitPoint isEqualType "") then {
    _hitPoint
} else {
    ((getAllHitPointsDamage _target) select 0) select _hitPoint
};
private _processText = getText (_config >> "displayNameProgress");
private _backupText = format [localize LSTRING(RepairingHitPoint), _hitPointClassname];
([_hitPointClassname, _processText, _backupText] call FUNC(getHitPointString)) params ["_text"];

TRACE_4("display",_hitPoint,_hitPointClassname,_processText,_text);

// Start repair
[
    _repairTime,
    [_caller, _target, _hitPoint, _className, _items, _usersOfItems, _claimObjectsAvailable],
    DFUNC(repair_success),
    DFUNC(repair_failure),
    _text,
    _callbackProgress,
    ["isNotSwimming", "isNotOnLadder"]
] call EFUNC(common,progressBar);

// Display Icon
private _iconDisplayed = getText (_config >> "actionIconPath");
if (_iconDisplayed != "") then {
    [QGVAR(repairActionIcon), true, _iconDisplayed, [1,1,1,1], getNumber(_config >> "actionIconDisplayTime")] call EFUNC(common,displayIcon);
};

// handle display of text/hints
private _displayText = "";
if (_target != _caller) then {
    _displayText = getText(_config >> "displayTextOther");
} else {
    _displayText = getText(_config >> "displayTextSelf");
};

if (_displayText != "") then {
    [QEGVAR(common,displayTextStructured), [[_displayText, [_caller] call EFUNC(common,getName), [_target] call EFUNC(common,getName)], 1.5, _caller], [_caller]] call CBA_fnc_targetEvent;
};

true;
