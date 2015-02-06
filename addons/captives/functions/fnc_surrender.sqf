/*
 * Author: commy2
 * TODO
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: State <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_2(_unit,_state);

if (!local _unit) exitWith {[_this, _fnc_scriptName, _unit] call ACE_Core_fnc_execRemoteFnc};

if (_state) then {
    if (_unit getVariable [QGVAR(isSurrender), false]) exitWith {};

    _unit setVariable [QGVAR(isSurrender), true, true];
    [_unit, "ACE_Surrendered", true] call EFUNC(common,setCaptivityStatus);


    private "_surrenderFnc";
    _surrenderFnc = {
        EXPLODE_1_PVT((_this select 0),_unit);
        if (_unit getVariable [QGVAR(isSurrender), false]) then {
            if ((!alive _unit) || {_unit getVariable ["ACE_isUnconscious", false]} || {_unit getVariable [QGVAR(isHandcuffed), false]}) then {
                _unit setVariable [QGVAR(isSurrender), false, true];
            } else {
                [_unit, "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon", 0] call EFUNC(common,doAnimation);
            };
        };

        if (!(_unit getVariable [QGVAR(isSurrender), false])) then {
            [(_this select 1)] call cba_fnc_removePerFrameHandler;

            if !(_unit getVariable ["ACE_isUnconscious", false]) then {
                [_unit, "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon", 1] call EFUNC(common,doAnimation);
            } else {
                [_unit, "unconscious", 1] call EFUNC(common,doAnimation);
            };
            [_unit, "ACE_Surrendered", false] call EFUNC(common,setCaptivityStatus);
            if (isPlayer _unit) then {showHUD true};
        };
    };
    [_surrenderFnc, 0.0, [_unit]] call CBA_fnc_addPerFrameHandler;
} else {
    _unit setVariable [QGVAR(isSurrender), false, true];
};
