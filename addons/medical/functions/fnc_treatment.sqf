/*
 * Author: Glowbal, KoffeinFlummi
 * Starts the treatment process
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_config", "_medicRequired", "_items", "_locations", "_return", "_callbackProgress", "_treatmentTime", "_callerAnim", "_patientAnim", "_iconDisplayed", "_return", "_usersOfItems", "_consumeItems", "_condition", "_displayText", "_wpn", "_treatmentTimeConfig", "_patientStateCondition"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;

// If the cursorMenu is open, the loading bar will fail. If we execute the function one frame later, it will work fine
if (uiNamespace getVariable [QEGVAR(interact_menu,cursorMenuOpened),false]) exitwith {
    [{
        _this call FUNC(treatment);
    }, _this] call EFUNC(common,execNextFrame);
};

if !(_target isKindOf "CAManBase") exitWith {false};

_config = (configFile >> "ACE_Medical_Actions" >> "Basic" >> _className);
if (GVAR(level) >= 2) then {
    _config = (configFile >> "ACE_Medical_Actions" >> "Advanced" >> _className);
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

// Check item
_items = getArray (_config >> "items");
if (count _items > 0 && {!([_caller, _target, _items] call FUNC(hasItems))}) exitwith {false};

_return = true;
if (isText (_config >> "Condition")) then {
    _condition = getText(_config >> "condition");
    if (_condition != "") then {
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
};
if (!_return) exitwith {false};

_patientStateCondition = if (isText(_config >> "patientStateCondition")) then {
    missionNamespace getvariable [getText(_config >> "patientStateCondition"), 0]
} else {
    getNumber(_config >> "patientStateCondition")
};
if (_patientStateCondition == 1 && {!([_target] call FUNC(isInStableCondition))}) exitwith {false};

// Check allowed locations
_locations = getArray (_config >> "treatmentLocations");

if ("All" in _locations) then {
    _return = true;
} else {
    private [ "_medFacility", "_medVeh"];
    _medFacility = {([_caller] call FUNC(isInMedicalFacility)) || ([_target] call FUNC(isInMedicalFacility))};
    _medVeh = {([_caller] call FUNC(isInMedicalVehicle)) || ([_target] call FUNC(isInMedicalVehicle))};

    {
        if (_x == "field") exitwith {_return = true;};
        if (_x == "MedicalFacility" && _medFacility) exitwith {_return = true;};
        if (_x == "MedicalVehicle" && _medVeh) exitwith {_return = true;};
        if !(isnil _x) exitwith {
            private "_val";
            _val = missionNamespace getvariable _x;
            if (typeName _val == "SCALAR") then {
                _return = switch (_val) do {
                    case 0: {true};
                    case 1: _medVeh;
                    case 2: _medFacility;
                    case 3: {call _medFacility || call _medVeh};
                };
            };
        };
    }foreach _locations;
};

if !(_return) exitwith {false};

_usersOfItems = [];
_consumeItems = if (isNumber (_config >> "itemConsumed")) then {
    getNumber (_config >> "itemConsumed");
} else {
    // Check for required class
    if (isText (_config >> "itemConsumed")) exitwith {
        missionNamespace getvariable [(getText (_config >> "itemConsumed")), 0];
    };
    0;
};
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

// Patient Animation
_patientAnim = getText (_config >> "animationPatient");
if (_target getvariable ["ACE_isUnconscious", false] && GVAR(allowUnconsciousAnimationOnTreatment)) then {
    if !(animationState _target in (getArray (_config >> "animationPatientUnconsciousExcludeOn"))) then {
        _patientAnim = getText (_config >> "animationPatientUnconscious");
    };
};

if (_caller != _target && {vehicle _target == _target} && {_patientAnim != ""}) then {
    if (_target getvariable ["ACE_isUnconscious", false]) then {
        [_target, _patientAnim, 2, true] call EFUNC(common,doAnimation);
    } else {
        [_target, _patientAnim, 1, true] call EFUNC(common,doAnimation);
    };
};

// Player Animation
_callerAnim = [getText (_config >> "animationCaller"), getText (_config >> "animationCallerProne")] select (stance _caller == "PRONE");
if (_caller == _target) then {
    _callerAnim = [getText (_config >> "animationCallerSelf"), getText (_config >> "animationCallerSelfProne")] select (stance _caller == "PRONE");
};

_caller setvariable [QGVAR(selectedWeaponOnTreatment), currentWeapon _caller];

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
        _caller setvariable [QGVAR(treatmentPrevAnimCaller), "amovpknlmstpsraswrfldnon"];
    } else {
        _caller setvariable [QGVAR(treatmentPrevAnimCaller), animationState _caller];
    };
    [_caller, _callerAnim] call EFUNC(common,doAnimation);
};

//Get treatment time
_treatmentTime = if (isNumber (_config >> "treatmentTime")) then {
    getNumber (_config >> "treatmentTime");
} else {
    if (isText (_config >> "treatmentTime")) exitwith {
        _treatmentTimeConfig = getText(_config >> "treatmentTime");
        if (isnil _treatmentTimeConfig) then {
            _treatmentTimeConfig = compile _treatmentTimeConfig;
        } else {
            _treatmentTimeConfig = missionNamespace getvariable _treatmentTimeConfig;
        };
        if (typeName _treatmentTimeConfig == "SCALAR") exitwith {
            _treatmentTimeConfig;
        };
        [_caller, _target, _selectionName, _className] call _treatmentTimeConfig;
    };
    0;
};

// Start treatment
if (_caller != ACE_player) exitWith {
    // It's an AI that is doing the treatment
    [DFUNC(treatment_success), [[_caller, _target, _selectionName, _className, _items, _usersOfItems]], _treatmentTime]call EFUNC(common,waitAndExecute);
    true;
};

// Start treatment for player
[
    _treatmentTime,
    [_caller, _target, _selectionName, _className, _items, _usersOfItems],
    DFUNC(treatment_success),
    DFUNC(treatment_failure),
    getText (_config >> "displayNameProgress"),
    _callbackProgress,
    ["isnotinside"]
] call EFUNC(common,progressBar);

// Display Icon
_iconDisplayed = getText (_config >> "actionIconPath");
if (_iconDisplayed != "") then {
    [QGVAR(treatmentActionIcon), true, _iconDisplayed, [1,1,1,1], getNumber(_config >> "actionIconDisplayTime")] call EFUNC(common,displayIcon);
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
