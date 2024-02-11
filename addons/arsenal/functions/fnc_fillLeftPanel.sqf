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

#define ITEMS_PER_FRAME 250

params ["_display", "_control", ["_animate", true], ["_framesToFill", -1], ["_currentFrame", 0]];

private _ctrlIDC = ctrlIDC _control;
if (
    !isNil QGVAR(currentLeftPanel) &&
    {(_currentFrame != 0) && (GVAR(currentLeftPanel) != _ctrlIDC)} // abort if we switched to a different tab before finishing
) exitWith {
    TRACE_1("abort",_currentFrame);
};

private _ctrlPanel = _display displayCtrl IDC_leftTabContent;
private _idxVirt = _control getVariable QGVAR(idx);

if (_currentFrame == 0) then {
    TRACE_3("filling left panel",_animate,_ctrlIDC,_framesToFill);
    _control ctrlEnable false;
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

    private _resetRightPanel = (_idxVirt in [-1, IDX_VIRT_HEADGEAR]) || (_idxVirt >= IDX_VIRT_GOGGLES && _idxVirt != IDX_VIRT_BINO);
    if (_resetRightPanel) then {
        GVAR(currentRightPanel) = nil;
    };
    GVAR(currentLeftPanel) = _ctrlIDC;
};

// Add items to the listbox
private _selectedItem = if (_idxVirt != -1) then { // Items
    private _configParent = switch (_idxVirt) do {
        case IDX_VIRT_GOGGLES: {"CfgGlasses"};
        case IDX_VIRT_BACKPACK: {"CfgVehicles"};
        default {"CfgWeapons"};
    };

    private _items = if (_idxVirt < IDX_VIRT_HEADGEAR) then {
        keys ((GVAR(virtualItems) get IDX_VIRT_WEAPONS) get _idxVirt);
    } else {
        keys (GVAR(virtualItems) get _idxVirt);
    };

    private _currentItem = GVAR(currentItems) select _idxVirt;
    if (_currentFrame == 0) then {
        _framesToFill = floor ((count _items) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
        _this set [3, _framesToFill];
        [{_this ctrlEnable true}, _control, _framesToFill] call CBA_fnc_execAfterNFrames; // prevent the user from switching to the same tab while it's being filled
        TRACE_3("items to add",count _items,_currentItem,_idxVirt);

        // Current item gets preferential treatment so we can fill the right panel ASAP
        if (_currentItem != "") then {
            [_configParent, _currentItem, _ctrlPanel] call FUNC(addListBoxItem);
            _ctrlPanel lbSetCurSel 1;
        } else {
            _ctrlPanel lbSetCurSel 0;
        };
    };

    {
        if (_x == _currentItem) then {continue};
        [_configParent, _x, _ctrlPanel] call FUNC(addListBoxItem);
    } forEach (_items select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

    _currentItem
} else { // Special cases
    switch (_ctrlIDC) do {
        // Faces
        case IDC_buttonFace: {
            private _lbAdd = -1;
            private _faces = uiNamespace getVariable QGVAR(faceCache);

            private _fnc_addFace = {
                (_faces get _this) params ["_displayName", "_modPicture"];
                _lbAdd = _ctrlPanel lbAdd _displayName;
                _ctrlPanel lbSetData [_lbAdd, _this];
                _ctrlPanel lbSetTooltip [_lbAdd, format ["%1\n%2", _displayName, _this]];
                _ctrlPanel lbSetPictureRight [_lbAdd, ["", _modPicture] select GVAR(enableModIcons)];
            };

            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _faces) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                [{_this ctrlEnable true}, _control, _framesToFill] call CBA_fnc_execAfterNFrames;
                TRACE_1("items to add",count _faces);

                GVAR(currentFace) call _fnc_addFace;
                _ctrlPanel lbSetCurSel 0;
            };

            {
                if (_x == GVAR(currentFace)) then {continue};
                _x call _fnc_addFace;
            } forEach ((keys _faces) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            GVAR(currentFace)
        };
        // Voices
        case IDC_buttonVoice: {
            private _voices = uiNamespace getVariable QGVAR(voiceCache);
            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _voices) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                [{_this ctrlEnable true}, _control, _framesToFill] call CBA_fnc_execAfterNFrames;
                TRACE_1("items to add",count _voices);

                ["CfgVoice", GVAR(currentVoice), _ctrlPanel, "icon"] call FUNC(addListBoxItem);
                _ctrlPanel lbSetCurSel 0;
            };

            {
                if (_x == GVAR(currentVoice)) then {continue};
                ["CfgVoice", _x, _ctrlPanel, "icon"] call FUNC(addListBoxItem);
            } forEach ((keys _voices) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            GVAR(currentVoice)
        };
        // Insignia
        case IDC_buttonInsignia: {
            private _insignias = GVAR(insigniaCache);
            if (_currentFrame == 0) then {
                _framesToFill = floor ((count _insignias) / ITEMS_PER_FRAME); // floor because we already do something on frame 0
                _this set [3, _framesToFill];
                [{_this ctrlEnable true}, _control, _framesToFill] call CBA_fnc_execAfterNFrames;
                TRACE_1("items to add",count _insignias);

                if (GVAR(currentInsignia) != "") then {
                    ["CfgUnitInsignia", GVAR(currentInsignia), _ctrlPanel, "texture", _insignias get GVAR(currentInsignia)] call FUNC(addListBoxItem);
                    _ctrlPanel lbSetCurSel 1;
                } else {
                    _ctrlPanel lbSetCurSel 0;
                };
            };

            {
                if (_x == GVAR(currentInsignia)) then {continue};
                ["CfgUnitInsignia", _x, _ctrlPanel, "texture", _insignias get _x] call FUNC(addListBoxItem);
            } forEach ((keys _insignias) select [_currentFrame * ITEMS_PER_FRAME, ITEMS_PER_FRAME]);

            GVAR(currentInsignia)
        };
        // Unknown
        default {
            _framesToFill = 0;
            _control ctrlEnable true;
            _this set [3, _framesToFill];
            WARNING("Unknown arsenal left panel");
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

TRACE_2("finished",_framesToFill,lbSize _ctrlPanel);

// Trigger event
[QGVAR(leftPanelFilled), [_display, _ctrlIDC, GVAR(currentRightPanel)]] call CBA_fnc_localEvent;

// Sort
[_display, _control, _display displayCtrl IDC_sortLeftTab, _display displayCtrl IDC_sortLeftTabDirection] call FUNC(fillSort);
