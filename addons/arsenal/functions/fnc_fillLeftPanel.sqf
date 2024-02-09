#define DEBUG_MODE_FULL
#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Fills left panel.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Tab control <CONTROL>
 * 2: Animate panel refresh <BOOL>
 * 3: Frames necessary to fill panel <NUMBER> (default: -1)
 * 4: Current frame filling panel <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

#define ITEMS_PER_FRAME 200

params ["_display", "_control", ["_animate", true], ["_framesToFill", -1], ["_currentFrame", 0]];

private _ctrlIDC = ctrlIDC _control;
TRACE_4("filling left panel",_animate,_currentFrame,_ctrlIDC,_framesToFill);
private _ctrlPanel = _display displayCtrl IDC_leftTabContent;

if (_currentFrame == 0) then {
    // Fade old control background
    if (!isNil QGVAR(currentLeftPanel)) then {
        private _previousCtrlBackground  = _display displayCtrl (GVAR(currentLeftPanel) - 1);
        _previousCtrlBackground ctrlSetFade 1;
        _previousCtrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);
    };

    // Show new control background
    private _ctrlBackground = _display displayCtrl (_ctrlIDC - 1);
    _ctrlBackground ctrlSetFade 0;
    _ctrlBackground ctrlCommit ([0, FADE_DELAY] select _animate);

    // Force a "refresh" animation of the panel
    if (_animate) then {
        _ctrlPanel ctrlSetFade 1;
        _ctrlPanel ctrlCommit 0;
        _ctrlPanel ctrlSetFade 0;
        _ctrlPanel ctrlCommit FADE_DELAY;
    };

    _ctrlPanel lbSetCurSel -1;
    // Purge old data
    lbClear _ctrlPanel;

    // For every left tab except faces and voices, add "Empty" entry
    if !(_ctrlIDC in [IDC_buttonFace, IDC_buttonVoice]) then {
        private _addEmpty = _ctrlPanel lbAdd format [" <%1>", localize "str_empty"];
        _ctrlPanel lbSetValue [_addEmpty, -1];
    };
};

// Add items to the listbox
private _idxVirt = _control getVariable QGVAR(idx);
private _selectedItem = if (
    _idxVirt == IDX_VIRT_BINO ||
    {_idxVirt != IDX_VIRT_HEADGEAR && (_idxVirt < IDX_VIRT_GOGGLES)}
) then { // this is everything with a right panel
    private _configParent = ["CfgWeapons", "CfgVehicles"] select (_idxVirt == IDX_VIRT_BACKPACK);
    private _isWeapon = _idxVirt < IDX_VIRT_UNIFORM;
    private _items = if (_isWeapon) then {
        keys ((GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _idxVirt);
    } else {
        keys (GVAR(virtualItems) get _idxVirt);
    };
    if (_currentFrame == 0) then {
        _framesToFill = floor ((count _items) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
        _this set [3, _framesToFill];
        TRACE_1("items to add",count _items);
    };

    {
        [_configParent, _x, _ctrlPanel] call FUNC(addListBoxItem);
    } forEach (_items select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

    GVAR(currentItems) select _idxVirt
} else {
    // Every other item
    if (_idxVirt != -1) exitWith {
        private _configParent = ["CfgWeapons", "CfgGlasses"] select (_idxVirt == IDX_VIRT_GOGGLES);
        private _items = keys (GVAR(virtualItems) get _idxVirt);
        if (_currentFrame == 0) then {
            GVAR(currentRightPanel) = nil;
            _framesToFill = floor ((count _items) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
            _this set [3, _framesToFill];
            TRACE_1("items to add",count _items);
        };
        {
            [_configParent, _x, _ctrlPanel] call FUNC(addListBoxItem);
        } forEach (_items select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

        GVAR(currentItems) select _idxVirt
    };
};

// Special cases
if (_idxVirt == -1) then {
    _selectedItem = switch (_ctrlIDC) do {
        // Faces
        case IDC_buttonFace: {
            private _lbAdd = -1;
            private _faces = uiNamespace getVariable QGVAR(faceCache);
            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _faces) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                TRACE_1("items to add",count _items);
            };

            {
                (_faces get _x) params ["_displayName", "_modPicture"];

                _lbAdd = _ctrlPanel lbAdd _displayName;
                _ctrlPanel lbSetData [_lbAdd, _x];
                _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _x]];
                _ctrlPanel lbSetPictureRight [_lbAdd, ["", _modPicture] select GVAR(enableModIcons)];
            } forEach ((keys _faces) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            GVAR(currentFace)
        };
        // Voices
        case IDC_buttonVoice: {
            private _voices = uiNamespace getVariable QGVAR(voiceCache);
            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _voices) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                TRACE_1("items to add",count _items);
            };

            {
                ["CfgVoice", _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
            } forEach ((keys _voices) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            GVAR(currentVoice)
        };
        // Insignia
        case IDC_buttonInsignia: {
            // Insignia from config
            private _insignias = uiNamespace getVariable QGVAR(insigniaCache);
            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _insignias) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                TRACE_1("items to add",count _items);
            };

            {
                ["CfgUnitInsignia", _x, _ctrlPanel, "texture"] call FUNC(addListBoxItem);
            } forEach ((keys _insignias) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            // Insignia from mission file, just do this in a single frame at the end
            if (_currentFrame == _framesToFill) then {
                private _displayName = "";
                private _className = "";
                private _lbAdd = -1;

                {
                    _className = configName _x;
                    _displayName = getText (_x >> "displayName");
                    _lbAdd = _ctrlPanel lbAdd _displayName;

                    _ctrlPanel lbSetData [_lbAdd, _className];
                    _ctrlPanel lbSetPicture [_lbAdd, getText (_x >> "texture")];
                    _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _className]];
                } forEach ("(if (isNumber (_x >> 'scope')) then {getNumber (_x >> 'scope')} else {2}) == 2" configClasses (missionConfigFile >> "CfgUnitInsignia"));
            };

            GVAR(currentInsignia)
        };
        // Unknown
        default {
            _framesToFill = 0;
            _this set [3, _framesToFill];
            TRACE_1("items to add",count _items);
            ""
        };
    };
};

// Call for next batch, nothing else
// If anyone *wasn't* using API, they'll have to now
if (_currentFrame != _framesToFill) exitWith {
    _this set [4, _currentFrame + 1];
    [FUNC(fillLeftPanel), _this] call CBA_fnc_execNextFrame;
};

// Trigger event
GVAR(currentLeftPanel) = _ctrlIDC;
[QGVAR(leftPanelFilled), [_display, _ctrlIDC, GVAR(currentRightPanel)]] call CBA_fnc_localEvent;

// Sort
[_display, _control, _display displayCtrl IDC_sortLeftTab, _display displayCtrl IDC_sortLeftTabDirection] call FUNC(fillSort);

// Try to select previously selected item again, otherwise select first item ("Empty")
TRACE_1("finalized",_selectedItem,_framesToFill);
if (_selectedItem != "") then {
    private _index = 0;

    for "_lbIndex" from 0 to (lbSize _ctrlPanel) - 1 do {
        if ((_ctrlPanel lbData _lbIndex) == _selectedItem) exitWith {
            _index = _lbIndex;
        };
    };

    _ctrlPanel lbSetCurSel _index;
} else {
    _ctrlPanel lbSetCurSel 0;
};
