#include "script_component.hpp"
#include "..\defines.hpp"
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

params ["_display", "_control", "_curSel", "_itemCfg"];

private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

private _hideUnusedFnc = {
    params ["_numbers"];

    {
        private _statsTitleCtrl = _display displayCtrl (5101 + ((_x - 1) * 4));
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

if !(isNil "_itemCfg") then {

    private _handleStatsFnc = {
        params ["_statsIndex", "_leftPanel"];

        // Get the proper list and page
        if (_leftPanel) then {
            [true, (GVAR(statsListLeftPanel)) select _statsIndex, GVAR(statsPagesLeft) select _statsIndex]
        } else {
            [false, (GVAR(statsListRightPanel)) select _statsIndex, GVAR(statsPagesRight) select _statsIndex]
        } params ["_isLeftPanel", "_statsArray", "_currentPage"];

        private _statsList = _statsArray select _currentPage;

        private _statsCount = 0;

        // Handle titles, bars and text
        _statsList = _statsList select [0, 5];
        if !(_statsList isEqualTo []) then {
            {
                _x params ["_ID", "_configEntry", "_title", "_bools", "_statements"];
                _bools params ["_showBar", "_showText"];
                _statements params [["_barStatement", {}, [{}]], ["_textStatement", {}, [{}]], ["_condition", {true}, [{}]]];

                private _statsTitleCtrl = _display displayCtrl (5101 + _forEachIndex * 4);
                private _statsTitleIDC = ctrlIDC _statsTitleCtrl;
                private _statsBackgroundCtrl = _display displayCtrl (_statsTitleIDC + 1);
                private _statsBarCtrl = _display displayCtrl (_statsTitleIDC + 2);
                private _statsTextCtrl = _display displayCtrl (_statsTitleIDC + 3);

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
                    private _textStatementResult = [_configEntry, _itemCfg] call _textStatement;

                    if (_textStatementResult isEqualtype "") then {
                        _statsTextCtrl ctrlSetText _textStatementResult;
                    } else {
                        _statsTextCtrl ctrlSetText (str _textStatementResult);
                    };
                    _statsTextCtrl ctrlSetTextColor ([[1,1,1,1], [0,0,0,1]] select (_showBar));

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
            } forEach (_statsList select {
                _x params ["_ID","_configEntry", "_title", "_bools", "_statements"];
                _statements params [["_barStatement", {}, [{}]], ["_textStatement", {}, [{}]], ["_condition", {true}, [{}]]];

                ([_configEntry, _itemCfg] call _condition)
            });
        };

        // Resize the window
        [[1, 2, 3, 4, 5] select [_statsCount, 5]] call _hideUnusedFnc;
        _statsBoxCtrl ctrlSetPosition [
            (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
            safezoneY + 1.8 * GRID_H,
            47 * GRID_W,
            ([11, (10 * _statsCount) + 5] select (_statsCount > 0)) * GRID_H
        ];
        _statsBoxCtrl ctrlCommit 0;

        GVAR(statsInfo) = [_isLeftPanel, _statsIndex, _control, _curSel, _itemCfg];

        // Toggle page buttons
        _statsPreviousPageCtrl ctrlEnable !(_currentPage == 0);
        _statsNextPageCtrl ctrlEnable !(_currentPage + 1 >= count _statsArray);
        _statsCurrentPageCtrl ctrlSetText ([localize LSTRING(page), str (_currentPage + 1)] joinString " ");

        {
            _x ctrlSetFade 0;
            _x ctrlCommit 0;
        } forEach [
            _statsPreviousPageCtrl,
            _statsNextPageCtrl,
            _statsCurrentPageCtrl
        ];
    };

    if (ctrlIDC _control == IDC_leftTabContent) then {

        if ([IDC_buttonFace, IDC_buttonVoice, IDC_buttonInsigna] find GVAR(currentLeftPanel) > -1) then {

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
        };
    };
} else {

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
};
