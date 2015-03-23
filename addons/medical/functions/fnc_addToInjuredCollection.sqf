/*
 * Author: Glowbal
 * Enabled the vitals loop for a unit.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private "_unit";
_unit = _this select 0;
_force = if (count _this > 1) then {_this select 1} else {false};

if ([_unit] call FUNC(hasMedicalEnabled) || _force) then {

    if !(local _unit) exitwith {
        [[_unit, _force], QUOTE(DFUNC(addToInjuredCollection)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    };

    if ((_unit getvariable[QGVAR(addedToUnitLoop),false] || !alive _unit) && !_force) exitwith{};
    _unit setvariable [QGVAR(addedToUnitLoop), true, true];

    diag_log format["[MEDICAL] Added a unit to loop: %1", _unit];
    [{
        private "_unit";
        _unit = (_this select 0) select 0;
        if (!alive _unit || !local _unit) then {
           [_this select 1] call CBA_fnc_removePerFrameHandler;
           diag_log format["[MEDICAL] Removed a unit from loop: %1", _unit];
           if (!local _unit) then {
                if (GVAR(level) >= 2) then {
                    _unit setvariable [QGVAR(heartRate), _unit getvariable [QGVAR(heartRate), 0], true];
                    _unit setvariable [QGVAR(bloodPressure), _unit getvariable [QGVAR(bloodPressure), [0, 0]], true];
                };
                _unit setvariable [QGVAR(bloodVolume), _unit getvariable [QGVAR(bloodVolume), 0], true];
           };
        } else {
            [_unit] call FUNC(handleUnitVitals);

            private "_pain";
            _pain = _unit getvariable [QGVAR(pain), 0];
            if (_pain > 0) then {
                if (_pain > 0.7 && {random(1) > 0.6}) then {
                    [_unit] call FUNC(setUnconscious);
                };

                [_unit, _pain] call FUNC(playInjuredSound);
            };
        };
    }, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
};
