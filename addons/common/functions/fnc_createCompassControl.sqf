/*
 * Author: commy2
 * Creates compass control like used in Zeus.
 *
 * Arguments:
 * 0: Any display <DISPLAY>
 *
 * Return Value:
 * Compass control <CONTROL>
 *
 * Example:
 * (findDisplay 46) call ace_common_fnc_createCompassControl
 *
 * Public: Yes
 */
#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define TEXTURE_0 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture0_ca.paa"
#define TEXTURE_1 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture90_ca.paa"
#define TEXTURE_2 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture180_ca.paa"
#define TEXTURE_3 "\a3\ui_f_curator\Data\CfgIngameUI\Compass\texture270_ca.paa"

params [["_display", findDisplay 46, [displayNull]]];

private _controlsGroupStatic = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];
private _controlsGroupMoving = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _controlsGroupStatic];

private _control0 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control0 ctrlSetText TEXTURE_0;

private _control1 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control1 ctrlSetText TEXTURE_1;

private _control2 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control2 ctrlSetText TEXTURE_2;

private _control3 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control3 ctrlSetText TEXTURE_3;

private _control4 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control4 ctrlSetText TEXTURE_0;

private _control5 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control5 ctrlSetText TEXTURE_1;

private _control6 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control6 ctrlSetText TEXTURE_2;

private _control7 = _display ctrlCreate ["RscPicture", -1, _controlsGroupMoving];
_control7 ctrlSetText TEXTURE_3;

private _left = 0.5 - 8 * GUI_GRID_W;
private _top = safezoneY + 1.6 * GUI_GRID_H;
private _width = 16 * GUI_GRID_W;
private _height = 0.5 * GUI_GRID_H;

_controlsGroupStatic ctrlSetPosition [
    _left,
    _top,
    _width,
    _height
];
_controlsGroupStatic ctrlCommit 0;

_controlsGroupMoving ctrlSetPosition [
    0,
    0,
    2*_width,
    2*_height
];
_controlsGroupMoving ctrlCommit 0;

{
    _x ctrlSetPosition [
        _forEachIndex * (_width / 4),
        0,
        _width / 4,
        _height
    ];
    _x ctrlCommit 0;
} forEach [_control0, _control1, _control2, _control3, _control4, _control5, _control6, _control7];

_display setVariable [QGVAR(compassControl), _controlsGroupMoving];

private _fnc_update = {
    params ["_display"];
    private _controlsGroupMoving = _display getVariable QGVAR(compassControl);

    private _view = AGLToASL positionCameraToWorld [0,0,0] vectorFromTo AGLToASL positionCameraToWorld [0,0,1];
    private _viewHorizontal = vectorNormalized (_view vectorCrossProduct [0,0,1]);

    private _dir = acos (_viewHorizontal select 0);

    if (_viewHorizontal select 1 > 0) then {
        _dir = 360 - _dir;
    };

    private _width = 16 * GUI_GRID_W;
    private _posLeft = - _width * (_dir / 360);

    _controlsGroupMoving ctrlSetPosition [_posLeft, 0];
    _controlsGroupMoving ctrlCommit 0;
};

_display displayAddEventHandler ["MouseMoving", _fnc_update];
_display displayAddEventHandler ["MouseHolding", _fnc_update];

_controlsGroupStatic
