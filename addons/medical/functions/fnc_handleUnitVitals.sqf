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

private ["_heartRate","_bloodPressure","_bloodVolume","_painStatus", "_lastTimeValuesSynced", "_syncValues", "_airwayStatus", "_blood"];
params ["_unit", "_interval"];
TRACE_3("ACE_DEBUG",_unit,_interval,_unit);
if (_interval == 0) exitWith {};

_lastTimeValuesSynced = _unit getVariable [QGVAR(lastMomentValuesSynced), 0];
_syncValues = (ACE_time - _lastTimeValuesSynced >= (10 + floor(random(10))) && GVAR(keepLocalSettingsSynced));
if (_syncValues) then {
    _unit setVariable [QGVAR(lastMomentValuesSynced), ACE_time];
};

_bloodVolume = (_unit getVariable [QGVAR(bloodVolume), 100]) + ([_unit] call FUNC(getBloodVolumeChange));
_bloodVolume = _bloodVolume max 0;

_unit setVariable  [QGVAR(bloodVolume), _bloodVolume, _syncValues];

TRACE_3("ACE_DEBUG",_bloodVolume,_syncValues,_unit);
// Set variables for synchronizing information across the net
if (_bloodVolume < 100) then {
    if ((_bloodVolume < 90 && (GVAR(level) == 2)) || _bloodVolume <= 45) then {
        TRACE_4("ACE_DEBUG_ADVANCED",_bloodVolume,_unit getVariable QGVAR(hasLostBlood),_syncValues,_unit);
        if (_unit getVariable [QGVAR(hasLostBlood), 0] != 2) then {
            _unit setVariable [QGVAR(hasLostBlood), 2, true];
        };
    } else {
        TRACE_4("ACE_DEBUG", _bloodVolume,_unit getVariable QGVAR(hasLostBlood),_syncValues,_unit);
        if (_unit getVariable [QGVAR(hasLostBlood), 0] != 1) then {
            _unit setVariable [QGVAR(hasLostBlood), 1, true];
        };
    }
} else {
    TRACE_4("ACE_DEBUG",_bloodVolume,_unit getVariable QGVAR(hasLostBlood),_syncValues,_unit);
    if (_unit getVariable [QGVAR(hasLostBlood), 0] != 0) then {
        _unit setVariable [QGVAR(hasLostBlood), 0, true];
    };
};

TRACE_3("ACE_DEBUG",[_unit] call FUNC(getBloodLoss),_unit getVariable QGVAR(isBleeding),_unit);
if (([_unit] call FUNC(getBloodLoss)) > 0) then {
    if !(_unit getVariable [QGVAR(isBleeding), false]) then {
        _unit setVariable [QGVAR(isBleeding), true, true];
    };
} else {
    if (_unit getVariable [QGVAR(isBleeding), false]) then {
        _unit setVariable [QGVAR(isBleeding), false, true];
    };
};

_painStatus = _unit getVariable [QGVAR(pain), 0];
TRACE_4("ACE_DEBUG",_painStatus,_unit getVariable QGVAR(hasPain),_unit getVariable QGVAR(painSuppress),_unit);
if (_painStatus > (_unit getVariable [QGVAR(painSuppress), 0])) then {
    if !(_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), true, true];
    };
} else {
    if (_unit getVariable [QGVAR(hasPain), false]) then {
        _unit setVariable [QGVAR(hasPain), false, true];
    };
};

if (GVAR(level) == 1) then {
    TRACE_5("ACE_DEBUG_BASIC_VITALS",_painStatus,_unit getVariable QGVAR(hasPain),_unit getVariable QGVAR(morphine),_syncValues,_unit);
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
    TRACE_6("ACE_DEBUG_ADVANCED_VITALS",_painStatus,_bloodVolume, _unit getVariable QGVAR(hasPain),_unit getVariable QGVAR(morphine),_syncValues,_unit);
    if (_bloodVolume < 30) exitWith {
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
    _heartRate = (_unit getVariable [QGVAR(heartRate), 80]) + (([_unit] call FUNC(getHeartRateChange)) * _interval);
    _unit setVariable  [QGVAR(heartRate), _heartRate max 0, _syncValues];

    _bloodPressure = [_unit] call FUNC(getBloodPressure);
    _unit setVariable  [QGVAR(bloodPressure), _bloodPressure, _syncValues];

    if (_painStatus > 0 && {_painStatus < 10}) then {
        _painReduce = if (_painStatus > 5) then {0.002} else {0.001};
        _unit setVariable [QGVAR(pain), (_painStatus - _painReduce * _interval) max 0, _syncValues];
    };
    TRACE_8("ACE_DEBUG_ADVANCED_VITALS",_painStatus,_painReduce,_heartRate,_bloodVolume,_bloodPressure,_interval,_syncValues,_unit);
    // TODO Disabled until implemented fully
    // Handle airway
    /*if (GVAR(setting_allowAirwayInjuries)) then {
        _airwayStatus = _unit getVariable [QGVAR(airwayStatus), 100];
        if (((_unit getVariable [QGVAR(airwayOccluded), false]) || (_unit getVariable [QGVAR(airwayCollapsed), false])) && !((_unit getVariable [QGVAR(airwaySecured), false]))) then {
            if (_airwayStatus >= 0.5) then {
                _unit setVariable [QGVAR(airwayStatus), _airwayStatus - 0.5 * _interval, _syncValues];
            };
        } else {
            if !((_unit getVariable [QGVAR(airwayOccluded), false]) || (_unit getVariable [QGVAR(airwayCollapsed), false])) then {
                if (_airwayStatus < 100) then {
                    _unit setVariable [QGVAR(airwayStatus), (_airwayStatus + 1.5 * _interval) min 100, _syncValues];
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
    _bloodPressure params ["_bloodPressureL", "_bloodPressureH"];

    if (!(_unit getVariable [QGVAR(inCardiacArrest),false])) then {
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
        TRACE_3("ACE_DEBUG_IVBAGS_SYNC",GVAR(IVBags),_syncValues,_unit);
        {
            private "_value";
            _value = _unit getVariable _x;
            if !(isNil "_value") then {
                _unit setVariable [_x,(_unit getVariable [_x, 0]), true];
            };
        } forEach GVAR(IVBags);
    };
};
