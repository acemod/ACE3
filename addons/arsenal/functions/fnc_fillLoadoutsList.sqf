#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43, LinkIsGrim
 * Fill loadouts list over multiple frames. LOADOUTS_PER_FRAME macro does what it says on the tin.
 * Should only ever be called by display load (with optional params as default) and by itself.
 * Listen to ace_arsenal_loadoutsListFilled event if you need to iterate over the loadouts list.
 *
 * Arguments:
 * 0: Loadouts display <DISPLAY>
 * 1: Tab control <CONTROL>
 * 2: Current frame filling loadouts list <NUMBER> (default: 0)
 * 3: Frames necessary to fill loadouts list <NUMBER> (default: -1)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

// Can just be modified directly, no further setup needed
#define LOADOUTS_PER_FRAME 10

params ["_display", "_control", ["_currentFrame", 0], ["_framesToFill", -1]];

if (isNull _display) exitWith {
    TRACE_2("display closed, aborting",_currentFrame,_framesToFill);
};

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
if (_currentFrame == 0) then {
    (_display displayCtrl IDC_textEditBox) ctrlSetText "";

    // Force a "refresh" animation of the panel
    _contentPanelCtrl ctrlSetFade 1;
    _contentPanelCtrl ctrlCommit 0;
    _contentPanelCtrl ctrlSetFade 0;
    _contentPanelCtrl ctrlCommit FADE_DELAY;

    _contentPanelCtrl lnbSetCurSelRow -1;
    lnbClear _contentPanelCtrl;
};

private _sharedLoadoutsVars = GVAR(sharedLoadoutsNamespace) getVariable QGVAR(sharedLoadoutsVars);
private _cfgWeapons = configFile >> "CfgWeapons"; // Used by ADD_LOADOUTS_LIST_PICTURES macro, do not remove
private _newRow = -1;

if (GVAR(currentLoadoutsTab) != IDC_buttonSharedLoadouts) then {
    private _loadoutNameAndTab = "";
    private _loadoutCachedInfo = "";
    private _sharingEnabled = GVAR(allowSharedLoadouts) && {isMultiplayer};
    private _loadouts = [
        profileNamespace getVariable [QGVAR(saved_loadouts), []],
        GVAR(defaultLoadoutsList)
    ] select (ctrlIDC _control == IDC_buttonDefaultLoadouts);
    if (_currentFrame == 0) then {
        _framesToFill = floor ((count _loadouts) / LOADOUTS_PER_FRAME);
        TRACE_2("filling loadouts list",_currentFrame,_framesToFill);
        _this set [3, _framesToFill];
    };

    // Add all loadouts to loadout list
    {
        _x params ["_loadoutName", "_loadoutData"];

        _loadoutNameAndTab = _loadoutName + str GVAR(currentLoadoutsTab);
        _loadoutCachedInfo = _contentPanelCtrl getVariable _loadoutNameAndTab;

        // If not in cache, get info and cache it
        if (isNil "_loadoutCachedInfo") then {
            _loadoutCachedInfo = [_loadoutData] call FUNC(verifyLoadout);
            _contentPanelCtrl setVariable [_loadoutNameAndTab, _loadoutCachedInfo];

            _loadoutCachedInfo params ["", "_nullItemsList", "_unavailableItemsList", "_missingExtendedInfo"];

            // Log missing / nil items to RPT (only once per arsenal session)
            if (GVAR(EnableRPTLog) && {(_nullItemsList isNotEqualTo []) || {_unavailableItemsList isNotEqualTo [] || {_missingExtendedInfo isNotEqualTo []}}}) then {
                private _printComponent = "ACE_Arsenal - Loadout:";
                private _printNullItemsList = ["Missing items:", str _nullItemsList] joinString " ";
                private _printUnavailableItemsList = ["Unavailable items:", str _unavailableItemsList] joinString " ";
                private _printMissingExtendedInfo = ["Missing extended loadout:", str _missingExtendedInfo] joinString " ";

                diag_log text (format ["%1%6    %2%6    %3%6    %4%6    %5", _printComponent, "Name: " + _loadoutName, _printNullItemsList, _printUnavailableItemsList, _printMissingExtendedInfo, endl]);
            };
        };

        // Set position of loadouts different if in default loadout tab or if sharing is disabled
        if (GVAR(currentLoadoutsTab) == IDC_buttonDefaultLoadouts || {!_sharingEnabled}) then {
            _contentPanelCtrl lnbSetColumnsPos [0, 0, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        } else {
            _contentPanelCtrl lnbSetColumnsPos [0, 0.05, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
        };

        _loadoutCachedInfo params ["_extendedLoadout", "_nullItemsList", "_unavailableItemsList"];
        _extendedLoadout params ["_loadout"]; // Used by ADD_LOADOUTS_LIST_PICTURES macro, do not remove

        _newRow = _contentPanelCtrl lnbAddRow ["", _loadoutName];

        ADD_LOADOUTS_LIST_PICTURES

        // Change color on loadout lines that have items that aren't available or don't exist
        if (_nullItemsList isNotEqualTo []) then {
            _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]]; // Red
        } else {
            if (_unavailableItemsList isNotEqualTo []) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]]; // Gray
            };
        };

        // If it's a shared loadout and player is in the private loadouts tab, add icon
        if (((profileName + _loadoutName) in _sharedLoadoutsVars) && {GVAR(currentLoadoutsTab) == IDC_buttonMyLoadouts}) then {
            _contentPanelCtrl lnbSetPicture [[_newRow, 0], QPATHTOF(data\iconPublic.paa)];
            _contentPanelCtrl lnbSetValue [[_newRow, 0], 1];
        };
    } forEach (_loadouts select [_currentFrame * LOADOUTS_PER_FRAME, [LOADOUTS_PER_FRAME, count _loadouts] select is3DEN]);
} else {
    private _allPlayerNames = allPlayers apply {name _x};
    private _loadouts = _sharedLoadoutsVars apply {GVAR(sharedLoadoutsNamespace) getVariable _x};
    private _loadoutVar = "";
    if (_currentFrame == 0) then {
        _framesToFill = floor ((count _loadouts) / LOADOUTS_PER_FRAME);
        TRACE_2("filling loadouts list",_currentFrame,_framesToFill);
        _this set [3, _framesToFill];
    };

    {
        _x params ["_playerName", "_loadoutName", "_loadoutData"];

        _loadoutVar = _playerName + _loadoutName;

        // If player who shared loadout doesn't exist anymore, unshare loadout
        if !(_playerName in _allPlayerNames) then {
            GVAR(sharedLoadoutsNamespace) setVariable [_loadoutVar, nil, true];
            GVAR(sharedLoadoutsNamespace) setVariable [QGVAR(sharedLoadoutsNamespace), _sharedLoadoutsVars - [_loadoutVar], true];

            [QGVAR(loadoutUnshared), [_contentPanelCtrl, profileName, _loadoutName]] call CBA_fnc_remoteEvent;
        } else {
            ([_loadoutData] call FUNC(verifyLoadout)) params ["_extendedLoadout", "_nullItemsList", "_unavailableItemsList"];
            _extendedLoadout params ["_loadout"]; // Used by ADD_LOADOUTS_LIST_PICTURES macro, do not remove

            _contentPanelCtrl lnbSetColumnsPos [0, 0.15, 0.40, 0.50, 0.60, 0.70, 0.75, 0.80, 0.85, 0.90];
            _newRow = _contentPanelCtrl lnbAddRow [_playerName, _loadoutName];

            ADD_LOADOUTS_LIST_PICTURES

            _contentPanelCtrl lnbSetData [[_newRow, 1], _loadoutVar];

            // Change color on loadout lines that have items that aren't available or don't exist
            if (_nullItemsList isNotEqualTo []) then {
                _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.8]]; // Red
            } else {
                if (_unavailableItemsList isNotEqualTo []) then {
                    _contentPanelCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]]; // Gray
                };
            };
        };
    } forEach (_loadouts select [_currentFrame * LOADOUTS_PER_FRAME, [LOADOUTS_PER_FRAME, count _loadouts] select is3DEN]);
};

if (!is3DEN && _currentFrame != _framesToFill) exitWith {
    _this set [2, _currentFrame + 1];
    [FUNC(fillLoadoutsList), _this] call CBA_fnc_execNextFrame;
};
TRACE_3("finished",_currentFrame,_framesToFill,lnbSize _contentPanelCtrl);

[QGVAR(loadoutsListFilled), [_display, _control]] call CBA_fnc_localEvent;

// Sort loadouts alphabetically
_contentPanelCtrl lnbSort [1, false];
