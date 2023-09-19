#include "script_component.hpp"
/*
 * Author: mharis001
 * Updates the action buttons based currently avaiable treatments.
 *
 * Arguments:
 * 0: Medical Menu display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call ace_medical_gui_fnc_updateActions
 *
 * Public: No
 */

params ["_display"];

private _selectedCategory = GVAR(selectedCategory);

private _group = _display displayCtrl IDC_ACTION_BUTTON_GROUP;
private _actionButons = allControls _group;

// Handle triage list (no actions shown)
private _ctrlTriage = _display displayCtrl IDC_TRIAGE_CARD;
private _showTriage = _selectedCategory == "triage";
_ctrlTriage ctrlEnable _showTriage;
_group ctrlEnable !_showTriage;

lbClear _ctrlTriage;

if (_showTriage) exitWith {
    { ctrlDelete _x } forEach _actionButons;
    [_ctrlTriage, GVAR(target)] call FUNC(updateTriageCard);
};

// Show treatment options on action buttons
private _shownIndex = 0;
{
    _x params ["_displayName", "_category", "_condition", "_statement"];

    // Check action category and condition
    if (_category == _selectedCategory && {call _condition}) then {
        private _ctrl = if (_shownIndex >= count _actionButons) then {
            _actionButons pushBack (_display ctrlCreate ["ACE_Medical_Menu_ActionButton", -1, _group]);
        };
        _ctrl = _actionButons # _shownIndex;
        _ctrl ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrl ctrlSetPositionY POS_H(1.1 * _shownIndex);
        _ctrl ctrlCommit 0;

        _ctrl ctrlSetText _displayName;
        _ctrl ctrlShow true;

        _ctrl ctrlAddEventHandler ["ButtonClick", _statement];
        _ctrl ctrlAddEventHandler ["ButtonClick", {GVAR(pendingReopen) = true}];

        _shownIndex = _shownIndex + 1;
    };
} forEach GVAR(actions);

{ ctrlDelete _x } forEach (_actionButons select [_shownIndex, 9999]);
