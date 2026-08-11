#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Adds a status effect that will be handled.
 *
 * Arguments:
 * 0: Status Effect Name, this should match a corresponding event name <STRING>
 * 1: Send event globally <BOOL>
 * 2: Common Effect Reasons to pre-seed during init <ARRAY>
 * 3: Send event to JIP (requires sending event globally) <BOOL> (default: false)
 * 4: Event name <STRING> (default: "ace_common_<effect>")
 *
 * Return Value:
 * None
 *
 * Example:
 * ["setCaptive", true, []] call ace_common_fnc_statusEffect_addType
 *
 * Public: No
 */

params [["_name", "", [""]], ["_isGlobal", false, [false]], ["_commonReasonsArray", [], [[]]], ["_sendJIP", false, [false]], ["_eventName", "", [""]]];
TRACE_4("params",_name,_isGlobal,_commonReasonsArray,_eventName);

_name = toLowerANSI _name;
if (_name == "") exitWith {ERROR_1("addStatusEffect - Bad Name %1",_this)};
if (_name in GVAR(statusEffects)) exitWith {WARNING_1("addStatusEffect - Effect Already Added (note, will not update global bit) %1",_this)};
if (_sendJIP && !_isGlobal) exitWith {WARNING_1("addStatusEffect - Trying to add non-global JIP effect %1",_this)};
if (_eventName == "") then { _eventName = format [QGVAR(%1), _name]; };

GVAR(statusEffects) set [_name, [_isGlobal, _sendJIP, _eventName]];

//We add reasons at any time, but more efficenet to add all common ones at one time during init
if (isServer && {_commonReasonsArray isNotEqualTo []}) then {
    //Switch case to lower:
    _commonReasonsArray = _commonReasonsArray apply { toLowerANSI _x };
    missionNamespace setVariable [(format [QGVAR(statusEffects_%1), _name]), _commonReasonsArray, true];
};
