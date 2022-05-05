#include "script_component.hpp"
/*
 * Author: Brett Mayson
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
 * [cursorObject, player, [], []] call ace_medical_gui_fnc_modifyActionTriageLevel
 *
 * Public: No
 */

params ["_target", "_player", "", "_actionData"];
if (
    GVAR(interactionMenuShowTriage) == 1 // Anyone
    || {GVAR(interactionMenuShowTriage) == 2 && {[_player] call EFUNC(medical_treatment,isMedic)}} // Medics & Doctors
) then {
    private _colorHex = switch (_target getVariable [QEGVAR(medical,triageLevel), 0]) do {
        case 1: {
            [TRIAGE_COLOR_MINIMAL] call BIS_fnc_colorRGBtoHTML
        };
        case 2: {
            [TRIAGE_COLOR_DELAYED] call BIS_fnc_colorRGBtoHTML
        };
        case 3: {
            [TRIAGE_COLOR_IMMEDIATE] call BIS_fnc_colorRGBtoHTML
        };
        case 4: {
            [TRIAGE_COLOR_DECEASED] call BIS_fnc_colorRGBtoHTML
        };
        default {
            "#FFFFFF"
        };
    };

    _actionData params ["", "", "_icon"];
    _icon set [1, _colorHex];
};
