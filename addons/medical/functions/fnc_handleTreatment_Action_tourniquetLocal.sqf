/**
 * fnc_handleTreatment_Action_tourniquetLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_part","_selectionName","_removeItem", "_tourniquets", "_applyingTo"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;


[_target,"treatment",format["%1 applied a tourniquet on %2",[_caller] call EFUNC(common,getName),_selectionName]] call FUNC(addActivityToLog);
[_target,_removeItem] call FUNC(addToTriageList);
[_target] call FUNC(addToInjuredCollection);


_part =    [_selectionName] call FUNC(getBodyPartNumber);

// Place a tourniquet on the bodypart
_tourniquets = [_target, QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
_applyingTo = (_tourniquets select _part) + 1 + round(random(100));
_tourniquets set[_part, _applyingTo];
[_target, QGVAR(tourniquets), _tourniquets] call EFUNC(common,setDefinedVariable);

[{
    private ["_args","_target","_applyingTo","_part", "_tourniquets"];
    _args = _this select 0;
    _target = _args select 0;
    _applyingTo = _args select 1;
    _part = _args select 2;

    if (!alive _target) exitwith {
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };

    _tourniquets = [_injuredPerson,QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
    if !((_tourniquets select _part) == _applyingTo) exitwith {
        // Tourniquet has been removed
        [(_this select 1)] call cba_fnc_removePerFrameHandler;
    };

    _pain = [_target, QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable);
    _pain = _pain + 0.005;
    [_target, QGVAR(amountOfPain),_pain] call EFUNC(common,setDefinedVariable);

}, 5, [_target, _applyingTo, _part] ] call CBA_fnc_addPerFrameHandler;

true