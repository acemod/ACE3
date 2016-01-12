/*
 * Author: Glowbal
 * Enabled the vitals loop for a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * None
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_unit", ["_force", false]];

if ([_unit] call FUNC(hasMedicalEnabled) || _force) then {

    if !(local _unit) exitWith {
        [[_unit, _force], QUOTE(DFUNC(addToInjuredCollection)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    };

    if ((_unit getVariable[QGVAR(addedToUnitLoop),false] || !alive _unit) && !_force) exitWith{};
    _unit setVariable [QGVAR(addedToUnitLoop), true, true];

    [{
        params ["_args", "_idPFH"];
        _args params ["_unit", "_interval"];
        _interval = ACE_time - _interval;
        (_this select 0) set [1, ACE_time];

        if (!alive _unit || !local _unit) then {
           [_idPFH] call CBA_fnc_removePerFrameHandler;
           if (!local _unit) then {
                if (GVAR(level) >= 2) then {
                    _unit setVariable [QGVAR(heartRate), _unit getVariable [QGVAR(heartRate), 80], true];
                    _unit setVariable [QGVAR(bloodPressure), _unit getVariable [QGVAR(bloodPressure), [80, 120]], true];
                };
                _unit setVariable [QGVAR(bloodVolume), _unit getVariable [QGVAR(bloodVolume), 100], true];
           };
        } else {
            [_unit, _interval] call FUNC(handleUnitVitals);

            private "_pain";
            _pain = _unit getVariable [QGVAR(pain), 0];
            if (_pain > (_unit getVariable [QGVAR(painSuppress), 0])) then {
                // This introduces wierd unconscious behaviour for basic medical and possibly also advanced.
                // TODO This is disabled as it's considered non critical code.
                // We will need to decide if we want unconscious triggered on high pain levels or if we can get rid of this entirely.
                /*if (_pain > 0.7 && {random(1) > 0.6}) then {
                    [_unit] call FUNC(setUnconscious);
                };*/

                [_unit, _pain] call FUNC(playInjuredSound);
            };
        };
    }, 1, [_unit, ACE_time]] call CBA_fnc_addPerFrameHandler;
};
