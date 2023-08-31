#include "script_component.hpp"

// Handle pain changes on injury
[QEGVAR(medical,injured), LINKFUNC(adjustPainLevel)] call CBA_fnc_addEventHandler;

// Handle comms status effects for spectator
// Separate from medical_feedback as these affect unit behavior rather than what the player sees
["featureCamera", {
    params ["_unit", "_newCamera"];

    if (_unit isNotEqualTo ACE_player) exitWith {};

    if (_newCamera == "") then { // switched back to player view
        private _status = IS_UNCONSCIOUS(_unit);
        [_unit, _status] call FUNC(setStatusEffects);
    } else {
        [_unit, false, true] call FUNC(setStatusEffects);
    };
}] call CBA_fnc_addPlayerEventHandler;
