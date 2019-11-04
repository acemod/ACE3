#include "script_component.hpp"
/*
 * Author: Glowbal
 * Update the pain suppression
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Pain Suppress Adjustments <NUMBER>
 * 2: Time since last update <NUMBER>
 * 3: Sync value? <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 0, 1, false] call ace_medical_vitals_fnc_updatePain
 *
 * Public: No
 */

params ["_unit", "_painSupressAdjustment", "_deltaT", "_syncValue"];

// Pain value formula: maximum of
// - most painful open wound * (1 + 0.1 * count of open wounds)
// - most painful bandaged wound * (1 + 0.1 * count of bandaged wounds)
// - most painful stitched wound * (1 + 0.1 * count of stitched wounds)
// - most painful tourniquet

// Pain from wounds
private _woundsPain = selectMax ([
    GET_OPEN_WOUNDS(_unit),
    GET_BANDAGED_WOUNDS(_unit),
    GET_STITCHED_WOUNDS(_unit)
] apply {
    selectMax (_x apply { _x#5 })
});

// Pain from tourniquets
private _tourniquetPain = selectMax (GET_TOURNIQUETS(_unit) apply {
    if (_x > 0 && {CBA_missionTime - _x > 120}) then {
        (CBA_missionTime - _x - 120) * 0.001
    } else {
        0
    };
});

// Pain from other components or mods
private _customPain = selectMax (_unit getVariable [QGVAR(customPain), []] apply { abs _x });

// Update total pain
private _totalPain = selectMax [_woundsPain, _tourniquetPain, _customPain];
_unit setVariable [VAR_PAIN, 0 max _totalPain min 1, _syncValue];

// Pain decay
// Open wounds do not have pain decay
// Closed and bandaged wound pain decays at the same rate (because stitching hurts, too)
// Decaying custom pain sources are positive, non-decaying custom pain is negative

// Bandaged and stitched wounds
{
    {
        _x set [5, 0 max (_x#5 - _deltaT / PAIN_FADE_TIME)];
    } forEach _x;
} forEach [
    GET_BANDAGED_WOUNDS(_unit),
    GET_STITCHED_WOUNDS(_unit)
];

// Custom pain sources
private _customPain = _unit getVariable [QGVAR(customPain), []];
{
    if (_x > 0) then {
        _customPain set [_forEachIndex, 0 max (_x - _deltaT / PAIN_FADE_TIME)];
    };
} forEach _customPain;
// No need to setVariable because array reference


// Handles simple medication pain supppression
if (missionNamespace getVariable [QEGVAR(medical_treatment,advancedMedication), false]) then {
    _unit setVariable [VAR_PAIN_SUPP, 0 max _painSupressAdjustment, _syncValue];
} else {
    private _painSupress = _unit getVariable [VAR_PAIN_SUPP, 0];
    _painSupress = _painSupress - _deltaT / PAIN_SUPPRESSION_FADE_TIME;
    _unit setVariable [VAR_PAIN_SUPP, 0 max _painSupress, _syncValue];
};
