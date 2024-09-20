#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles selection changes on loadouts panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Loadouts panel control <CONTROL>
 * 2: Currently selected loadout's index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel"];

private _shareButtonCtrl = _display displayCtrl IDC_buttonShare;
private _saveButtonCtrl = _display displayCtrl IDC_buttonSave;
private _loadButtonCtrl = _display displayCtrl IDC_buttonLoad;
private _deleteButtonCtrl = _display displayCtrl IDC_buttonDelete;
private _renameButtonCtrl = _display displayCtrl IDC_buttonRename;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;

// If nothing selected, disable all buttons
if (_curSel == -1) exitWith {
    if (GVAR(currentLoadoutsTab) == IDC_buttonSharedLoadouts) then {
        _saveButtonCtrl ctrlEnable false;
        _saveButtonCtrl ctrlCommit 0;
    };

    _shareButtonCtrl ctrlSetText LLSTRING(buttonSharePrivateText);

    {
        _x ctrlEnable false;
        _x ctrlCommit 0;
    } forEach [_shareButtonCtrl, _loadButtonCtrl, _renameButtonCtrl, _deleteButtonCtrl];
};

switch (GVAR(currentLoadoutsTab)) do {
    // Local loadouts
    case IDC_buttonMyLoadouts: {
        // Enable shared loadouts if option is enabled and MP
        _shareButtonCtrl ctrlEnable (GVAR(allowSharedLoadouts) && {isMultiplayer});
        _shareButtonCtrl ctrlCommit 0;

        // Rename share button, depending if it's already shared or not
        _shareButtonCtrl ctrlSetText ([
            LLSTRING(buttonSharePrivateText),
            LLSTRING(buttonSharePublicText)
        ] select ((_control lnbValue [_curSel, 0]) == 1));

        // Enable all other buttons
        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } forEach [_loadButtonCtrl, _renameButtonCtrl, _deleteButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };
    // Default loadouts
    case IDC_buttonDefaultLoadouts: {
        // Enable saving and loading for everyone
        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } forEach [_saveButtonCtrl, _loadButtonCtrl];

        // Disable sharing button
        _shareButtonCtrl ctrlEnable false;
        _shareButtonCtrl ctrlCommit 0;

        // Enable delete and renaming button if in 3DEN
        {
            _x ctrlEnable (call FUNC(canEditDefaultLoadout));
            _x ctrlCommit 0;
        } forEach [_renameButtonCtrl, _deleteButtonCtrl];

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };
    // Shared loadouts
    case IDC_buttonSharedLoadouts: {
        // Enable saving and loading for everyone
        {
            _x ctrlEnable true;
            _x ctrlCommit 0;
        } forEach [_saveButtonCtrl, _loadButtonCtrl];

        // Disable sharing button
        _shareButtonCtrl ctrlEnable false;
        _shareButtonCtrl ctrlCommit 0;

        // If admin or loadout author, enable button for shared loadout
        if ((serverCommandAvailable "#logout") || {(_control lnbText [_curSel, 0]) == profileName}) then {
            _deleteButtonCtrl ctrlEnable true;
            _deleteButtonCtrl ctrlCommit 0;
        } else {
            _deleteButtonCtrl ctrlEnable false;
            _deleteButtonCtrl ctrlCommit 0;
        };

        _textEditBoxCtrl ctrlSetText (_control lnbText [_curSel, 1]);
    };
};
