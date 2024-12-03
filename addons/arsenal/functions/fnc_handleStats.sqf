#include "..\script_component.hpp"
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

params ["_display", "_control", "_curSel", ["_itemCfg", configNull]];

private _statsBoxCtrl = _display displayCtrl IDC_statsBox;
private _statsBoxTitleBackgroundCtrl = _display displayCtrl IDC_statsBoxTitleBackground;
private _statsBoxBackgroundCtrl = _display displayCtrl IDC_statsBoxBackground;
private _statsPreviousPageCtrl = _display displayCtrl IDC_statsPreviousPage;
private _statsNextPageCtrl = _display displayCtrl IDC_statsNextPage;
private _statsCurrentPageCtrl = _display displayCtrl IDC_statsCurrentPage;

private _fnc_hideUnused = {
    params ["_count"];

    if (_count <= 0) exitWith {};
    for "_i" from 0 to (_count - 1) do {
        private _statsTitleIDC = IDC_statsTitle5 - (_i * 4);

        private _statsTitleCtrl = _display displayCtrl _statsTitleIDC;
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
    };
};

private _fnc_hideEverything = {
    5 call _fnc_hideUnused;

    // Hide the stats box
    _statsBoxCtrl ctrlSetPosition [
        (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
        safeZoneY + 1.8 * GRID_H,
        0,
        0
    ];
    _statsBoxCtrl ctrlCommit 0;

    // Move action display
    private _ctrl = _display displayCtrl IDC_actionsBox;
    private _pos = ctrlPosition _ctrl;
    _pos set [1, safeZoneY + 1.8 * GRID_H];
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

// If nothing is chosen, hide stats
if (isNull _itemCfg) exitWith {
    call _fnc_hideEverything
};

private _fnc_handleStats = {
    params ["_statsIndex", "_leftPanel"];

    private _statsPanel = [GVAR(statsListRightPanel), GVAR(statsListLeftPanel)] select _leftPanel;

    // Get all viable stats for this tab
    private _statsTab = _statsPanel select _statsIndex select {
        _x params ["", "_configEntry", "", "", "_statements"];
        _statements params ["", "", ["_condition", {true}, [{}]]];

        ([_configEntry, _itemCfg] call _condition)
    };

    // If there are no stats to show (unlikely), just hide everything
    if (_statsTab isEqualTo []) exitWith {
        call _fnc_hideEverything
    };

    GVAR(currentStatPage) = GVAR(currentStatPage) min floor ((count _statsTab) / 5);
    private _statsToDisplay = _statsTab select [GVAR(currentStatPage) * 5, 5];


    private _statsCount = 0;

    private _statsTitleCtrl = controlNull;
    private _statsTitleIDC = -1;
    private _statsBackgroundCtrl = controlNull;
    private _statsBarCtrl = controlNull;
    private _statsTextCtrl = controlNull;
    private _textStatementResult = "";
    private _lastCtrl = _statsBoxTitleBackgroundCtrl;

    {
        _x params ["", "_configEntry", "_title", "_bools", "_statements"];
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

        // Vertical Position
        ctrlPosition _lastCtrl params ["", "_lastPosY", "", "_lastPosH"];
        _statsTitleCtrl ctrlSetPositionY (_lastPosY + _lastPosH + GRID_H);
        {
            _x ctrlSetPositionY (_lastPosY + _lastPosH + GRID_H + (5 * GRID_H));
        } forEach [
            _statsBackgroundCtrl,
            _statsBarCtrl,
            _statsTextCtrl
        ];

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
            if (_textStatementResult isEqualType []) then {
                _textStatementResult = _textStatementResult joinString endl;
            } else {
                if !(_textStatementResult isEqualType "") then {
                    _textStatementResult = str _textStatementResult;
                };
            };

            _statsTextCtrl ctrlSetText _textStatementResult;
            _statsTextCtrl ctrlSetTextColor ([[1, 1, 1, 1], [0, 0, 0, 1]] select (_showBar));

            //Height based on Text lines
            {
                _x ctrlSetPositionH (ctrlTextHeight _statsTextCtrl);
            } forEach [
                _statsBackgroundCtrl,
                _statsBarCtrl,
                _statsTextCtrl
            ];

            _statsTextCtrl ctrlSetFade 0;
        } else {
            _statsTextCtrl ctrlSetFade 1;
            //Ensure default height
            {
                _x ctrlSetPositionH (5 * GRID_H);
            } forEach [
                _statsBackgroundCtrl,
                _statsBarCtrl,
                _statsTextCtrl
            ];
        };

        {
            _x ctrlCommit 0;
        } forEach [
            _statsTitleCtrl,
            _statsBackgroundCtrl,
            _statsBarCtrl,
            _statsTextCtrl
        ];

        _lastCtrl = _statsTextCtrl;

    } forEach _statsToDisplay;


    // Resize the window
    (5 - _statsCount) call _fnc_hideUnused;
    ctrlPosition _lastCtrl params ["", "_lastPosY", "", "_lastPosH"];
    _statsBoxCtrl ctrlSetPosition [
        (0.5 - WIDTH_TOTAL / 2) + WIDTH_GAP,
        safeZoneY + 1.8 * GRID_H,
        47 * GRID_W,
        _lastPosY + _lastPosH + GRID_H
    ];
    _statsBoxBackgroundCtrl ctrlSetPositionH (_lastPosY + _lastPosH + GRID_H);
    _statsBoxBackgroundCtrl ctrlCommit 0;
    _statsBoxCtrl ctrlCommit 0;

    // Move the actions box
    private _ctrl = _display displayCtrl IDC_actionsBox;
    private _pos = ctrlPosition _ctrl;
    _pos set [1, safeZoneY + (_lastPosY + _lastPosH + GRID_H + (3.6 * GRID_H))];
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
        call _fnc_hideEverything;
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
        ] find GVAR(currentLeftPanel), true] call _fnc_handleStats;
    };
} else {
    switch (GVAR(currentRightPanel)) do {
        case IDC_buttonOptic: {
            [0, false] call _fnc_handleStats;
        };
        case IDC_buttonItemAcc: {
            [1, false] call _fnc_handleStats;
        };
        case IDC_buttonMuzzle: {
            [2, false] call _fnc_handleStats;
        };
        case IDC_buttonBipod: {
            [3, false] call _fnc_handleStats;
        };
        case IDC_buttonCurrentMag;
        case IDC_buttonCurrentMag2;
        case IDC_buttonMag;
        case IDC_buttonMagALL: {
            [4, false] call _fnc_handleStats;
        };
        case IDC_buttonThrow: {
            [5, false] call _fnc_handleStats;
        };
        case IDC_buttonPut: {
            [6, false] call _fnc_handleStats;
        };
        case IDC_buttonMisc: {
            [7, false] call _fnc_handleStats;
        };
        default {
            if (GVAR(currentRightPanel) in [RIGHT_PANEL_CUSTOM_BUTTONS]) then {
                [7, false] call _fnc_handleStats;
            };
        };
    };
};
