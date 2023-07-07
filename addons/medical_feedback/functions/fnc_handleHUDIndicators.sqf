#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handles indication of the fractures, applied tourniquets and splints over Stance indicator.
 * Draws an icon if there is at least 1 fracture/splint/tourniquet applied.
 *
 * Arguments:
 * 0: Flag to drop all indicators (optional) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_medical_feedback_fnc_handleHUDIndicators
 *
 * Public: No
 */
params [["_dropAllIndicators", false]];

private _indicatorSlots = [
    uiNamespace getVariable [QGVAR(stateIndicator1), controlNull],
    uiNamespace getVariable [QGVAR(stateIndicator2), controlNull],
    uiNamespace getVariable [QGVAR(stateIndicator3), controlNull]
];

// --- Removes any indication and exit
if (_dropAllIndicators) exitWith {
    {
        _x ctrlSetText "";
    } forEach _indicatorSlots;
};

// --- Tourniquets
private _hasTourniquets = GET_TOURNIQUETS(ACE_player) findIf {_x > 0} > -1;
private _tourniquetIcon = ["", ICON_TOURNIQUET_PATH] select _hasTourniquets;

// --- Fractures and Splints
private _fractureSettings = EGVAR(medical,fractures);
private _fractureIcon = "";
private _splintIcon = "";

if (_fractureSettings > 0) then {
    // --- Fractures enabled: check for fracture indication
    private _hasFractures = GET_FRACTURES(ACE_player) findIf {_x > 0} > -1;
    _fractureIcon = ["", ICON_FRACTURE_PATH] select _hasFractures;

    if (_fractureSettings > 1) then {
        // --- Fractures can not be fully healed: check for splint indication
        private _hasSplints = GET_FRACTURES(ACE_player) findIf {_x == -1} > -1;
        _splintIcon = ["", ICON_SPLINT_PATH] select _hasSplints;
    };
};

// --- Get prioritized list of icons to apply
private _icons = [
    _fractureIcon,
    _tourniquetIcon,
    _splintIcon
] select {_x isNotEqualTo ""};

// --- Apply icons to indicator slots, if no icon for slot - remove slot's text
{
    _x ctrlSetText (_icons param [_forEachIndex, ""]);
} forEach _indicatorSlots;
