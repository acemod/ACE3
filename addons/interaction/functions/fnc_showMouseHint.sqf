#include "script_component.hpp"
/*
 * Author: Garth de Wet (LH), mharis001
 * Shows an interaction hint for mouse buttons.
 * Empty strings will hide their respective button.
 *
 * Arguments:
 * 0: Left click text <STRING>
 * 1: Right click text <STRING>
 * 2: Scroll text <STRING> (default: "")
 * 3: Extra icon/text pairs <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * ["Place Explosive", "Cancel"] call ace_interaction_fnc_showMouseHint
 *
 * Public: No
 */

params ["_textLMB", "_textRMB", ["_textMMB", ""], ["_extraIconSets", []]];

(QGVAR(RscMouseHint) call BIS_fnc_rscLayer) cutRsc [QGVAR(RscMouseHint), "PLAIN", -1, false];
private _display = uiNamespace getVariable [QGVAR(mouseHint), displayNull];

// Set text for buttons, hide if empty string
{
    _x params ["_buttonText", "_iconIDC", "_textIDC"];

    if (_buttonText == "") then {
        private _ctrlIcon = _display displayCtrl _iconIDC;
        _ctrlIcon ctrlShow false;
    } else {
        private _ctrlText = _display displayCtrl _textIDC;
        _ctrlText ctrlSetText _buttonText;
    };
} forEach [
    [_textLMB, IDC_MOUSEHINT_LMB, IDC_MOUSEHINT_LMB_TEXT],
    [_textMMB, IDC_MOUSEHINT_MMB, IDC_MOUSEHINT_MMB_TEXT],
    [_textRMB, IDC_MOUSEHINT_RMB, IDC_MOUSEHINT_RMB_TEXT]
];

// Y offset for extra icon sets
private _yOffset = 19.5;

if (_textMMB == "") then {
    // Move RMB up if MMB inactive
    {
        private _ctrl = _display displayCtrl _x;
        private _ctrlPos = ctrlPosition _ctrl;
        _ctrlPos set [1, (_ctrlPos select 1) - 1.05 * GUI_GRID_H];
        _ctrl ctrlSetPosition _ctrlPos;
        _ctrl ctrlCommit 0;
    } forEach [IDC_MOUSEHINT_RMB, IDC_MOUSEHINT_RMB_TEXT];

} else {
    // Disable action menu
    inGameUISetEventHandler ["PrevAction", "true"];
    inGameUISetEventHandler ["NextAction", "true"];
    inGameUISetEventHandler ["Action", "true"];

    // Increase offset since MMB active
    _yOffset = 20.55;
};

// Create extra icon sets
{
    _x params [["_keyName", "", [""]], ["_keyText", "", [""]]];

    // Only create extra key if both name and text are valid
    if (_keyName != "" && {_keyText != ""}) then {
        // Localize Ctrl, Shift, or Alt keys
        switch (toLower _keyName) do {
            case "ctrl";
            case "control": {_keyName = format ["<%1>", toUpper localize "STR_dik_control"]};
            case "shift": {_keyName = format ["<%1>", toUpper localize "STR_dik_shift"]};
            case "alt": {_keyName = format ["<%1>", toUpper localize "STR_dik_alt"]};
        };

        // Create extra key group and update position
        private _ctrlGroup = _display ctrlCreate [QGVAR(RscExtraKey), IDC_MOUSEHINT_EXTRA];
        _ctrlGroup ctrlSetPosition [0, _yOffset * GUI_GRID_H];
        _ctrlGroup ctrlCommit 0;

        // Set name and text
        private _ctrlName = _ctrlGroup controlsGroupCtrl IDC_MOUSEHINT_EXTRA_NAME;
        _ctrlName ctrlSetText _keyName;

        private _ctrlText = _ctrlGroup controlsGroupCtrl IDC_MOUSEHINT_EXTRA_TEXT;
        _ctrlText ctrlSetText _keyText;

        _yOffset = _yOffset + 1;
    };
} forEach _extraIconSets;
