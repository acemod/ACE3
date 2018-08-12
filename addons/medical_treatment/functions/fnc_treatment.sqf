#include "script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi
 * Starts the treatment process
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: No
 */

params ["_caller", "_target", "_bodyPart", "_className"];

// if the cursorMenu is open, the loading bar will fail. If we execute the function one frame later, it will work fine
if (uiNamespace getVariable [QEGVAR(interact_menu,cursorMenuOpened), false]) exitWith {
    [DFUNC(treatment), _this] call CBA_fnc_execNextFrame;
};

if !([_caller, _target, _bodyPart, _className] call FUNC(canTreat)) exitWith {false};

private _config = configFile >> QGVAR(Actions) >> _className;

// handle items
private _items = getArray (_config >> "items");

private _consumeItems = 0;

if (isNumber (_config >> "itemConsumed")) then {
    _consumeItems = getNumber (_config >> "itemConsumed");
} else {
    if (isText (_config >> "itemConsumed")) then {
        _consumeItems = missionNamespace getVariable [getText (_config >> "itemConsumed"), 0];
    };
};

private _usersOfItems = [];

if (_consumeItems > 0) then {
    _usersOfItems = ([_caller, _target, _items] call FUNC(useItems)) select 1;
};

// parse the config for the progress callback
private _callbackProgress = getText (_config >> "callbackProgress");

if (_callbackProgress isEqualTo "") then {
    _callbackProgress = "true";
};

if (isNil _callbackProgress) then {
    _callbackProgress = compile _callbackProgress;
} else {
    _callbackProgress = missionNamespace getVariable _callbackProgress;
};

// play patient animation
private _patientAnim = getText (_config >> "animationPatient");

if (IS_UNCONSCIOUS(_target) && EGVAR(medical,allowUnconsciousAnimationOnTreatment)) then {
    if !(animationState _target in (getArray (_config >> "animationPatientUnconsciousExcludeOn"))) then {
        _patientAnim = getText (_config >> "animationPatientUnconscious");
    };
};

private _isSelf = _caller isEqualTo _target;

if (!_isSelf && {vehicle _target == _target} && {_patientAnim != ""}) then {
    if IS_UNCONSCIOUS(_target) then {
        [_target, _patientAnim, 2, true] call EFUNC(common,doAnimation);
    } else {
        [_target, _patientAnim, 1, true] call EFUNC(common,doAnimation);
    };
};

// play animation
private "_callerAnim";

if (_isSelf) then {
    _callerAnim = getText (_config >> ["animationCallerSelf", "animationCallerSelfProne"] select (stance _caller == "PRONE"));
} else {
    _callerAnim = getText (_config >> ["animationCaller", "animationCallerProne"] select (stance _caller == "PRONE"));
};

_caller setVariable [QGVAR(selectedWeaponOnTreatment), weaponState _caller];

private _wpn = ["non", "rfl", "lnr", "pst"] param [["", primaryWeapon _caller, secondaryWeapon _caller, handgunWeapon _caller] find currentWeapon _caller, "non"];

_callerAnim = [_callerAnim, "[wpn]", _wpn] call CBA_fnc_replace;

// this one is missing
if (_callerAnim == "AinvPknlMstpSlayWlnrDnon_medic") then {
    _callerAnim = "AinvPknlMstpSlayWlnrDnon_medicOther";
};

private _animDuration = GVAR(animDurations) getVariable _callerAnim;

// these animations have transitions that take a bit longer...
if (weaponLowered _caller) then {
    _animDuration = _animDuration + 0.5;

    // fix problems with lowered weapon transitions by raising the weapon first
    if (currentWeapon _caller != "" && {_callerAnim != ""}) then {
        _caller action ["WeaponInHand", _caller];
    };
};

if (binocular _caller != "" && {binocular _caller == currentWeapon _caller}) then {
    _animDuration = _animDuration + 1.0;
};

if (vehicle _caller == _caller && {_callerAnim != ""}) then {
    private _endInAnim = "AmovP[pos]MstpS[stn]W[wpn]Dnon";

    private _pos = ["knl", "pne"] select (stance _caller == "PRONE");
    private _stn = "non";

    if (_wpn != "non") then {
        _stn = ["ras", "low"] select (weaponLowered _caller);
    };

    _endInAnim = [_endInAnim, "[pos]", _pos] call CBA_fnc_replace;
    _endInAnim = [_endInAnim, "[stn]", _stn] call CBA_fnc_replace;
    _endInAnim = [_endInAnim, "[wpn]", _wpn] call CBA_fnc_replace;
    TRACE_1("",_endInAnim);

    [_caller, _callerAnim] call EFUNC(common,doAnimation);
    [_caller, _endInAnim] call EFUNC(common,doAnimation);
    _caller setVariable [QGVAR(endInAnim), _endInAnim];
};

// get treatment time from config - also supports variables and code expressions
private _treatmentTime = 0;

if (isNumber (_config >> "treatmentTime")) then {
    _treatmentTime = getNumber (_config >> "treatmentTime");
} else {
    if (isText (_config >> "treatmentTime")) then {
        _treatmentTime = getText (_config >> "treatmentTime");

        if (isNil _treatmentTime) then {
            _treatmentTime = compile _treatmentTime;
        } else {
            _treatmentTime = missionNamespace getVariable _treatmentTime;
        };

        if !(_treatmentTime isEqualType 0) then {
            _treatmentTime = call _treatmentTime;
        };
    };
};
TRACE_1("",_treatmentTime);

if (_treatmentTime == 0) exitWith { false };

// speed up animation depending on treatment time
if (!isNil "_animDuration") then {
    [QEGVAR(common,setAnimSpeedCoef), [_caller, _animDuration / _treatmentTime]] call CBA_fnc_globalEvent;
    TRACE_2("",_animDuration,_treatmentTime);
};

// play sound
if (isArray (_config >> "sounds")) then {
    selectRandom getArray (_config >> "sounds") params ["_file", ["_volume", 1], ["_pitch", 1], ["_distance", 0]];
    TRACE_4("playSound3D",_file,_volume,_pitch,_distance);
    playSound3D [
        _file,
        objNull,
        false,
        getPosASL _caller,
        _volume,
        _pitch,
        _distance
    ];
};

private _startCallback = getText (_config >> "callbackStart");
if (isNil _startCallback) then {
    _startCallback = compile _startCallback;
} else {
    _startCallback = missionNamespace getVariable _startCallback;
};

if !(_startCallback isEqualType {}) then {
    _startCallback = {TRACE_1("startCallback was NOT code",_startCallback)};
};

[_caller, _target, _bodyPart, _className, _items, _usersOfItems] call _startCallback;

// start treatment
[
    _treatmentTime,
    [_caller, _target, _bodyPart, _className, _items, _usersOfItems],
    DFUNC(treatment_success),
    DFUNC(treatment_failure),
    getText (_config >> "displayNameProgress"),
    _callbackProgress,
    ["isnotinside"]
] call EFUNC(common,progressBar);

// Treatment event is used for aid notifications
[QGVAR(initiated), [_caller, _target], _target] call CBA_fnc_targetEvent;

// display icon
private _iconDisplayed = getText (_config >> "actionIconPath");

if (_iconDisplayed != "") then {
    [QGVAR(treatmentActionIcon), true, _iconDisplayed, [1,1,1,1], getNumber (_config >> "actionIconDisplayTime")] call EFUNC(common,displayIcon);
};

// handle display of text/hints
private _displayText = getText (_config >> ["displayTextOther", "displayTextSelf"] select _isSelf);

if (_displayText != "") then {
    [QEGVAR(common,displayTextStructured), [[_displayText, _caller call EFUNC(common,getName), _target call EFUNC(common,getName)], 1.5, _caller], _caller] call CBA_fnc_targetEvent;
};

true
