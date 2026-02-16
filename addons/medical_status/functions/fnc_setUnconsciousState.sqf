#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Sets a unit in the unconscious state.
 * For Internal Use: Called from the state machine.
 *
 * Arguments:
 * 0: The unit that will be put in an unconscious state <OBJECT>
 * 1: Set unconscious <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_medical_status_fnc_setUnconsciousState
 *
 * Public: No
 */

params ["_unit", "_active"];
TRACE_2("setUnconsciousState",_unit,_active);

// No change to make
if (_active isEqualTo IS_UNCONSCIOUS(_unit) || {!alive _unit}) exitWith { TRACE_2("no change",_active,IS_UNCONSCIOUS(_unit)); };

_unit setVariable [VAR_UNCON, _active, true];

// Toggle unit ragdoll state
[_unit, _active] call EFUNC(medical_engine,setUnconsciousAnim);

// Handle hiding from AI and talking blocks.
[_unit, _active] call FUNC(setStatusEffects);

if (_active) then {
    // Don't bother setting this if not used
    if (EGVAR(medical,spontaneousWakeUpChance) > 0) then {
        private _lastWakeUpCheck = _unit getVariable [QEGVAR(medical,lastWakeUpCheck), 0]; // could be set higher from ace_medical_fnc_setUnconscious
        TRACE_2("setting lastWakeUpCheck to max of",_lastWakeUpCheck,CBA_missionTime);
        _unit setVariable [QEGVAR(medical,lastWakeUpCheck), _lastWakeUpCheck max CBA_missionTime];
    };

    if (_unit == ACE_player) then {
        if (visibleMap) then {openMap false};

        while {dialog} do {
            closeDialog 0;
        };

        if (EGVAR(medical,dropWeaponUnconsciousChance) != 0 && {random 1 <= EGVAR(medical,dropWeaponUnconsciousChance)}) then {
            _unit call EFUNC(common,throwWeapon);
        };
    };

    // Unlock controls for copilot if unit is pilot of aircraft
    if (vehicle _unit isKindOf "Air" && {_unit == driver vehicle _unit}) then {
        TRACE_1("pilot of air vehicle - unlocking controls",vehicle _unit);
        // Do "Unlock controls" user action, co-pilot will then have to do the "Take Controls" actions
        _unit action ["UnlockVehicleControl", vehicle _unit];
    };

    // Disable AI talking (yes, this needs to be explicit)
    if (!isPlayer _unit && {_unit checkAIFeature "RADIOPROTOCOL"}) then {
        _unit disableAI "RADIOPROTOCOL";
        _unit setVariable [QGVAR(reenableRadioProtocol), true, true];
    };
} else {
    // Unit has woken up, no longer need to track this
    _unit setVariable [QEGVAR(medical,lastWakeUpCheck), nil];

    if (_unit getVariable [QGVAR(reenableRadioProtocol), false]) then {
        _unit enableAI "RADIOPROTOCOL";
    };

    if (_unit == ACE_player) then {
        switch EGVAR(medical,windowOnWakeUp) do {
            case 1: { // Focus
                "ace" callExtension ["window:focus", []];
            };
            case 2: { // Flash
                "ace" callExtension ["window:flash", []];
            };
        };
    };
};

// This event doesn't correspond to unconscious in statemachine
// It's for any time a unit changes consciousness (including cardiac arrest)
["ace_unconscious", [_unit, _active]] call CBA_fnc_globalEvent;
