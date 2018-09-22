#include "script_component.hpp"
/*
 * Author: Glowbal
 * Handles the bandage of a patient.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: The impact <NUMBER>
 * 2: Selection part number <NUMBER>
 * 3: Injury index <NUMBER>
 * 4: Injury <ARRAY>
 * 5: Used Bandage type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 5, 5, 1, [injury], "bandage"] call ACE_medical_fnc_handleBandageOpening
 *
 * Public: No
 */

params ["_target", "_impact", "_part", "_injuryIndex", "_injury", "_bandage"];

private _classID = _injury select 1;
private _className = GVAR(woundClassNames) select _classID;

// default, just in case..
private _reopeningChance = 0.1;
private _reopeningMinDelay = 120;
private _reopeningMaxDelay = 200;

// Get the default values for the used bandage
private _config = (ConfigFile >> "ACE_Medical_Advanced" >> "Treatment" >> "Bandaging");
if (isClass (_config >> _bandage)) then {
    _config = (_config >> _bandage);
    _reopeningChance = getNumber (_config >> "reopeningChance");
    _reopeningMinDelay = getNumber (_config >> "reopeningMinDelay");
    _reopeningMaxDelay = getNumber (_config >> "reopeningMaxDelay") max _reopeningMinDelay;
} else {
    WARNING_2("No config for bandage [%1] config base [%2]", _bandage, _config);
};

if (isClass (_config >> _className)) then {
    private _woundTreatmentConfig = (_config >> _className);
    if (isNumber (_woundTreatmentConfig >> "reopeningChance")) then {
        _reopeningChance = getNumber (_woundTreatmentConfig >> "reopeningChance");
    };
    if (isNumber (_woundTreatmentConfig >> "reopeningMinDelay")) then {
        _reopeningMinDelay = getNumber (_woundTreatmentConfig >> "reopeningMinDelay");
    };
    if (isNumber (_woundTreatmentConfig >> "reopeningMaxDelay")) then {
        _reopeningMaxDelay = getNumber (_woundTreatmentConfig >> "reopeningMaxDelay") max _reopeningMinDelay;
    };
} else {
    WARNING_2("No config for wound type [%1] config base [%2]", _className, _config);
};
TRACE_5("configs",_bandage,_className,_reopeningChance,_reopeningMinDelay,_reopeningMaxDelay);

private _bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];
private _injuryType = _injury select 1;
private _exist = false;
private _bandagedInjury = [];
{
    if ((_x select 1) == _injuryType && (_x select 2) == (_injury select 2)) exitwith {
        _exist = true;
        private _existingInjury = _x;
        _existingInjury set [3, (_existingInjury select 3) + _impact];
        _bandagedWounds set [_foreachIndex, _existingInjury];

        _bandagedInjury = _existingInjury;
    };
} foreach _bandagedWounds;

if !(_exist) then {
    // [ID, classID, bodypart, percentage treated, bloodloss rate]
    _bandagedInjury = [_injury select 0, _injury select 1, _injury select 2, _impact, _injury select 4];
    _bandagedWounds pushback _bandagedInjury;
};

_target setVariable [QGVAR(bandagedWounds), _bandagedWounds, true];

TRACE_1("",_reopeningChance);
// Check if we are ever going to reopen this
if (random(1) <= _reopeningChance) then {
    private _delay = _reopeningMinDelay + random(_reopeningMaxDelay - _reopeningMinDelay);
    TRACE_1("Will open",_delay);
    [{
        params ["_target", "_impact", "_part", "_injuryIndex", "_injury"];
        TRACE_5("params",_target,_impact,_part,_injuryIndex,_injury);

        //if (alive _target) then {
            private _openWounds = _target getVariable [QGVAR(openWounds), []];
            if ((count _openWounds) - 1 < _injuryIndex) exitwith {};
            private _selectedInjury = _openWounds select _injuryIndex;
            if (_selectedInjury select 1 == _injury select 1 && (_selectedInjury select 2) == (_injury select 2)) then { // matching the IDs

                private _bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];
                private _exist = false;
                private _injuryId = _injury select 1;
                {
                    if ((_x select 1) == _injuryId && (_x select 2) == (_injury select 2)) exitwith {
                        _exist = true;
                        private _existingInjury = _x;
                        _existingInjury set [3, ((_existingInjury select 3) - _impact) max 0];
                        _bandagedWounds set [_foreachIndex, _existingInjury];
                    };
                } foreach _bandagedWounds;

                if (_exist) then {
                    TRACE_2("Reopening Wound",_bandagedWounds,_openWounds);
                    _selectedInjury set [3, (_selectedInjury select 3) + _impact];
                    _openWounds set [_injuryIndex, _selectedInjury];
                    _target setVariable [QGVAR(bandagedWounds), _bandagedWounds, true];
                    _target setVariable [QGVAR(openWounds), _openWounds, true];
                };
            };
            // Otherwise something went wrong, we we don't reopen them..
       //};
    }, [_target, _impact, _part, _injuryIndex, +_injury], _delay] call CBA_fnc_waitAndExecute;
};
