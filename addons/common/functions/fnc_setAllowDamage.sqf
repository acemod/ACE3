/*
 * Author: PabstMirror
 * Allows multiple sources to block all or just collision damage on people/objects
 *
 * Arguments:
 * 0: Object (should be local) <OBJECT>
 * 1: Source Reason <STRING>
 * 2: State (true/false or 0 = allow all, 1 = block colision (CAManBase only + req medical), 2 = block all) <NUMBER><BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [box1, "doNotExplode", true] call ace_common_fnc_setAllowDamage;
 * [guy, "preventColisionDmg", 1] call ace_common_fnc_setAllowDamage;
 * [guy, "", -1] call ace_common_fnc_setAllowDamage; //Won't modifiy state and just reapply effects
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_object", "_reason", "_state"];
TRACE_3("params",_object,_reason,_state);

if (!local _object) exitWith {
    ACE_LOGERROR_1("setAllowDamage - obj not local - %1", _this);
    ["allowDamage", [_object], _this] call FUNC(targetEvent);
};

if ((typeName _state) == "BOOL") then {//Convert bool to number
    _state = [2,0] select _state;
};
if ((_state == 1) && {(!(_object isKindOf "CAManBase")) || {!(["ace_medical"] call FUNC(isModLoaded))}}) then {
    _state = 2; //Can't do 'blockCollision' on non man or if mod not loaded
};

local _allowDamageReasons = missionNamespace getVariable [QGVAR(allowDamageReasons), []];
(_object getVariable [QGVAR(allowDamage), [0,0]]) params ["_blockCollisionNum", "_blockDamageNum"];

local _blockCollisionArray = [_blockCollisionNum, count _allowDamageReasons] call FUNC(binarizeNumber);
local _blockDamageArray = [_blockDamageNum, count _allowDamageReasons] call FUNC(binarizeNumber);

//If there is a reason, set it in the arrays:
if (_reason != "") then {
    _reason = toLower _reason;
    // register new reason (these reasons are shared publicly, since units can change ownership)
    if !(_reason in _allowDamageReasons) then {
        _allowDamageReasons pushBack _reason;
        GVAR(allowDamageReasons) = _allowDamageReasons;
        publicVariable QGVAR(allowDamageReasons);
    };
    local _index = _allowDamageReasons find _reason;
    switch (_state) do {
    case (0): {
            _blockCollisionArray set [_index, false];
            _blockDamageArray set [_index, false];
        };
    case (1): {
            _blockCollisionArray set [_index, true];
            _blockDamageArray set [_index, false];
        };
    case (2): {
            _blockCollisionArray set [_index, false];
            _blockDamageArray set [_index, true];
        };
    };
};

local _newBlockCollisionNum = _blockCollisionArray call FUNC(toBitmask);
local _newBlockDamageNum = _blockDamageArray call FUNC(toBitmask);

//Update and broadcast variables if they changed:
if ((_newBlockDamageNum != _blockDamageNum) || {_newBlockCollisionNum != _blockCollisionNum}) then {
    TRACE_2("Updating",_newBlockCollisionNum, _newBlockDamageNum);
    _object setVariable [QGVAR(allowDamage), [_newBlockCollisionNum, _newBlockDamageNum], true];
};

if ((_object isKindOf "CAManBase") && {["ace_medical"] call FUNC(isModLoaded)}) then {
    //ACE_medical already has a handleDamage installed on the Unit and we can just setVariables for it
    TRACE_1("handled by ace medical", _object);

    _object setvariable [QEGVAR(medical,allowDamage), (_newBlockCollisionNum > 0), true];
    _object setvariable [QEGVAR(medical,allowCollisionDamage), (_newBlockCollisionNum > 0), true];
} else {
    if (_newBlockDamageNum > 0) then {
        TRACE_1("Blocking Damage", _object);
        _object allowDamage false;
    } else {
        TRACE_1("Allowing Damage", _object);
        _object allowDamage true;
    };
};

nil
