/*
 * Author: Alganthe
 * Handles the stats control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <SCALAR>
 * 3: Item config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"
params ["_display", "_control", "_curSel", "_itemCfg"];

private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

private _hideUnusedFnc = {
    params ["_numbers"];

    {
        private _statsTitleCtrl = _display displayCtrl (5101 + _forEachIndex * 4);
        private _statsTitleIDC = ctrlIDC _statsTitleCtrl;

        private _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
        private _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);
        private _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

        {
            _x ctrlSetFade 1;
            _x ctrlCommit 0;
        } foreach [
            _statsTitleCtrl,
            _statsBackgroundCtrl,
            _statsBarCtrl,
            _statsTextCtrl
        ];
    } foreach _numbers;
};

private _showUsedFnc = {
    params ["_numbers"];

    {
        private _statsTitleCtrl = _display displayCtrl (5101 + _forEachIndex * 4);
        private _statsTitleIDC = ctrlIDC _statsTitleCtrl;

        private _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
        private _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);
        private _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

        {
            _x ctrlSetFade 0;
            _x ctrlCommit 0;
        } foreach [
            _statsTitleCtrl,
            _statsBackgroundCtrl,
            _statsBarCtrl,
            _statsTextCtrl
        ];
    } foreach _numbers;
};

if !(isNil "_itemCfg") then {

    private _handleStatsFnc = {
        params ["_statsIndex", "_leftPanel"];
        private ["_statsArray", "_statsList", "_isLeftPanel", "_currentPage"];

        if (_leftPanel) then {
            _isLeftPanel = true;
            _statsArray = GVAR(statsListLeftPanel) select _statsIndex;
            _currentPage = GVAR(statsPagesLeft) select _statsIndex;
            _statsList = _statsArray select _currentPage;
        } else {
            _isLeftPanel = false;
            _statsArray = GVAR(statsListRightPanel) select _statsIndex;
            _currentPage = GVAR(statsPagesRight) select _statsIndex;
            _statsList = _statsArray select _currentPage;
        };

        private _statsCount = count _statsList;
        switch (_statsCount) do {
            case 0: {
                [[1, 2, 3, 4, 5]] call _hideUnusedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    12 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            case 1: {
                [[2, 3, 4, 5]] call _hideUnusedFnc;
                [[1]] call _showUsedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    12 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            case 2: {
                [[3, 4, 5]] call _hideUnusedFnc;
                [[1, 2]] call _showUsedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    23 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            case 3: {
                [[4, 5]] call _hideUnusedFnc;
                [[1, 2, 3]] call _showUsedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    34 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            case 4: {
                [[5]] call _hideUnusedFnc;
                [[1, 2, 3, 4]] call _showUsedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    45 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            case 5: {
                [[1, 2, 3, 4, 5]] call _showUsedFnc;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    56 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
            default {
                _statsCount resize 5;

                _statsBoxCtrl ctrlSetPosition [
                    0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
                    safezoneY + 1.8 * GRID_H,
                    WIDTH_TOTAL / 5.1,
                    56 * GRID_H
                ];
                _statsBoxCtrl ctrlCommit 0;
            };
        };

        GVAR(statsInfo) = [_isLeftPanel, _statsIndex, _control, _curSel, _itemCfg];

        TRACE_3("count magic", _statsCount, _currentPage, count _statsArray);

        // Toggle page buttons
        if (_currentPage == 0) then {
            _statsPreviousPageCtrl ctrlEnable false;
            _statsPreviousPageCtrl ctrlSetFade 0.4;
        } else {
            _statsPreviousPageCtrl ctrlEnable true;
            _statsPreviousPageCtrl ctrlSetFade 0;
        };

        if (_currentPage + 1 == count _statsArray) then {
            _statsNextPageCtrl ctrlEnable false;
            _statsNextPageCtrl ctrlSetFade 0.4;
        } else {
            _statsNextPageCtrl ctrlEnable true;
            _statsNextPageCtrl ctrlSetFade 0;
        };

        _statsCurrentPageCtrl ctrlSetFade 0;
        _statsCurrentPageCtrl ctrlSetText str _currentPage;

        _statsPreviousPageCtrl ctrlCommit 0;
        _statsNextPageCtrl ctrlCommit 0;
        _statsCurrentPageCtrl ctrlCommit 0;

        // Handle titles, bars and text
        {
            _x params ["_configEntry", "_title", "_bools", "_passedArgs", "_statements"];
            _bools params ["_showBar", "_showText"];
            _statements params ["_barStatement", "_textStatement"];

            // handle Title
            private _statsTitleCtrl = _display displayCtrl (5101 + _forEachIndex * 4);
            private _statsTitleIDC = ctrlIDC _statsTitleCtrl;
            _statsTitleCtrl ctrlSetText _title;

            // Handle progress bars
            private _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
            private _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);

            if (_showBar) then {
                _statsBarCtrl progressSetPosition ([_configEntry, _itemCfg, _passedArgs] call _barStatement);

                _statsBackgroundCtrl ctrlSetFade 0;
                _statsBarCtrl ctrlSetFade 0;
                
            } else {
                _statsBackgroundCtrl ctrlSetFade 1;
                _statsBarCtrl ctrlSetFade 1;
            };

            _statsBackgroundCtrl ctrlCommit 0;
            _statsBarCtrl ctrlCommit 0;

            // Handle text fields
            private _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

            if (_showText) then {
                private _textStatementResult = [_configEntry, _itemCfg, _passedArgs] call _textStatement;

                if (_textStatementResult isEqualtype "") then {
                    _statsTextCtrl ctrlSetText _textStatementResult;
                } else {
                    _statsTextCtrl ctrlSetText (str _textStatementResult);
                };
                
                _statsTextCtrl ctrlSetFade 0;
            } else {
                _statsTextCtrl ctrlSetFade 1;
            };

            _statsTextCtrl ctrlCommit 0;
        } foreach _statsList;
    };

    if (ctrlIDC _control == IDC_leftTabContent) then {

        switch (GVAR(currentLeftPanel)) do {
            case IDC_buttonPrimaryWeapon: {
                [0, true] call _handleStatsFnc;
            };
            case IDC_buttonHandgun: {
                [1, true] call _handleStatsFnc;
            };
            case IDC_buttonSecondaryWeapon: {
                [2, true] call _handleStatsFnc;
            };
            case IDC_buttonUniform: {
                [3, true] call _handleStatsFnc;
            };
            case IDC_buttonVest: {
                [4, true] call _handleStatsFnc;
            };
            case IDC_buttonBackpack: {
                [5, true] call _handleStatsFnc;
            };
            case IDC_buttonHeadgear: {
                [6, true] call _handleStatsFnc;
            };
            case IDC_buttonGoggles: {
                [7, true] call _handleStatsFnc;
            };
            case IDC_buttonNVG: {
                [8, true] call _handleStatsFnc;
            };
            case IDC_buttonBinoculars: {
                [9, true] call _handleStatsFnc;
            };
            case IDC_buttonMap: {
                [10, true] call _handleStatsFnc;
            };
            case IDC_buttonGPS: {
                [11, true] call _handleStatsFnc;
            };
            case IDC_buttonRadio: {
                [12, true] call _handleStatsFnc;
            };
            case IDC_buttonCompass: {
                [13, true] call _handleStatsFnc;
            };
            case IDC_buttonWatch: {
                [14, true] call _handleStatsFnc;
            };
            case IDC_buttonFace: {
                [15, true] call _handleStatsFnc;
            };
            case IDC_buttonVoice: {
                [16, true] call _handleStatsFnc;
            };
            case IDC_buttonInsigna: {
                [17, true] call _handleStatsFnc;
            };
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
        };
    };
} else {
    [[1, 2, 3, 4, 5]] call _hideUnusedFnc;

    _statsBoxCtrl ctrlSetPosition [
        0.5 - (WIDTH_TOTAL / 2) + WIDTH_GAP + 6 * GRID_W,
        safezoneY + 1.8 * GRID_H,
        WIDTH_TOTAL / 5.1,
        12 * GRID_H
    ];
    _statsBoxCtrl ctrlCommit 0;

    {
        _x ctrlSetFade 1;
        _x ctrlCommit 0;
    } foreach [
        _statsPreviousPageCtrl,
        _statsNextPageCtrl,
        _statsCurrentPageCtrl
    ];
};