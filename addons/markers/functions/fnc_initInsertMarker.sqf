// stuff taken from bohemia, edited by commy2
#include "script_component.hpp"

#define BORDER  0.005

[{
    disableserialization;
    _display = _this select 0;

    //Prevent Captive Players from placing markers
    /*if (ACE_player getVariable ["ACE_isCaptive", false]) exitWith {
        _display closeDisplay 2;  //emulate "Cancel" button
    };*/

    // prevent vanilla key input
    _display displayAddEventHandler ["KeyDown", {(_this select 1) in [200, 208]}];

    _text = _display displayctrl 101;
    _picture = _display displayctrl 102;
    _buttonOK = _display displayctrl 1;
    _buttonCancel = _display displayctrl 2;
    _description = _display displayctrl 1100;
    _title = _display displayctrl 1001;
    _sizeX = _display displayctrl 1200;
    _sizeY = _display displayctrl 1201;
    _shape = _display displayctrl 1210;
    _color = _display displayctrl 1211;
    _angle = _display displayctrl 1220;
    _angleText = _display displayctrl 1221;

    ctrlSetFocus _text;

    //Change ok button's text based on current channel
    [{
        EXPLODE_2_PVT(_this,_params,_pfhId);
        EXPLODE_1_PVT(_params,_buttonOK);

        if (isNull _buttonOK) exitWith {
            [_pfhId] call CBA_fnc_removePerFrameHandler;
        };

        _channel = "";
        _textColor = [1,1,1,1];
        switch (call EFUNC(common,currentChannel)) do {
        case ("global"): {
                _channel = localize "str_channel_global";
                _textColor = [(216/255),(216/255),(216/255),1];
            };
        case ("side"): {
                _channel = localize "str_channel_side";
                _textColor = [(70/255),(211/255),(252/255),1];
            };
        case ("group"): {
                _channel = localize "str_channel_group";
                _textColor = [(181/255),(248/255),(98/255),1];
            };
        case ("vehicle"): {
                _channel = localize "str_channel_vehicle";
                _textColor = [(255/255),(208/255),(0/255),1];
            };
        case ("direct"): {
                _channel = localize "str_channel_direct";
                _textColor = [(255/255),(255/255),(255/255),1];
            };
        case ("command"): {
                _channel = localize "str_channel_command";
                _textColor = [(255/255),(255/255),(70/255),1];
            };
        };

        //If localization not found, then don't touch anything (default is RscButtonMenuOK's localized text)
        if (_channel != "") then {
            _buttonOK ctrlSetTextColor _textColor;
            _buttonOK ctrlSetText format [localize "STR_ACE_Markers_PlaceIn", _channel];
        };
    }, 0, [_buttonOK]] call CBA_fnc_addPerFrameHandler;

    //--- Background
    _pos = ctrlposition _text;
    _posX = (_pos select 0) + 0.01;
    _posY = _pos select 1;
    _posW = _pos select 2;
    _posH = _pos select 3;
    _posY = _posY min ((safeZoneH + safeZoneY) - (6 * _posH + 8 * BORDER));  //prevent buttons being placed below bottom edge of screen
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
    _description ctrlsetposition _pos;
    _description ctrlsetstructuredtext parsetext format ["<t size='0.8'>%1</t>","Description:"]; //--- ToDo: Localze
    _description ctrlcommit 0;

    _activeColor = (["IGUI","WARNING_RGB"] call bis_fnc_displaycolorget) call bis_fnc_colorRGBtoHTML;

    //--- Shape
    _pos set [1,_posY + 1 * _posH + 2 * BORDER];
    _pos set [2,_posW];
    _pos set [3,_posH];
    _shape ctrlsetposition _pos;
    _shape ctrlcommit 0;

    //--- Color
    _pos set [1,_posY + 2 * _posH + 3 * BORDER];
    _pos set [2,_posW];
    _color ctrlsetposition _pos;
    _color ctrlcommit 0;

    //--- Angle
    _pos set [1,_posY + 3 * _posH + 4 * BORDER];
    _pos set [2,_posW];
    _angle ctrlsetposition _pos;
    _angle ctrlcommit 0;

    //--- Angle Text
    _pos set [1,_posY + 4 * _posH + 5 * BORDER];
    _pos set [2,_posW];
    _angleText ctrlsetposition _pos;
    _angleText ctrlcommit 0;

    //--- ButtonOK
    _pos set [1,_posY + 5 * _posH + 7 * BORDER];
    _pos set [2,_posW * (8.9/10) - BORDER];
    _buttonOk ctrlsetposition _pos;
    _buttonOk ctrlcommit 0;

    //--- ButtonCancel
    _pos set [0,_posX + _posW * (8.9 / 10)];
    _pos set [2,_posW * (1.1 / 10)];
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
    {
        _shape lbAdd (_x select 0);
        _shape lbSetValue [_forEachIndex, _x select 1];
        _shape lbSetPicture [_forEachIndex, _x select 2];
    } forEach GVAR(MarkersCache);

    _shape ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedShape)}];

    _curSelShape = GETGVAR(curSelMarkerShape,0);
    _shape lbSetCurSel _curSelShape;
    _data = _shape lbValue _curSelShape;
    _config = (configfile >> "CfgMarkers") select _data;
    _icon = getText (_config >> "icon");
    _picture ctrlSetText _icon;


    // init marker color lb
    {
        _color lbAdd (_x select 0);
        _color lbSetValue [_forEachIndex, _x select 1];
        _color lbSetPicture [_forEachIndex, _x select 2];
    } forEach GVAR(MarkerColorsCache);

    _color ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedColor)}];

    _curSelColor = GETGVAR(curSelMarkerColor,0);
    _color lbSetCurSel _curSelColor;
    _data = _color lbValue _curSelColor;
    _config = (configfile >> "CfgMarkerColors") select _data;
    _rgba = getArray (_config >> "color");
    {
        if (typeName _x != "SCALAR") then {
            _rgba set [_forEachIndex, call compile _x];
        };
    } forEach _rgba;
    _picture ctrlSetTextColor _rgba;


    // init marker angle slider
    _angle sliderSetRange [-180, 180];
    _angle ctrlAddEventHandler ["SliderPosChanged", {_this call FUNC(onSliderPosChangedAngle)}];

    _curSelAngle = GETGVAR(curSelMarkerAngle,0);
    _angle sliderSetPosition _curSelAngle;

    _curSelAngle = round _curSelAngle;
    if (_curSelAngle < 0) then {
        _curSelAngle = _curSelAngle + 360;
    };

    _angleText ctrlSetText format [localize "STR_ACE_Markers_MarkerDirection", _curSelAngle];

}, _this] call EFUNC(common,execNextFrame);
