#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Checks if the given treatment can be performed.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <STRING>
 * 3: Treatment <STRING>
 *
 * Return Value:
 * Can Treat <BOOL>
 *
 * Example:
 * [player, cursorObject, "Head", "SurgicalKit"] call ace_medical_treatment_fnc_canTreat
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart", "_classname"];

private _config = configFile >> QGVAR(actions) >> _classname;

isClass _config
&& {_patient isKindOf "CAManBase"}
&& {_medic != _patient || {GET_NUMBER_ENTRY(_config >> "allowSelfTreatment") == 1}}
&& {[_medic, GET_NUMBER_ENTRY(_config >> "medicRequired")] call FUNC(isMedic)}
&& {[_medic, _patient, _config] call FUNC(canTreat_holsterCheck)}
&& {
    private _selections = getArray (_config >> "allowedSelections") apply {toLower _x};
    "all" in _selections || {_bodyPart in _selections}
} && {
    private _items = getArray (_config >> "items");
    _items isEqualTo [] || {[_medic, _patient, _items] call FUNC(hasItem)}
} && {
    GET_FUNCTION(_condition,_config >> "condition");

    if (_condition isEqualType {}) then {
        if (_condition isEqualTo {}) exitWith {
            _condition = true;
        };
        
        _condition = call _condition;
    };

    _condition
} && {
    switch (GET_NUMBER_ENTRY(_config >> "treatmentLocations")) do {
        case TREATMENT_LOCATIONS_ALL: {true};
        case TREATMENT_LOCATIONS_VEHICLES: {
            IN_MED_VEHICLE(_medic) || {IN_MED_VEHICLE(_patient)}
        };
        case TREATMENT_LOCATIONS_FACILITIES: {
            IN_MED_FACILITY(_medic) || {IN_MED_FACILITY(_patient)}
        };
        case TREATMENT_LOCATIONS_VEHICLES_AND_FACILITIES: {
            IN_MED_VEHICLE(_medic) || {IN_MED_VEHICLE(_patient)} || {IN_MED_FACILITY(_medic)} || {IN_MED_FACILITY(_patient)}
        };
        default {false};
    };
}
