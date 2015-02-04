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
    [_unit, "ACE_Surrendered", true] call ACE_Core_fnc_setCaptivityStatus;

    _unit spawn {
        // fix for lowered rifle animation glitch
        if (currentWeapon _this != "" && {currentWeapon _this == primaryWeapon _this} && {weaponLowered _this} && {stance _this == "STAND"}) then {
            _this playMove "amovpercmstpsraswrfldnon";
        };

        while {_this getVariable [QGVAR(isSurrender), false]} do {
            sleep 0.001; //sleep in UI

            if (isPlayer _this) then {showHUD false};

            if (!alive _this || {_this getVariable ["ACE_isUnconscious", false]}) then {
                _this setVariable [QGVAR(isSurrender), false, true];
            } else {
                _this playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
            };
        };
        if !(_this getVariable ["ACE_isUnconscious", false]) then {
            _this playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
        } else {
            _this playMoveNow "unconscious";
        };

        [_this, "ACE_Surrendered", false] call ACE_Core_fnc_setCaptivityStatus;

        if (isPlayer _this) then {showHUD true};
    };
} else {
    _unit setVariable [QGVAR(isSurrender), false, true];
};

/*
player playMove "AmovPercMstpSsurWnonDnon"
player switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon"
 */
