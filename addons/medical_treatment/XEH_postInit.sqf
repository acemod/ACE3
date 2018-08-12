#include "script_component.hpp"

[QEGVAR(medical,initialized), FUNC(checkItems)] call CBA_fnc_addEventHandler;
["loadout", FUNC(checkItems)] call CBA_fnc_addPlayerEventHandler;

// Handle bodybags and litter on server
if (isServer) then {
    [QGVAR(createLitterServer), FUNC(litterHandleCreate)] call CBA_fnc_addEventHandler;
    ["ace_placedInBodyBag", FUNC(serverRemoveBody)] call CBA_fnc_addEventHandler;
};

// treatment events
[QGVAR(treatmentBandageLocal), FUNC(treatmentBandageLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentTourniquetLocal), FUNC(treatmentTourniquetLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentMedicationLocal), FUNC(treatmentMedicationLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentIVLocal), FUNC(treatmentIVLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentCPRLocal), FUNC(treatmentCPRLocal)] call CBA_fnc_addEventHandler;
[QGVAR(treatmentFullHealLocal), FUNC(treatmentFullHealLocal)] call CBA_fnc_addEventHandler;

// action events
[QGVAR(actionCheckPulseLocal), FUNC(actionCheckPulseLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionCheckBloodPressureLocal), FUNC(actionCheckBloodPressureLocal)] call CBA_fnc_addEventHandler;
[QGVAR(actionPlaceInBodyBag), FUNC(actionPlaceInBodyBag)] call CBA_fnc_addEventHandler;

// Track the players treating the patient
[QGVAR(initiated), {
    params ["_caller", "_target"];

    // Add the new responder
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders pushBackUnique _caller;
    _target setVariable [QGVAR(responders), _responders];

    // If patient is the player a notification event occurs
    if (_target == ACE_player) then {
        [QEGVAR(medical_feedback,treatment_initiated), [_caller, _target]] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;

// Remove tracked players when they stop treating
private _treatmentEnded = {
    params ["_caller", "_target"];

    // Remove the old responder
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders deleteAt (_responders find _caller);

    // If a player disconnects and their unit is deleted the treatment has stopped
    // If a player disconnects and their unit becomes AI the treatment has stopped
    // (medical_ai has it's own treatment logic)
    _responders = _responders select {
        !isNull _x &&
        {[_x] call EFUNC(common,isPlayer)}
    };
    _target setVariable [QGVAR(responders), _responders];

    // If patient is the player a notification event occurs
    if (_target == ACE_player) then {
        [
            QEGVAR(medical_feedback,treatment_ended),
            [_caller, _target, _responders]
        ] call CBA_fnc_localEvent;
    };
};
[QGVAR(success), _treatmentEnded] call CBA_fnc_addEventHandler;
[QGVAR(failure), _treatmentEnded] call CBA_fnc_addEventHandler;

// We stop tracking who is treating a dead patient
[QEGVAR(medical,death), {
    params ["_unit"];
    _unit setVariable [QGVAR(responders), nil];
}] call CBA_fnc_addEventHandler;

// Update the responders array upon switching unit
["unit", {
    params ["_unit"];

    // See comments in _treatmentEnded for details
    private _responders = _unit getVariable [QGVAR(responders), []];
    _responders = _responders select {
        !isNull _x &&
        {[_x] call EFUNC(common,isPlayer)}
    };
    _unit setVariable [QGVAR(responders), _responders];

    // Raise a notification event if the unit switched to is already being treated
    if !(_responders isEqualTo []) then {
        [
            QEGVAR(medical_feedback,treatment_initiated),
            [_responders select 0, _unit]
        ] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addPlayerEventHandler;
