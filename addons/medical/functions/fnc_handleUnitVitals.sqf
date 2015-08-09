/*
 * Author: Glowbal
 * Updates the vitals. Is expected to be called every second.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit", "_heartRate","_bloodPressure","_bloodVolume","_painStatus", "_lastTimeValuesSynced", "_syncValues", "_airwayStatus", "_blood", "_bloodPressureH", "_bloodPressureL", "_interval"];
_unit = _this select 0;
_interval = _this select 1;

if (_interval == 0) exitWith {};

_lastTimeValuesSynced = _unit getvariable [QGVAR(lastMomentValuesSynced), 0];
_syncValues = (ACE_time - _lastTimeValuesSynced >= (10 + floor(random(10))) && GVAR(keepLocalSettingsSynced));
if (_syncValues) then {
    _unit setvariable [QGVAR(lastMomentValuesSynced), ACE_time];
};

_bloodVolume = (_unit getvariable [QGVAR(bloodVolume), 100]) + ([_unit] call FUNC(getBloodVolumeChange));
_bloodVolume = _bloodVolume max 0;

_unit setvariable  [QGVAR(bloodVolume), _bloodVolume, _syncValues];

// Set variables for synchronizing information across the net
if (_bloodVolume < 100) then {
    if ((_bloodVolume < 90 && (GVAR(level) == 2)) || _bloodVolume <= 45) then {
        if (_unit getvariable [QGVAR(hasLostBlood), 0] != 2) then {
            _unit setvariable [QGVAR(hasLostBlood), 2, true];
        };
    } else {
        if (_unit getvariable [QGVAR(hasLostBlood), 0] != 1) then {
            _unit setvariable [QGVAR(hasLostBlood), 1, true];
        };
    }
} else {
    if (_unit getvariable [QGVAR(hasLostBlood), 0] != 0) then {
        _unit setvariable [QGVAR(hasLostBlood), 0, true];
    };
};

if (([_unit] call FUNC(getBloodLoss)) > 0) then {
    if !(_unit getvariable [QGVAR(isBleeding), false]) then {
        _unit setvariable [QGVAR(isBleeding), true, true];
    };
} else {
    if (_unit getvariable [QGVAR(isBleeding), false]) then {
        _unit setvariable [QGVAR(isBleeding), false, true];
    };
};

_painStatus = _unit getvariable [QGVAR(pain), 0];
if (_painStatus > (_unit getvariable [QGVAR(painSuppress), 0])) then {
    if !(_unit getvariable [QGVAR(hasPain), false]) then {
        _unit setvariable [QGVAR(hasPain), true, true];
    };
} else {
    if (_unit getvariable [QGVAR(hasPain), false]) then {
        _unit setvariable [QGVAR(hasPain), false, true];
    };
};

if (GVAR(level) == 1) then {
    // reduce pain
    if (_painStatus > 0) then {
        _unit setVariable [QGVAR(pain), (_painStatus - 0.001 * _interval) max 0, _syncValues];
    };

    // reduce painkillers
    if (_unit getVariable [QGVAR(morphine), 0] > 0) then {
        _unit setVariable [QGVAR(morphine), ((_unit getVariable [QGVAR(morphine), 0]) - 0.0015 * _interval) max 0, _syncValues];
    };

    // bleeding
    _blood = _unit getVariable [QGVAR(bloodVolume), 100];
    if (_blood <= 35 and !(_unit getVariable ["ACE_isUnconscious", false])) then {
        [_unit, true] call FUNC(setUnconscious);
    };
    if (_blood == 0) then {
        [_unit] call FUNC(setDead);
    };
};

// handle advanced medical, with vitals
if (GVAR(level) >= 2) then {
    if (_bloodVolume < 30) exitwith {
        [_unit] call FUNC(setDead);
    };

    if ([_unit] call EFUNC(common,isAwake)) then {
        if (_bloodVolume < 60) then {
            if (random(1) > 0.9) then {
                [_unit, true, 15 + random(20)] call FUNC(setUnconscious);
            };
        };
    };

    // Set the vitals
    _heartRate = (_unit getvariable [QGVAR(heartRate), 80]) + (([_unit] call FUNC(getHeartRateChange)) * _interval);
    _unit setvariable  [QGVAR(heartRate), _heartRate, _syncValues];

    _bloodPressure = [_unit] call FUNC(getBloodPressure);
    _unit setvariable  [QGVAR(bloodPressure), _bloodPressure, _syncValues];

    if (_painStatus > 0 && {_painStatus < 10}) then {
        _painReduce = if (_painStatus > 5) then {0.002} else {0.001};
        _unit setVariable [QGVAR(pain), (_painStatus - _painReduce * _interval) max 0, _syncValues];
    };

    // TODO Disabled until implemented fully
    // Handle airway
    /*if (GVAR(setting_allowAirwayInjuries)) then {
        _airwayStatus = _unit getvariable [QGVAR(airwayStatus), 100];
        if (((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) && !((_unit getvariable [QGVAR(airwaySecured), false]))) then {
            if (_airwayStatus >= 0.5) then {
                _unit setvariable [QGVAR(airwayStatus), _airwayStatus - 0.5 * _interval, _syncValues];
            };
        } else {
            if !((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) then {
                if (_airwayStatus < 100) then {
                    _unit setvariable [QGVAR(airwayStatus), (_airwayStatus + 1.5 * _interval) min 100, _syncValues];
                };
            };
        };
        if (_airwayStatus < 80) then {
            [_unit] call FUNC(setUnconscious);
            if (_airwayStatus <= 0) then {
                [_unit, true] call FUNC(setDead);
            };
        };
    };*/

    // Check vitals for medical status
    // TODO check for in revive state instead of variable
    _bloodPressureL = _bloodPressure select 0;
    _bloodPressureH = _bloodPressure select 1;

    if (!(_unit getvariable [QGVAR(inCardiacArrest),false])) then {
        if (_heartRate < 10 || _bloodPressureH < 30 || _bloodVolume < 20) then {
            [_unit, true, 10+ random(20)] call FUNC(setUnconscious); // safety check to ensure unconsciousness for units if they are not dead already.
        };

        if (_bloodPressureH > 260) then {
            if (random(1) > 0.7) then {
                [_unit] call FUNC(setCardiacArrest);
            };
        };
        if (_bloodPressureL < 40 && _heartRate > 190) then {
            if (random(1) > 0.7) then {
                [_unit] call FUNC(setCardiacArrest);
            };
        };
        if (_bloodPressureH > 145 && _heartRate > 150) then {
            if (random(1) > 0.7) then {
                [_unit] call FUNC(setCardiacArrest);
            };
        };
        if (_heartRate > 200) then {
            [_unit] call FUNC(setCardiacArrest);
        };

        if (_heartRate < 20) then {
            [_unit] call FUNC(setCardiacArrest);
        };
    };

    // syncing any remaining values
    if (_syncValues) then {
        {
            private "_value";
            _value = _unit getvariable _x;
            if !(isnil "_value") then {
                _unit setvariable [_x,(_unit getvariable [_x, 0]), true];
            };
        }foreach GVAR(IVBags);
    };
};
