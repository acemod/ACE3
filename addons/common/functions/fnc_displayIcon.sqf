/*
* Author: Glowbal
* Draw progress bar and execute given function if succesful.
* Finish/Failure/Conditional are all passed [args, elapsedTime, totalTime, errorCode]
*
* Arguments:
* 0: icon ID <STRING>
* 1: show <BOOL>
* 2: Icon Path <STRING>
* 3: Icon color <ARRAY>
* 4: timeAlive. -1 = forever (default: 6) <NUMBER>
*
* Return Value:
* None
*
* Example:
* ["myID", true, QUOTE(PATHTOF(data\icon_group.paa)), [1,1,1,1], 0] call ace_gui_fnc_displayIcon;
*
* Public: Yes
*/


#include "script_component.hpp"

// positions for the icon UI
#define RIGHT_SIDE    (safezoneW + safezoneX)
#define LEFT_SIDE     safezoneX
#define TOP_SIDE      safeZoneY
#define BOTTOM_SIDE   (safeZoneH + safezoneY)
#define ICON_WIDTH    (2 * (((safezoneW / safezoneH) min 1.2) / 40))
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

private ["_allControls", "_refresh", "_timeAlive", "_list"];

params ["_iconId", "_show", "_icon", "_color", ["_timeAlive", DEFAULT_TIME]];

disableSerialization;
_list = missionNamespace getvariable [QGVAR(displayIconList), []];

_refresh = {
    private ["_allControls"];
    // Refreshing of all icons..
    _allControls = missionNamespace getvariable [QGVAR(displayIconListControls), []];
    {
        ctrlDelete _x;
    } foreach _allControls;

    _allControls = [];

    private ["_ctrl", "_setting", "_position"];
    _setting = missionNamespace getvariable[QGVAR(settingFeedbackIcons), 0];
    if (_setting > 0) then {
        {
            _x params ["_xicon", "_xcolor"];
            // +19000 because we want to make certain we are using free IDCs..
            _ctrl = ((findDisplay 46) ctrlCreate ["RscPicture", _foreachIndex + 19000]);
            _position = switch (_setting) do {
                case TOP_RIGHT_DOWN: {[X_POS_ICONS, Y_POS_ICONS + (_foreachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
                case TOP_RIGHT_LEFT: {[X_POS_ICONS_SECOND - ((_foreachIndex+3) * DIFFERENCE_ICONS), Y_POS_ICONS_SECOND - (ICON_WIDTH / 2), ICON_WIDTH, ICON_WIDTH]};
                case TOP_LEFT_DOWN: {[LEFT_SIDE + (0.5 * ICON_WIDTH), Y_POS_ICONS + (_foreachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
                case TOP_LEFT_RIGHT: {[LEFT_SIDE + (0.5 * ICON_WIDTH) - ((_foreachIndex+3) * DIFFERENCE_ICONS), Y_POS_ICONS_SECOND, ICON_WIDTH, ICON_WIDTH]};
                default {[X_POS_ICONS, Y_POS_ICONS + (_foreachIndex * DIFFERENCE_ICONS), ICON_WIDTH, ICON_WIDTH]};
            };
            _ctrl ctrlSetPosition _position;
            _ctrl ctrlsetText _xicon;
            _ctrl ctrlSetTextColor _xcolor;
            _ctrl ctrlCommit 0;
            _allControls pushback _ctrl;
        } foreach (missionNamespace getvariable [QGVAR(displayIconList),[]]);
    };
    missionNamespace setvariable [QGVAR(displayIconListControls), _allControls];
};

if (_show) then {
    if ({(_x select 0 == _iconId)} count _list == 0) then {
        _list pushback [_iconId, _icon, _color, ACE_time];
    } else {
        {
            if (_x select 0 == _iconId) exitwith {
                _list set [_foreachIndex, [_iconId, _icon, _color, ACE_time]];
            };
        } forEach _list;
    };
    missionNamespace setvariable [QGVAR(displayIconList), _list];
    call _refresh;

    if (_timeAlive >= 0) then {
        [{
             [_this, false, "", [0,0,0], 0] call FUNC(displayIcon);
         }, _iconId, _timeAlive, _timeAlive] call EFUNC(common,waitAndExecute);
    };

} else {
    if ({(_x select 0 == _iconId)} count _list == 1) then {
        private "_newList";
        _newList = [];
        {
            if (_x select 0 != _iconId) then {
                _newList pushback _x;
            };
        } forEach _list;

        missionNamespace setvariable [QGVAR(displayIconList), _newList];
        call _refresh;
    };
};
