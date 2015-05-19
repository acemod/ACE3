/*
 * Author: Garth 'L-H' de Wet
 * Starts defusing an explosive
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target explosive <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, ACE_Interaction_Target] call ACE_Explosives_fnc_StartDefuse;
 *
 * Public: Yes
 */
#include "script_component.hpp"
EXPLODE_2_PVT(_this,_unit,_target);

private["_actionToPlay", "_defuseTime", "_isEOD"];

_target = attachedTo (_target);

_fnc_DefuseTime = {
    EXPLODE_2_PVT(_this,_specialist,_target);
    private ["_defuseTime"];
    _defuseTime = 5;
    if (isNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "ACE_DefuseTime")) then {
        _defuseTime = getNumber(ConfigFile >> "CfgAmmo" >> typeOf (_target) >> "ACE_DefuseTime");
    };
    if (!_specialist && {GVAR(PunishNonSpecialists)}) then {
        _defuseTime = _defuseTime * 1.5;
    };
    _defuseTime
};
_actionToPlay = "MedicOther";
if (STANCE _unit == "Prone") then {
    _actionToPlay = "PutDown";
};

if (ACE_player != _unit) then {
    // If the unit is a player, call the function on the player.
    if (isPlayer _unit) then {
        [[_unit, _target], QFUNC(startDefuse), _unit] call EFUNC(common,execRemoteFnc);
    } else {
        _unit playActionNow _actionToPlay;
        _unit disableAI "MOVE";
        _unit disableAI "TARGET";
        _defuseTime = [[_unit] call EFUNC(Common,isEOD), _target] call _fnc_DefuseTime;
        [{
            PARAMS_2(_unit,_target);
            [_unit, _target] call FUNC(defuseExplosive);
            _unit enableAI "MOVE";
            _unit enableAI "TARGET";
        }, [_unit, _target], _defuseTime, 0] call EFUNC(common,waitAndExecute);
    };
} else {
    _unit playActionNow _actionToPlay;
    _isEOD = [_unit] call EFUNC(Common,isEOD);
    _defuseTime = [_isEOD, _target] call _fnc_DefuseTime;
    if (_isEOD || {!GVAR(RequireSpecialist)}) then {
        [_defuseTime, [_unit,_target], {(_this select 0) call FUNC(defuseExplosive)}, {}, (localize "STR_ACE_Explosives_DefusingExplosive")] call EFUNC(common,progressBar);
    };
};
