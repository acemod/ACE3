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
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_impact", "_part", "_injuryIndex", "_injury", "_bandage"];

private _classID = _injury select 1;
private _bodyPartN = _injury select 2;
private _category = _injury select 6;
private _postfix = ["Minor", "Medium", "Large"] select _category;
private _className = format ["%1%2", EGVAR(medical_damage,woundClassNames) select _classID, _postfix];
        
private _reopeningChance = DEFAULT_BANDAGE_REOPENING_CHANCE;
private _reopeningMinDelay = DEFAULT_BANDAGE_REOPENING_MIN_DELAY;
private _reopeningMaxDelay = DEFAULT_BANDAGE_REOPENING_MAX_DELAY;

// Get the default values for the used bandage
private _config = configFile >> QUOTE(ADDON) >> "Bandaging";

if (isClass (_config >> _bandage)) then {
    _config = _config >> _bandage;
    _reopeningChance = getNumber (_config >> "reopeningChance");
    _reopeningMinDelay = getNumber (_config >> "reopeningMinDelay");
    _reopeningMaxDelay = getNumber (_config >> "reopeningMaxDelay") max _reopeningMinDelay;
} else {
    WARNING_2("No config for bandage [%1] config base [%2]", _bandage, _config);
};

if (isClass (_config >> _className)) then {
    private _woundTreatmentConfig = _config >> _className;

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

private _bandagedWounds = _target getVariable [QEGVAR(medical,bandagedWounds), []];
private _exist = false;
{
    _x params ["", "_id", "_partN", "_amountOf", "_bleeding", "_damage", "_oldCategory"];
    if (_id == _classID && {_partN == _bodyPartN && {_oldCategory == _category}}) exitWith {
        _x set [3, _amountOf + _impact];
        _bandagedWounds set [_forEachIndex, _x];
        _exist = true;
    };
} forEach _bandagedWounds;

if (!_exist) then {
    private _bandagedInjury = +_injury;
    _bandagedInjury set [3, _impact];
    _bandagedWounds pushBack _bandagedInjury;
};

_target setVariable [QEGVAR(medical,bandagedWounds), _bandagedWounds, true];

TRACE_1("",_reopeningChance);
// Check if we are ever going to reopen this
if (random 1 <= _reopeningChance) then {
    private _delay = _reopeningMinDelay + random (_reopeningMaxDelay - _reopeningMinDelay);
    TRACE_1("Will open",_delay);
    [{
        params ["_target", "_impact", "_part", "_injuryIndex", "_injury"];
        TRACE_5("params",_target,_impact,_part,_injuryIndex,_injury);

        private _openWounds = _target getVariable [QEGVAR(medical,openWounds), []];
        if (count _openWounds - 1 < _injuryIndex) exitWith {};

        _injury params ["", "_classID", "_bodyPartN"];
        
        private _selectedInjury = _openWounds select _injuryIndex;
        if (_selectedInjury select 1 == _classID && {_selectedInjury select 2 == _bodyPartN}) then { // matching the IDs
            private _bandagedWounds = _target getVariable [QEGVAR(medical,bandagedWounds), []];
            private _exist = false;
            {
                _x params ["", "_id", "_partN", "_amountOf", "_bleeding", "_damage", "_oldCategory"];
                if (_id == _classID && {_partN == _bodyPartN && {_oldCategory == _category}}) exitWith {
                    _x set [3, 0 max (_amountOf - _impact)];
                    _bandagedWounds set [_forEachIndex, _x];
                    _exist = true;
                };
            } forEach _bandagedWounds;

            if (_exist) then {
                TRACE_2("Reopening Wound",_bandagedWounds,_openWounds);
                _selectedInjury set [3, (_selectedInjury select 3) + _impact];
                _openWounds set [_injuryIndex, _selectedInjury];
                _target setVariable [QEGVAR(medical,bandagedWounds), _bandagedWounds, true];
                _target setVariable [QEGVAR(medical,openWounds), _openWounds, true];
            };
        };
    }, [_target, _impact, _part, _injuryIndex, +_injury], _delay] call CBA_fnc_waitAndExecute;
};
