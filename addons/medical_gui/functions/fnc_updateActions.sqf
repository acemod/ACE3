#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Updates the action buttons based currently available treatments.
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
    _x params ["_displayName", "_category", "_condition", "_statement", "_items"];

    // Check action category and condition
    if (_category == _selectedCategory && {call _condition}) then {
        if (_shownIndex >= count _actionButons) then {
            _actionButons pushBack (_display ctrlCreate ["ACE_Medical_Menu_ActionButton", -1, _group]);
        };
        private _ctrl = _actionButons # _shownIndex;
        _ctrl ctrlRemoveAllEventHandlers "ButtonClick";
        _ctrl ctrlSetPositionY POS_H(1.1 * _shownIndex);
        _ctrl ctrlCommit 0;

        private _countText = "";
        if (_items isNotEqualTo []) then {
            if ("ACE_surgicalKit" in _items && {EGVAR(medical_treatment,consumeSurgicalKit) == 2}) then {
                _items = ["ACE_suture"];
            };
            private _counts = [_items] call FUNC(countTreatmentItems);
            _countText = _counts call FUNC(formatItemCounts);
        };
        _ctrl ctrlSetTooltipColorText [1, 1, 1, 1];
        _ctrl ctrlSetTooltip _countText;

        // Show warning if tourniquet will interfere with action
        if (
            GVAR(tourniquetWarning) &&
            {(_category in ["examine", "medication"]) || (_items findIf {"IV" in _x}) > -1} &&
            {HAS_TOURNIQUET_APPLIED_ON(GVAR(target),GVAR(selectedBodyPart))}
        ) then {
            _ctrl ctrlSetTooltipColorText [1, 1, 0, 1];
            _ctrl ctrlSetTooltip LLSTRING(TourniquetWarning);
        };

        _ctrl ctrlSetText _displayName;
        _ctrl ctrlShow true;

        _ctrl ctrlAddEventHandler ["ButtonClick", _statement];
        _ctrl ctrlAddEventHandler ["ButtonClick", {GVAR(pendingReopen) = true}];

        _shownIndex = _shownIndex + 1;
    };
} forEach GVAR(actions);

{ ctrlDelete _x } forEach (_actionButons select [_shownIndex, 9999]);
