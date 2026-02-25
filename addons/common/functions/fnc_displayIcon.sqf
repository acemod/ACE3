#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Displays an icon at a CBA settings-defined position and ensures multiple icons are shown after each other
 *
 * Arguments:
 * 0: icon ID <STRING>
 * 1: show <BOOL>
 * 2: Icon Path <STRING>
 * 3: Icon color <ARRAY>
 * 4: timeAlive. -1 = forever <NUMBER> (default: 6)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["myID", true, QPATHTOF(data\icon_group.paa), [1,1,1,1], 0] call ace_common_fnc_displayIcon;
 *
 * Public: Yes
 */

// positions for the icon UI
#define RIGHT_SIDE    (safeZoneW + safeZoneX)
#define LEFT_SIDE     safeZoneX
#define TOP_SIDE      safeZoneY
#define BOTTOM_SIDE   (safeZoneH + safeZoneY)
#define ICON_WIDTH    (2 * (((safeZoneW / safeZoneH) min 1.2) / 40))
#define X_POS_ICONS   (RIGHT_SIDE - (1.5 * ICON_WIDTH))
#define Y_POS_ICONS   (TOP_SIDE + (2.5 * ICON_WIDTH))
#define DIFFERENCE_ICONS (1.1 * ICON_WIDTH)
#define X_POS_ICONS_SECOND (RIGHT_SIDE - (4.4 * ICON_WIDTH))
#define Y_POS_ICONS_SECOND (TOP_SIDE + (1.1 * ICON_WIDTH))

// setting values
#define TOP_RIGHT_DOWN    1
#define TOP_RIGHT_LEFT    2
#define TOP_LEFT_DOWN    3
#define TOP_LEFT_RIGHT    4

// other constants
#define DEFAULT_TIME    6

disableSerialization;

params ["_iconId", "_show", "_icon", "_color", ["_timeAlive", DEFAULT_TIME]];

private _list = missionNamespace getVariable [QGVAR(displayIconList), []];

private _refresh = {
    // Refreshing of all icons..
    private _allControls = missionNamespace getVariable [QGVAR(displayIconListControls), []];

    {
        ctrlDelete _x;
    } forEach _allControls;

    _allControls = [];

    private _setting = missionNamespace getVariable [QGVAR(settingFeedbackIcons), 0];

    if (_setting > 0) then {
        {
            _x params ["", "_xicon", "_xcolor"];

            // +19000 because we want to make certain we are using free IDCs..
            private _ctrl = (findDisplay 46) ctrlCreate ["RscPicture", _forEachIndex + 19000];

            private _position = switch (_setting) do {
                case TOP_RIGHT_DOWN: {[X_POS_ICONS, Y_POS_ICONS + (_forEachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
                case TOP_RIGHT_LEFT: {[X_POS_ICONS_SECOND - ((_forEachIndex + 3) * DIFFERENCE_ICONS), Y_POS_ICONS_SECOND - (ICON_WIDTH / 2), ICON_WIDTH, ICON_WIDTH]};
                case TOP_LEFT_DOWN: {[LEFT_SIDE + (0.5 * ICON_WIDTH), Y_POS_ICONS + (_forEachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
                case TOP_LEFT_RIGHT: {[LEFT_SIDE + (0.5 * ICON_WIDTH) - ((_forEachIndex + 3) * DIFFERENCE_ICONS), Y_POS_ICONS_SECOND, ICON_WIDTH, ICON_WIDTH]};
                default {[X_POS_ICONS, Y_POS_ICONS + (_forEachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
            };

            _ctrl ctrlSetPosition _position;
            _ctrl ctrlSetText _xicon;
            _ctrl ctrlSetTextColor _xcolor;
            _ctrl ctrlCommit 0;
            _allControls pushBack _ctrl;
        } forEach (missionNamespace getVariable [QGVAR(displayIconList),[]]);
    };

    missionNamespace setVariable [QGVAR(displayIconListControls), _allControls];
};

if (_show) then {
    if (_list findIf {_x select 0 == _iconId} == -1) then {
        _list pushBack [_iconId, _icon, _color, CBA_missionTime];
    } else {
        {
            if (_x select 0 == _iconId) exitWith {
                _list set [_forEachIndex, [_iconId, _icon, _color, CBA_missionTime]];
            };
        } forEach _list;
    };

    missionNamespace setVariable [QGVAR(displayIconList), _list];
    call _refresh;

    if (_timeAlive >= 0) then {
        [{
            [_this select 0, false, "", [0,0,0], 0] call FUNC(displayIcon);
        }, [_iconId], _timeAlive, _timeAlive] call CBA_fnc_waitAndExecute;
    };

} else {

    if ({_x select 0 == _iconId} count _list == 1) then {
        private _newList = [];

        {
            if (_x select 0 != _iconId) then {
                _newList pushBack _x;
            };
        } forEach _list;

        missionNamespace setVariable [QGVAR(displayIconList), _newList];
        call _refresh;
    };
};
