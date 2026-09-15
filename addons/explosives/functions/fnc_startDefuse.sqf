#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts defusing an explosive.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Interaction object or target explosive <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_explosives_fnc_startDefuse
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];
TRACE_2("params",_unit,_target);

if (!alive _unit) exitWith {};

if (_target isKindOf "ACE_DefuseObject") then {
    _target = attachedTo _target;
};

if (isNull _target) exitWith {};

if (!local _unit) exitWith {
    [QGVAR(startDefuse), [_unit, _target], _unit] call CBA_fnc_targetEvent;
};

[_unit, ["MedicOther", "PutDown"] select (stance _unit == "Prone")] call EFUNC(common,doGesture);

// Adapt defusal time based of skill
private _isEOD = _unit call EFUNC(common,isEOD);
private _defuseTime = [configOf _target >> QGVAR(defuseTime), "NUMBER", 5] call CBA_fnc_getConfigEntry;

if (!_isEOD && GVAR(punishNonSpecialists)) then {
    _defuseTime = _defuseTime * 1.5;
};

if (ACE_player == _unit) then {
    if (_isEOD || !GVAR(requireSpecialist)) then {
        // API
        [QGVAR(defuseStart), [_target, _unit]] call CBA_fnc_globalEvent;

        [_defuseTime, [_unit, _target], {(_this select 0) call FUNC(defuseExplosive)}, {}, LLSTRING(DefusingExplosive), {true}, ["isNotSwimming"]] call EFUNC(common,progressBar);
    };
} else {
    // API
    [QGVAR(defuseStart), [_target, _unit]] call CBA_fnc_globalEvent;

    // Disable parts of the AI to simulate defusal
    private _features = [];

    {
        _features pushBack [_x, _unit checkAIFeature _x];

        _unit disableAI _x;
    } forEach ["MOVE", "TARGET", "FIREWEAPON"];

    [{
        params ["_unit", "_target", "_features"];
        TRACE_3("defuse finished",_unit,_target,_features);

        [_unit, _target] call FUNC(defuseExplosive);

        // Reenable what was previously enabled
        {
            _unit enableAIFeature _x;
        } forEach _features;
    }, [_unit, _target, _features], _defuseTime] call CBA_fnc_waitAndExecute;
};
