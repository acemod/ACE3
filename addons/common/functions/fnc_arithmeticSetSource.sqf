#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Adds or removes a source to an arithmetic set.
 *
 * Arguments:
 * 0: Namespace <OBJECT|LOCATION|NAMESPACE>
 * 1: Number Set ID <STRING>
 * 2: Source <STRING>
 * 3: Code that returns a number (can access var _namespace) [use {} to remove] <CODE>
 *
 * Return Value:
 * None
 *
 * Example:
 * [missionNameSpace, "ace_hearing", "myMission", {0.5}] call ace_common_fnc_arithmeticSetSource
 * [ace_player, "ace_aimCoefficents", "ace_medical", {linearConversion [0,1,(_namespace getVariable "ace_medical_pain",1,0.2,true]}] call ace_common_fnc_arithmeticSetSource
 *
 * Public: Yes
 */

params ["_namespace", "_setID", "_source", "_variable"];
TRACE_4("arithmeticSetSource",_namespace,_setID,_source,_variable);

private _hash = _namespace getVariable _setID;

if (isNil "_hash") then {
    _hash = [] call CBA_fnc_hashCreate;
    _namespace setVariable [_setID, _hash];
};

if (_variable isEqualTo {}) then {
    TRACE_1("removing",_source);
    [_hash, _source] call CBA_fnc_hashRem;
} else {
    TRACE_2("adding",_source,_variable);
    [_hash, _source, _variable] call CBA_fnc_hashSet;
};

nil
