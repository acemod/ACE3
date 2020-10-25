#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Modifies the action color to match the triage level.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ANY>
 * 3: Action Data <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player, [], []] call ace_interaction_fnc_modifyActionTriageLevel
 *
 * Public: No
 */

params ["_target", "_player", "", "_actionData"];
_actionData params ["", "", "_icon"];

private _colorHex = "#FFFFFF";

if (
    (GVAR(interactionMenuShowTriage) == 1) || // anyone
    {(GVAR(interactionMenuShowTriage) == 2) && {[_player] call EFUNC(medical_treatment,isMedic)}} // isMedic
) then {
    switch (_target getVariable [QEGVAR(medical,triageLevel), 0]) do {
        case 0: {};
        case 1: { _colorHex = [TRIAGE_COLOR_MINIMAL] call BIS_fnc_colorRGBtoHTML };
        case 2: { _colorHex = [TRIAGE_COLOR_DELAYED] call BIS_fnc_colorRGBtoHTML };
        case 3: { _colorHex = [TRIAGE_COLOR_IMMEDIATE] call BIS_fnc_colorRGBtoHTML };
        case 4: { _colorHex = [TRIAGE_COLOR_DECEASED]call BIS_fnc_colorRGBtoHTML };
    };
};

_icon set [1, _colorHex];
