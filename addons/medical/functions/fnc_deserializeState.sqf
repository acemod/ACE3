#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Deserializes the medical state of a unit and applies it.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: State as JSON <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, _json] call ace_medical_fnc_deserializeState
 *
 * Public: Yes
 */
params [["_unit", objNull, [objNull]], ["_json", "{}", [""]]];

// Don't run in scheduled environment
if (canSuspend) exitWith {
    [FUNC(deserializeState), _this] call CBA_fnc_directCall
};

if (isNull _unit) exitWith {};
if (!local _unit) exitWith { ERROR_1("unit [%1] is not local",_unit) };

// If unit is not initialized yet, wait until event is raised
if !(_unit getVariable [QGVAR(initialized), false]) exitWith {
    [QEGVAR(medical_status,initialized), {
        params ["_unit"];
        _thisArgs params ["_target"];

        if (_unit == _target) then {
            _thisArgs call FUNC(deserializeState);
            [_thisType, _thisId] call CBA_fnc_removeEventHandler;
        };
    }, _this] call CBA_fnc_addEventHandlerArgs;
};

private _state = [_json] call CBA_fnc_parseJSON;

// Migration from old array wounding storage serialized in old versions (<= 3.16.0)
{
    if ((_state getVariable [_x, createHashMap]) isEqualType []) then {
        private _migratedWounds = createHashMap;

        {
            _x params ["_class", "_bodyPartIndex", "_amountOf", "_bleeding", "_damage"];

            private _partWounds = _migratedWounds getOrDefault [ALL_BODY_PARTS select _bodyPartIndex, [], true];
            _partWounds pushBack [_class, _amountOf, _bleeding, _damage];
        } forEach (_state getVariable _x);

        _state setVariable [_x, _migratedWounds];
    };
} forEach [VAR_OPEN_WOUNDS, VAR_BANDAGED_WOUNDS, VAR_STITCHED_WOUNDS];

// Set medical variables
{
    _x params ["_var", "_default"];
    private _value = _state getVariable _x;

    // Handle wound hashmaps deserialized as CBA_namespaces
    if (typeName _value == "LOCATION") then {
        private _keys = allVariables _value;
        private _values = _keys apply {_value getVariable _x};
        _value = _keys createHashMapFromArray _values;
    };

    // Treat null as nil
    if (_value isEqualTo objNull) then {
        _value = _default;
    };

    _unit setVariable [_var, _value, true];
} forEach [
    [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME],
    [VAR_HEART_RATE, DEFAULT_HEART_RATE],
    [VAR_BLOOD_PRESS, [80, 120]],
    [VAR_PERIPH_RES, DEFAULT_PERIPH_RES],
    // State transition should handle this
    // [VAR_CRDC_ARRST, false],
    [VAR_HEMORRHAGE, 0],
    [VAR_PAIN, 0],
    [VAR_IN_PAIN, false],
    [VAR_PAIN_SUPP, 0],
    [VAR_OPEN_WOUNDS, createHashMap],
    [VAR_BANDAGED_WOUNDS, createHashMap],
    [VAR_STITCHED_WOUNDS, createHashMap],
    [VAR_FRACTURES, DEFAULT_FRACTURE_VALUES],
    // State transition should handle this
    // [VAR_UNCON, false],
    [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES],
    [QEGVAR(medical,occludedMedications), nil],
    [QEGVAR(medical,ivBags), nil],
    [QEGVAR(medical,triageLevel), 0],
    [QEGVAR(medical,triageCard), []],
    [VAR_BODYPART_DAMAGE, DEFAULT_BODYPART_DAMAGE_VALUES]
    // Offset needs to be converted
    // [VAR_MEDICATIONS, []]
];

// Reset timers
_unit setVariable [QEGVAR(medical,lastWakeUpCheck), nil];

// Convert medications offset to time
private _medications = _state getVariable [VAR_MEDICATIONS, []];
{
    _x set [1, _x#1 + CBA_missionTime];
} forEach _medications;
_unit setVariable [VAR_MEDICATIONS, _medications, true];

// Update effects
[_unit] call EFUNC(medical_engine,updateDamageEffects);
[_unit] call EFUNC(medical_status,updateWoundBloodLoss);

// Transition within statemachine
private _currentState = [_unit, GVAR(STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState;
private _targetState = _state getVariable [QGVAR(statemachineState), "Default"];
[_unit, GVAR(STATE_MACHINE), _currentState, _targetState] call CBA_statemachine_fnc_manualTransition;

// Manually call wake up tranisition if necessary
if (_currentState in ["Unconscious", "CardiacArrest"] && {_targetState in ["Default", "Injured"]}) then {
    [_unit, false] call EFUNC(medical_status,setUnconsciousState);
};

// Manually activate if non-defaults are present
[_unit] call EFUNC(medical_engine,checkForMedicalActivity);

[QGVAR(deserialize), [_unit, _state]] call CBA_fnc_localEvent;

_state call CBA_fnc_deleteNamespace;
