#include "script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles the stats control group.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <NUMBER>
 * 3: Item config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel", "_itemCfg"];

private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

private _hideUnusedFnc = {
    params ["_numbers"];

    {
        private _statsTitleCtrl = _display displayCtrl (IDC_statsTitle1 + ((_x - 1) * 4));
        private _statsTitleIDC = ctrlIDC _statsTitleCtrl;

        private _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
        private _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);
        private _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0;
        } forEach [
            _statsTitleCtrl,
            _statsBackgroundCtrl,
            _statsBarCtrl,
            _statsTextCtrl
        ];
    } forEach _numbers;
};

if (!isNil "_itemCfg") then {
    private _handleStatsFnc = {
        params ["_statsIndex", "_leftPanel"];

        private _statsPanel = [GVAR(statsListRightPanel), GVAR(statsListLeftPanel)] select _leftPanel;

        // Get all viable stats for this tab
        private _statsTab = _statsPanel select _statsIndex select {
            _x params ["", "_configEntry", "", "", "_statements"];
            _statements params ["", "", ["_condition", {true}, [{}]]];

            ([_configEntry, _itemCfg] call _condition)
        };
        private _statsToDisplay = _statsTab select [GVAR(currentStatPage) * MAX_STATS_PER_PAGE, MAX_STATS_PER_PAGE];

        private _statsCount = 0;

        if (_statsToDisplay isNotEqualTo []) then {
            private _statsTitleCtrl = controlNull;
            private _statsTitleIDC = -1;
            private _statsBackgroundCtrl = controlNull;
            private _statsBarCtrl = controlNull;
            private _statsTextCtrl = controlNull;
            private _textStatementResult = "";

            {
                _x params ["_ID", "_configEntry", "_title", "_bools", "_statements"];
                _bools params ["_showBar", "_showText"];
                _statements params [["_barStatement", {}, [{}]], ["_textStatement", {}, [{}]], ["_condition", {true}, [{}]]];

                _statsTitleCtrl = _display displayCtrl (IDC_statsTitle1 + _forEachIndex * 4);
                _statsTitleIDC = ctrlIDC _statsTitleCtrl;
                _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
                _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);
                _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

                _statsCount = _statsCount + 1;
                _statsTitleCtrl ctrlSetText _title;
                _statsTitleCtrl ctrlSetFade 0;

                // Handle bars
                if (_showBar) then {
                    _statsBarCtrl progressSetPosition ([_configEntry, _itemCfg] call _barStatement);
                    _statsBackgroundCtrl ctrlSetFade 0;
                    _statsBarCtrl ctrlSetFade 0;
                } else {
                    _statsBackgroundCtrl ctrlSetFade 1;
                    _statsBarCtrl ctrlSetFade 1;
                };

                // Handle text entries
                if (_showText) then {
                    _textStatementResult = [_configEntry, _itemCfg] call _textStatement;

                    if !(_textStatementResult isEqualtype "") then {
                        _textStatementResult = str _textStatementResult;
                    };

                    _statsTextCtrl ctrlSetText _textStatementResult;
                    _statsTextCtrl ctrlSetTextColor ([[1, 1, 1, 1], [0, 0, 0, 1]] select (_showBar));
                    _statsTextCtrl ctrlSetFade 0;
                } else {
                    _statsTextCtrl ctrlSetFade 1;
                };

                {
                    _x ctrlCommit 0;
                } forEach [
                    _statsTitleCtrl,
                    _statsBackgroundCtrl,
                    _statsBarCtrl,
                    _statsTextCtrl
                ];
            } forEach _statsToDisplay;
        };

        // Resize the window
        [[1, 2, 3, 4, 5] select [_statsCount, 5]] call _hideUnusedFnc;
        private _height = ([11, (10 * _statsCount) + 5] select (_statsCount > 0));
        _statsBoxCtrl ctrlSetPosition [
            (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
            safezoneY + 1.8 * GRID_H,
            47 * GRID_W,
            _height * GRID_H
        ];
        _statsBoxCtrl ctrlCommit 0;
        private _ctrl = _display displayCtrl IDC_actionsBox;
        private _pos = ctrlPosition _ctrl;
        _pos set [1, safezoneY + (_height + 3.6) * GRID_H];
        _ctrl ctrlSetPosition _pos;
        _ctrl ctrlCommit 0;


        GVAR(statsInfo) = [_leftPanel, _control, _curSel, _itemCfg];

        // Toggle page buttons
        _statsPreviousPageCtrl ctrlEnable (GVAR(currentStatPage) > 0);
        _statsNextPageCtrl ctrlEnable ((GVAR(currentStatPage) + 1) * 5 < count _statsTab);
        _statsCurrentPageCtrl ctrlSetText ([LLSTRING(page), str (GVAR(currentStatPage) + 1)] joinString " ");

        {
            _x ctrlSetFade 0;
            _x ctrlCommit 0;
        } forEach [
            _statsPreviousPageCtrl,
            _statsNextPageCtrl,
            _statsCurrentPageCtrl
        ];
    };

    // Check if in left or right panel
    if (ctrlIDC _control == IDC_leftTabContent) then {
        // Faces, voices and insigna do not have stats
        if ([IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsignia] find GVAR(currentLeftPanel) > -1) then {
            [[1, 2, 3, 4, 5]] call _hideUnusedFnc;
            _statsBoxCtrl ctrlSetPosition [
                (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
                safezoneY + 1.8 * GRID_H,
                47 * GRID_W,
                11 * GRID_H
            ];
            _statsBoxCtrl ctrlCommit 0;

            {
                _x ctrlSetFade 1;
                _x ctrlCommit 0;
            } forEach [
                _statsPreviousPageCtrl,
                _statsNextPageCtrl,
                _statsCurrentPageCtrl
            ];
        } else {
            [[
                IDC_buttonPrimaryWeapon,
                IDC_buttonHandgun,
                IDC_buttonSecondaryWeapon,
                IDC_buttonUniform,
                IDC_buttonVest,
                IDC_buttonBackpack,
                IDC_buttonHeadgear,
                IDC_buttonGoggles,
                IDC_buttonNVG,
                IDC_buttonBinoculars,
                IDC_buttonMap,
                IDC_buttonGPS,
                IDC_buttonRadio,
                IDC_buttonCompass,
                IDC_buttonWatch
            ] find GVAR(currentLeftPanel), true] call _handleStatsFnc;
        };
    } else {
        switch (GVAR(currentRightPanel)) do {
            case IDC_buttonOptic: {
                [0, false] call _handleStatsFnc;
            };
            case IDC_buttonItemAcc: {
                [1, false] call _handleStatsFnc;
            };
            case IDC_buttonMuzzle: {
                [2, false] call _handleStatsFnc;
            };
            case IDC_buttonBipod: {
                [3, false] call _handleStatsFnc;
            };
            case IDC_buttonCurrentMag;
            case IDC_buttonCurrentMag2;
            case IDC_buttonMag;
            case IDC_buttonMagALL: {
                [4, false] call _handleStatsFnc;
            };
            case IDC_buttonThrow: {
                [5, false] call _handleStatsFnc;
            };
            case IDC_buttonPut: {
                [6, false] call _handleStatsFnc;
            };
            case IDC_buttonMisc: {
                [7, false] call _handleStatsFnc;
            };
            default {
                if (GVAR(currentRightPanel) in [RIGHT_PANEL_CUSTOM_BUTTONS]) then {
                    [7, false] call _handleStatsFnc;
                };
            };
        };
    };
} else {
    // If nothing is chosen, hide stats
    [[1, 2, 3, 4, 5]] call _hideUnusedFnc;
    _statsBoxCtrl ctrlSetPosition [
        (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
        safezoneY + 1.8 * GRID_H,
        47 * GRID_W,
        11 * GRID_H
    ];
    _statsBoxCtrl ctrlCommit 0;
    private _ctrl = _display displayCtrl IDC_actionsBox;
    private _pos = ctrlPosition _ctrl;
    _pos set [1, safezoneY + (14.6) * GRID_H];
    _ctrl ctrlSetPosition _pos;
    _ctrl ctrlCommit 0;

    {
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
    } forEach [
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl
    ];
};
