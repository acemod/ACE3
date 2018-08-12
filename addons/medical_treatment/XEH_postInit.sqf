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

// Notification lets the player known if they're being treated
[QGVAR(initiated), {
    params ["_caller", "_target"];

    // Notifications don't make sense for self-healing or when dead
    if (_target == _caller || {!alive _target}) exitWith {};

    // Tracking who is responding lets us show notifications in future too
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders pushBackUnique _caller;
    _target setVariable [QGVAR(responders), _responders];

    // Player only cares if they are the patient
    if (_target == ACE_player) then {
        // Can't tell who is providing aid when you're unconscious
        private _name = if IS_UNCONSCIOUS(_target) then {
            LLSTRING(UnknownPerson);
        } else {
            name _caller
        };

        QGVAR(notification) cutText [format [LLSTRING(Notification), _name], "PLAIN DOWN"];
    };
}] call CBA_fnc_addEventHandler;

// Notification may no longer apply when treatment ends
private _treatmentEnded = {
    params ["_caller", "_target"];

    // Notifications don't make sense for self-healing or when dead
    if (_target == _caller || {!alive _target}) exitWith {};

    // Update the responder tracking
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders deleteAt (_responders find _caller);
    _responders = _responders - [objNull];
    _target setVariable [QGVAR(responders), _responders];

    // If someone else is still treating it's useful to know
    if (_target == ACE_player) then {
        if (_responders isEqualTo []) then {
            QGVAR(notification) cutFadeOut 1;
        } else {
            private _name = if IS_UNCONSCIOUS(_target) then {
                LLSTRING(UnknownPerson);
            } else {
                name (_responders select 0)
            };
            QGVAR(notification) cutText [
                format [LLSTRING(Notification2), _name],
                "PLAIN DOWN"
            ];
        };
    };
};
[QGVAR(success), _treatmentEnded] call CBA_fnc_addEventHandler;
[QGVAR(failure), _treatmentEnded] call CBA_fnc_addEventHandler;

// A dead patient no longer needs a notification
[QEGVAR(medical,death), {
    params ["_unit"];
    _unit setVariable [QGVAR(responders), nil];
    if (_unit == ACE_player) then {
        QGVAR(notification) cutFadeOut 1;
    };
}] call CBA_fnc_addEventHandler;

// Need to update treatment notification when player switches unit
["unit", {
    params ["_unit"];

    // Immediately hide any old notification
    QGVAR(notification) cutText ["", "PLAIN DOWN"];

    private _responders = _unit getVariable [QGVAR(responders), []];
    _responders = _responders - [objNull];

    // Let the player know if the unit switched to is already being treated
    if (_responders isEqualTo []) then {
        private _name = if IS_UNCONSCIOUS(_unit) then {
            LLSTRING(UnknownPerson);
        } else {
            name (_responders select 0)
        };

        QGVAR(notification) cutText [format [LLSTRING(Notification), _name], "PLAIN DOWN"];
    };
}] call CBA_fnc_addPlayerEventHandler;
