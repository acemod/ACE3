/*
 * Author: BIS, commy2
 * Sets up the marker placement
 * Run instead of \a3\ui_f\scripts\GUI\RscDisplayInsertMarker.sqf
 *
 * Arguments:
 * 0: RscDisplayInsertMarker <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [onLoad] call ace_markers_fnc_initInsertMarker;
 *
 * Public: No
 */
#include "script_component.hpp"

#define BORDER  0.005

[{
    private ["_text", "_picture", "_channel", "_buttonOK", "_buttonCancel", "_description", "_title", "_descriptionChannel", "_sizeX", "_sizeY", "_aceShapeLB", "_aceColorLB", "_aceAngleSlider", "_aceAngleSliderText", "_mapIDD", "_pos", "_offsetButtons", "_buttonOk", "_curSelShape", "_curSelColor", "_curSelAngle"];

    disableserialization;
    params ["_display"];

    //Can't place markers when can't interact
    if (!([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))) exitWith {
        _display closeDisplay 2;  //emulate "Cancel" button
    };

    //BIS Controls:
    _text = _display displayctrl 101;
    _picture = _display displayctrl 102;
    _channel = _display displayctrl 103;
    _buttonOK = _display displayctrl 1;
    _buttonCancel = _display displayctrl 2;
    _description = _display displayctrl 1100;
    _title = _display displayctrl 1001;
    _descriptionChannel = _display displayctrl 1101;

    //ACE Controls:
    // _sizeX = _display displayctrl 1200;
    // _sizeY = _display displayctrl 1201;
    _aceShapeLB = _display displayctrl 1210;
    _aceColorLB = _display displayctrl 1211;
    _aceAngleSlider = _display displayctrl 1220;
    _aceAngleSliderText = _display displayctrl 1221;


    //Install MapDrawEH on current map
    _mapIDD = -1;
    {
        if (!isNull (findDisplay _x)) exitWith {_mapIDD = _x};
    } forEach [12, 37, 52, 53, 160];
    if (_mapIDD == -1) exitWith {ERROR("No Map?");};
    if (!(_mapIDD in GVAR(mapDisplaysWithDrawEHs))) then {
        GVAR(mapDisplaysWithDrawEHs) pushBack _mapIDD;
        ((finddisplay _mapIDD) displayctrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(mapDrawEH)}];
    };

    //Calculate center position of the marker placement ctrl
    _pos = ctrlPosition _picture;
    _pos = [(_pos select 0) + (_pos select 2) / 2, (_pos select 1) + (_pos select 3) / 2];
    GVAR(currentMarkerPosition) = ((findDisplay _mapIDD) displayCtrl 51) ctrlMapScreenToWorld _pos;

    //Hide the bis picture:
    _picture ctrlShow false;

    // prevent vanilla key input
    _display displayAddEventHandler ["KeyDown", {(_this select 1) in [200, 208]}];


    //Focus on the text input
    ctrlSetFocus _text;

    //--- Background
    _pos = ctrlposition _text;
    _pos params  ["_posX", "_posY", "_posW", "_posH"];
    _posX = _posX + 0.01;
    _posY = _posY min ((safeZoneH + safeZoneY) - (8 * _posH + 8 * BORDER));  //prevent buttons being placed below bottom edge of screen
    _pos set [0,_posX];
    _pos set [1,_posY];
    _text ctrlsetposition _pos;
    _text ctrlcommit 0;

    //--- Title
    _pos set [1,_posY - 2*_posH - BORDER];
    _pos set [3,_posH];
    _title ctrlsetposition _pos;
    _title ctrlcommit 0;

    //--- Description
    _pos set [1,_posY - 1*_posH];
    _pos set [3,6*_posH + 6 * BORDER];
    _description ctrlenable false;
    _description ctrlsetposition _pos;
    _description ctrlsetstructuredtext parsetext format ["<t size='0.8'>%1</t>", (localize "str_lib_label_description")];
    _description ctrlcommit 0;

    //--- Shape
    _pos set [1,_posY + 1 * _posH + 2 * BORDER];
    _pos set [2,_posW];
    _pos set [3,_posH];
    _aceShapeLB ctrlsetposition _pos;
    _aceShapeLB ctrlcommit 0;

    //--- Color
    _pos set [1,_posY + 2 * _posH + 3 * BORDER];
    _pos set [2,_posW];
    _aceColorLB ctrlsetposition _pos;
    _aceColorLB ctrlcommit 0;

    //--- Angle
    _pos set [1,_posY + 3 * _posH + 4 * BORDER];
    _pos set [2,_posW];
    _aceAngleSlider ctrlsetposition _pos;
    _aceAngleSlider ctrlcommit 0;

    //--- Angle Text
    _pos set [1,_posY + 4 * _posH + 5 * BORDER];
    _pos set [2,_posW];
    _aceAngleSliderText ctrlsetposition _pos;
    _aceAngleSliderText ctrlcommit 0;

    _offsetButtons = 0;
    if (isMultiplayer) then {
        _pos set [1,_posY + 5 * _posH + 7 * BORDER];
        _pos set [3,_posH];
        _descriptionChannel ctrlsetstructuredtext parsetext format ["<t size='0.8'>%1</t>", (localize "str_a3_cfgvehicles_modulerespawnposition_f_arguments_marker_0") + ":"];
        _descriptionChannel ctrlsetposition _pos;
        _descriptionChannel ctrlcommit 0;

        _pos set [1,_posY + 6 * _posH + 7 * BORDER];
        _pos set [3,_posH];
        _channel ctrlsetposition _pos;
        _channel ctrlcommit 0;
        _offsetButtons = 7 * _posH + 8 * BORDER;
    } else {
        _descriptionChannel ctrlshow false;
        _channel ctrlshow false;
        _offsetButtons = 5 * _posH + 7 * BORDER;
    };

    //--- ButtonOK
    _pos set [1,_posY + _offsetButtons];
    _pos set [2,_posW / 2 - BORDER];
    _pos set [3,_posH];
    _buttonOk ctrlsetposition _pos;
    _buttonOk ctrlcommit 0;

    //--- ButtonCancel
    _pos set [0,_posX + _posW / 2];
    _pos set [1,_posY + _offsetButtons];
    _pos set [2,_posW / 2];
    _pos set [3,_posH];
    _buttonCancel ctrlsetposition _pos;
    _buttonCancel ctrlcommit 0;

    //--- PositionX
    /*_pos set [1,_posY + 2 * _posH + 3 * BORDER];
    _sizeX ctrlsetposition _pos;
    _sizeX ctrlcommit 0;*/

    //--- PositionY
    /*_pos set [1,_posY + 2 * _posH + 3 * BORDER];
    _sizeY ctrlsetposition _pos;
    _sizeY ctrlcommit 0;*/


    // init marker shape lb
    lbClear _aceShapeLB;
    {
        _x params ["_add", "_set", "_pic"];
        _aceShapeLB lbAdd _add;
        _aceShapeLB lbSetValue [_forEachIndex, _set];
        _aceShapeLB lbSetPicture [_forEachIndex, _pic];
    } forEach GVAR(MarkersCache);
    _curSelShape = GETGVAR(curSelMarkerShape,0);
    _aceShapeLB lbSetCurSel _curSelShape;

    //Update now and add eventHandler:
    [_aceShapeLB, _curSelShape] call FUNC(onLBSelChangedShape);
    _aceShapeLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedShape)}];


    // init marker color lb
    lbClear _aceColorLB;
    {
        _x params ["_add", "_set", "_pic"];
        _aceColorLB lbAdd _add;
        _aceColorLB lbSetValue [_forEachIndex, _set];
        _aceColorLB lbSetPicture [_forEachIndex, _pic];
    } forEach GVAR(MarkerColorsCache);
    _curSelColor = GETGVAR(curSelMarkerColor,0);
    _aceColorLB lbSetCurSel _curSelColor;

    //Update now and add eventHandler:
    [_aceColorLB, _curSelColor] call FUNC(onLBSelChangedColor);
    _aceColorLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedColor)}];


    // init marker angle slider
    _aceAngleSlider sliderSetRange [-180, 180];
    _curSelAngle = GETGVAR(currentMarkerAngle,0);
    _aceAngleSlider sliderSetPosition _curSelAngle;
    //Update now and add eventHandler:
    [_aceAngleSlider, _curSelAngle] call FUNC(onSliderPosChangedAngle);
    _aceAngleSlider ctrlAddEventHandler ["SliderPosChanged", {_this call FUNC(onSliderPosChangedAngle)}];

}, _this] call EFUNC(common,execNextFrame);
