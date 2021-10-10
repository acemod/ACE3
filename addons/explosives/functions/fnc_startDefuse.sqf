#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts defusing an explosive
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target explosive <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ACE_Interaction_Target] call ACE_Explosives_fnc_StartDefuse;
 *
 * Public: Yes
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

_target = attachedTo (_target);

private _fnc_DefuseTime = {
    params ["_specialist", "_target"];
    TRACE_2("defuseTime",_specialist,_target);
    private _defuseTime = 5;
    if (isNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> QGVAR(DefuseTime))) then {
        _defuseTime = getNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> QGVAR(DefuseTime));
    };
    if (!_specialist && {GVAR(PunishNonSpecialists)}) then {
        _defuseTime = _defuseTime * 1.5;
    };
    _defuseTime
};
private _actionToPlay = "MedicOther";
if (STANCE _unit == "Prone") then {
    _actionToPlay = "PutDown";
};

if (ACE_player != _unit) then {
    // If the unit is a player, call the function on the player.
    if (isPlayer _unit) then {
        [QGVAR(startDefuse), [_unit, _target], _unit] call CBA_fnc_targetEvent;
    } else {
        [_unit, _actionToPlay] call EFUNC(common,doGesture);
        _unit disableAI "MOVE";
        _unit disableAI "TARGET";
        private _defuseTime = [[_unit] call EFUNC(Common,isEOD), _target] call _fnc_DefuseTime;
        [{
            params ["_unit", "_target"];
            TRACE_2("defuse finished",_unit,_target);
            [_unit, _target] call FUNC(defuseExplosive);
            _unit enableAI "MOVE";
            _unit enableAI "TARGET";
        }, [_unit, _target], _defuseTime] call CBA_fnc_waitAndExecute;
    };
} else {
    [_unit, _actionToPlay] call EFUNC(common,doGesture);
    private _isEOD = [_unit] call EFUNC(Common,isEOD);
    private _defuseTime = [_isEOD, _target] call _fnc_DefuseTime;
    if (_isEOD || {!GVAR(RequireSpecialist)}) then {
        [_defuseTime, [_unit,_target], {(_this select 0) call FUNC(defuseExplosive)}, {}, (localize LSTRING(DefusingExplosive)), {true}, ["isNotSwimming"]] call EFUNC(common,progressBar);
    };
};
