#include "script_component.hpp"
/*
 * Author: 10Dozen
 * Handles indication of the applied tourniquets and splints over Stance indicator.
 * Draws an icon if there is at least 1 tourniquet/splint applied.
 *
 * Arguments:
 * 0: Drop indicator <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false] call ace_medical_feedback_fnc_handleTourniquetsAndSplintsIndication
 *
 * Public: No
 */
params [["_dropIndicator", false]];

private _indicatorTourniquetCtrl = uiNamespace getVariable [QGVAR(tourniquetIndicator), controlNull];
private _indicatorSplintCtrl = uiNamespace getVariable [QGVAR(splintIndicator), controlNull];

// --- Removes any indication and exit
if (_dropIndicator) exitWith {
    _indicatorTourniquetCtrl ctrlSetText "";
    _indicatorSplintCtrl ctrlSetText "";
};

private _hasTourniquets = {_x > 0} count GET_TOURNIQUETS(ACE_player) > 0;
private _tourniquetIcon = ["",ICON_TOURNIQUET_PATH] select _hasTourniquets;

private _hasSplints = {_x isEqualTo -1} count GET_FRACTURES(ACE_player) > 0;
private _splintIcon = ["",ICON_SPLINT_PATH] select _hasSplints;

_indicatorTourniquetCtrl ctrlSetText _tourniquetIcon;
_indicatorSplintCtrl ctrlSetText _splintIcon;
