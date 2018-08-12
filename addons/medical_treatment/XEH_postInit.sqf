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
    if (_target != ACE_player || {_target == _caller} || {!alive _target}) exitWith {};

    // Can't tell who is providing aid when you're unconscious
    private _name = if IS_UNCONSCIOUS(_target) then {
        LLSTRING(UnknownPerson);
    } else {
        name _caller
    };

    QGVAR(notification) cutText [format [LLSTRING(Notification), _name], "PLAIN DOWN"];

    // We track who is currently treating the unit
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders pushBack _caller;
    _target setVariable [QGVAR(responders), _responders];
}] call CBA_fnc_addEventHandler;

// Notification may no longer apply when treatment ends
private _treatmentEnded = {
    params ["_caller", "_target"];

    // Notifications don't make sense for self-healing or when dead
    if (_target != ACE_player || {_target == _caller} || {!alive _target}) exitWith {};

    // Remove from tracking (in place)
    private _responders = _target getVariable [QGVAR(responders), []];
    _responders deleteAt (_responders find _caller);

    // If someone else is still treating it's useful to know
    if (_responders isEqualTo []) then {
        QGVAR(notification) cutFadeOut 1;
    } else {
        private _name = if IS_UNCONSCIOUS(_target) then {
            LLSTRING(UnknownPerson);
        } else {
            name (_responders select 0)
        };
        QGVAR(notification) cutText [format [LLSTRING(Notification2), _name], "PLAIN DOWN"];
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
