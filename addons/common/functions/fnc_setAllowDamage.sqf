/*
 * Author: PabstMirror
 * Allows multiple sources to block all or just collision damage on objects
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Source Reason <STRING>
 * 2: State (0 = allow all, 1 = block colision, 2 = block all) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [box1, "preventColision", 1] call ace_common_fnc_setAllowDamage;
 *
 * Public: Yes
 */
 #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_object", "_reason", "_state"];

TRACE_3("params",_object,_reason,_state);

_allowDamageReasons = missionNamespace getVariable [QGVAR(allowDamageReasons), []];

_objectAllowDamage = _object getVariable [QGVAR(allowDamage), [0,0]];
_objectAllowDamage params ["_blockCollisionNum", "_blockDamageNum"];

_blockCollisionArray = [_blockCollisionNum, count _allowDamageReasons] call FUNC(binarizeNumber);
_blockDamageArray = [_blockDamageNum, count _allowDamageReasons] call FUNC(binarizeNumber);

//If there is a reason, set it in the arrays:
if (_reason != "") then {
    _reason = toLower _reason;
    // register new reason (these reasons are shared publicly, since units can change ownership, but keep their forceWalk status)
    if !(_reason in _allowDamageReasons) then {
        _allowDamageReasons pushBack _reason;
        GVAR(allowDamageReasons) = _allowDamageReasons;
        publicVariable QGVAR(allowDamageReasons);
    };
    _index = _allowDamageReasons find _reason;
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

_newBlockCollisionNum = _blockCollisionArray call FUNC(toBitmask);
_newBlockDamageNum = _blockDamageArray call FUNC(toBitmask);

if ((_newBlockDamageNum == _blockDamageNum) && {_newBlockCollisionNum == _blockCollisionNum}) exitWith {
    TRACE_2("No Change",_newBlockCollisionNum, _newBlockDamageNum);
};

TRACE_2("Updating",_newBlockCollisionNum, _newBlockDamageNum);
_object setVariable [QGVAR(allowDamage), [_newBlockCollisionNum, _newBlockDamageNum], true];

if ((_object isKindOf "CAManBase") && {["ace_medical"] call FUNC(isModLoaded)}) exitWith {
    //ACE_medical already has a handleDamage installed on the Unit and we can just setVariables for it
    TRACE_1("handled by ace medical", _object);
};

if ((_newBlockCollisionNum + _newBlockDamageNum) > 0) then {
    local _ttlCondition = {
        ((_this select 1) select 1) params ["_object", "_statusArray"];
        TRACE_1("TTL Check", _object);
        //Only keep event if getVariable is same as event variable (also handles objNull)
        (_statusArray isEqualTo (_object getVariable [QGVAR(allowDamage), [-1, -1]]))
    };
    TRACE_1("allowDamage event IS synced", _object);
    [QGVAR(allowDamage), [_object, [_newBlockCollisionNum, _newBlockDamageNum]], _ttlCondition] call EFUNC(common,syncedEvent);
} else {
    TRACE_1("allowDamage event IS NOT synced", _object);
    [QGVAR(allowDamage), [_object, [_newBlockCollisionNum, _newBlockDamageNum]], -1] call EFUNC(common,syncedEvent);
};

nil
