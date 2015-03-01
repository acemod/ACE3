/**
 * fn_handleUnitVitals.sqf
 * @Descr: Updates the vitals. Is expected to be called every second.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: void
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_heartRate","_bloodPressure","_bloodVolume","_painStatus"];
_unit = _this select 0;

_bloodVolume = ([_unit, QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) + ([_unit] call FUNC(getBloodVolumeChange));
if (_bloodVolume <= 0) then {
    _bloodVolume = 0;
};
_unit setvariable  [QGVAR(bloodVolume), _bloodVolume];


// Set variables for synchronizing information across the net
if (_bloodVolume < 90) then {
    if !(_unit getvariable [QGVAR(hasLostBlood), false]) then {
        _unit setvariable [QGVAR(hasLostBlood), true, true];
    };
} else {
    if (_unit getvariable [QGVAR(hasLostBlood),false]) then {
        _unit setvariable [QGVAR(hasLostBlood), false, true];
    };
};

if ((_unit call FUNC(getBloodLoss)) > 0) then {
    if !(_unit getvariable [QGVAR(isBleeding), false]) then {
        _unit setvariable [QGVAR(isBleeding), true, true];
    };
} else {
    if (_unit getvariable [QGVAR(isBleeding), false]) then {
        _unit setvariable [QGVAR(isBleeding), false, true];
    };
};

_painStatus = [_unit,QGVAR(amountOfPain),0] call EFUNC(common,getDefinedVariable);
if (_painStatus > 0) then {
    if !(_unit getvariable [QGVAR(hasPain), false]) then {
        _unit setvariable [QGVAR(hasPain), true, true];
    };
} else {
    if (_unit getvariable [QGVAR(hasPain), false]) then {
        _unit setvariable [QGVAR(hasPain), false, true];
    };
};


if (_bloodVolume < 30) exitwith {
    [_unit] call FUNC(setDead);
};

if ([_unit] call EFUNC(common,isAwake)) then {
    if (_bloodVolume < 60) then {
        if (random(1) > 0.9) then {
            [_unit] call FUNC(setUnconsciousState);
        };
    };
};

// handle advanced medical, with vitals
if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) > 0) exitwith {

    // Set the vitals
    _heartRate = ([_unit, QGVAR(heartRate)] call EFUNC(common,getDefinedVariable)) + ([_unit] call FUNC(getHeartRateChange));
    _unit setvariable  [QGVAR(heartRate), _heartRate];

    _bloodPressure = [_unit] call FUNC(getBloodPressure);
    _unit setvariable  [QGVAR(bloodPressure), _bloodPressure];

    // Handle airway
    if (GVAR(setting_allowAirwayInjuries)) then {
        _airwayStatus = _unit getvariable [QGVAR(airwayStatus), 100];
        if (((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) && !((_unit getvariable [QGVAR(airwaySecured), false]))) then {
            if (_airwayStatus >= 0.5) then {
                _unit setvariable [QGVAR(airwayStatus), _airwayStatus - 0.5];
            };
        } else {
            if !((_unit getvariable [QGVAR(airwayOccluded), false]) || (_unit getvariable [QGVAR(airwayCollapsed), false])) then {
                if (_airwayStatus <= 98.5) then {
                    _unit setvariable [QGVAR(airwayStatus), _airwayStatus + 1.5];
                };
            };
        };
    };

    // Check vitals for medical status
    // TODO check for in revive state instead of variable
    if ((_unit getvariable[QEGVAR(common,ENABLE_REVIVE_SETDEAD),0]) == 0) then {
        _bloodPressureL = _bloodPressure select 0;
        _bloodPressureH = _bloodPressure select 1;

        if (!(_unit getvariable [QGVAR(inCardiacArrest),false])) then {
            if (_heartRate < 10 || _bloodPressureH < 30 || _bloodVolume < 20) then {
                [_unit] call FUNC(setUnconsciousState); // safety check to ensure unconsciousness for units if they are not dead already.
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
    };
};
