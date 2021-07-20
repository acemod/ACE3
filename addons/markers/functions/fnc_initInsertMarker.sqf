#include "script_component.hpp"
/*
 * Author: BIS, commy2, Timi007
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

#define BORDER 0.005

[{
    disableserialization;
    params ["_display"];
    TRACE_1("params",_display);

    //Can't place markers when can't interact
    if !([ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)) exitWith {
        _display closeDisplay 2; //emulate "Cancel" button
    };

    //BIS Controls:
    private _text = _display displayctrl IDC_INSERT_MARKER;
    private _picture = _display displayctrl IDC_INSERT_MARKER_PICTURE;
    private _channel = _display displayctrl IDC_INSERT_MARKER_CHANNELS;
    private _buttonOK = _display displayctrl IDC_OK;
    private _buttonCancel = _display displayctrl IDC_CANCEL;
    private _description = _display displayctrl 1100;
    private _title = _display displayctrl 1001;
    private _descriptionChannel = _display displayctrl 1101;

    //ACE Controls:
    private _ctrlTimestamp = _display displayCtrl IDC_ACE_INSERT_MARKER_TIMESTAMP;
    private _ctrlTimestampText = _display displayCtrl IDC_ACE_INSERT_MARKER_TIMESTAMP_TEXT;
    private _aceShapeLB = _display displayctrl IDC_ACE_INSERT_MARKER_SHAPE;
    private _aceColorLB = _display displayctrl IDC_ACE_INSERT_MARKER_COLOR;
    private _aceAngleSlider = _display displayctrl IDC_ACE_INSERT_MARKER_ANGLE;
    private _aceAngleSliderText = _display displayctrl IDC_ACE_INSERT_MARKER_ANGLE_TEXT;
    private _aceScaleSlider = _display displayctrl IDC_ACE_INSERT_MARKER_SCALE;
    private _aceScaleSliderText = _display displayctrl IDC_ACE_INSERT_MARKER_SCALE_TEXT;

    private _mapDisplay = displayParent _display;
    if (isNull _mapDisplay) exitWith {ERROR("No Map");};
    private _mapCtrl = _mapDisplay displayCtrl IDC_MAP;

    GVAR(editingMarker) = "";
    (ctrlMapMouseOver _mapCtrl) params ["_mouseOverType", "_marker"];

    //check if entity under mouse is a user marker
    if (_mouseOverType isEqualTo "marker") then {
        if (((_marker find "_USER_DEFINED") isNotEqualTo -1) && ((markerShape _marker) isEqualTo "ICON")) then {
            GVAR(editingMarker) = _marker;
            //hide marker which is being edited because if the user cancels editing, it will still exist unchanged
            GVAR(editingMarker) setMarkerAlphaLocal 0;
        };
    };

    ////////////////////
    // Install MapDrawEH on current map
    if !((ctrlIDD _mapDisplay) in GVAR(mapDisplaysWithDrawEHs)) then {
        GVAR(mapDisplaysWithDrawEHs) pushBack (ctrlIDD _mapDisplay);
        _mapCtrl ctrlAddEventHandler ["Draw", {_this call FUNC(mapDrawEH)}]; // @todo check if persistent
    };

    ////////////////////
    // Calculate center position of the marker placement ctrl
    if (GVAR(editingMarker) isNotEqualTo "") then {
        //prevent changing the original marker position
        GVAR(currentMarkerPosition) = markerPos GVAR(editingMarker);
    } else {
        private _pos = ctrlPosition _picture;
        _pos = [
            (_pos select 0) + (_pos select 2) / 2,
            (_pos select 1) + (_pos select 3) / 2
        ];
        GVAR(currentMarkerPosition) = _mapCtrl ctrlMapScreenToWorld _pos;
    };

    //Hide the bis picture:
    _picture ctrlShow false;

    // prevent vanilla key input
    _display displayAddEventHandler ["KeyDown", {(_this select 1) in [200, 208]}];

    private _markerText = markerText GVAR(editingMarker);
    if (_markerText != "") then {
        // fill text input with text from marker which is being edited
        _markerText = _markerText call FUNC(removeTimestamp);
        _text ctrlSetText _markerText;
    };

    //Focus on the text input
    ctrlSetFocus _text;

    //--- Background
    private _pos = ctrlposition _text;
    _pos params ["_posX", "_posY", "_posW", "_posH"];
    _posX = _posX + 0.01;
    _posY = _posY min ((safeZoneH + safeZoneY) - (11 * _posH + 11 * BORDER));  //prevent buttons being placed below bottom edge of screen

    _pos set [0, _posX];
    _pos set [1, _posY];
    _text ctrlSetPosition _pos;
    _text ctrlCommit 0;

    //--- Title
    _pos set [1, _posY - 2 * _posH - BORDER];
    _pos set [3, _posH];
    _title ctrlSetPosition _pos;
    _title ctrlCommit 0;

    //--- Description
    _pos set [1, _posY - 1 * _posH];
    if (GVAR(timestampEnabled)) then {
        _pos set [3,9 * _posH + 9 * BORDER];
    } else {
        _pos set [3,10 * _posH + 10 * BORDER];
    };
    _description ctrlEnable false;
    _description ctrlSetPosition _pos;
    _description ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t>", localize "str_lib_label_description"];
    _description ctrlCommit 0;

    //--- Timestamp
    private _timestampOffset = 0;
    if (GVAR(timestampEnabled)) then {
        _timestampOffset = _posH + BORDER;

        private _left = _posX;
        private _top = _posY + 1 * _posH + 2 * BORDER;
        private _width = _posH * safeZoneH / safeZoneW;
        private _height = _posH;

        _ctrlTimestamp ctrlSetPosition [_left, _top, _width, _height];
        _ctrlTimestamp ctrlCommit 0;

        _ctrlTimestampText ctrlSetStructuredText parseText format ["<t size='0.8'>%1</t>", LLSTRING(Timestamp)];

        _left = _left + _width;
        _width = _posW - _width;
        _top = _top + 0.1 * _height;
        _ctrlTimestampText ctrlSetPosition [_left, _top, _width, _height];
        _ctrlTimestampText ctrlCommit 0;

        if !([ACE_player] call FUNC(canTimestamp)) then {
            _ctrlTimestamp ctrlEnable false;
            _ctrlTimestamp ctrlSetTooltip LLSTRING(TimestampTooltipNoWatch);
        } else {
            _ctrlTimestamp cbSetChecked (uiNamespace getVariable [QGVAR(timestampChecked), false]);
        };
    } else {
        _ctrlTimestampText ctrlEnable false;
        _ctrlTimestampText ctrlShow false;
        _ctrlTimestamp ctrlEnable false;
        _ctrlTimestamp ctrlShow false;
    };

    //--- Shape
    _pos set [0, _posX];
    _pos set [1, _posY + 1 * _posH + 2 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _pos set [3, _posH];
    _aceShapeLB ctrlSetPosition _pos;
    _aceShapeLB ctrlCommit 0;

    //--- Color
    _pos set [1, _posY + 2 * _posH + 3 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _aceColorLB ctrlSetPosition _pos;
    _aceColorLB ctrlCommit 0;

    //--- Angle
    _pos set [1, _posY + 3 * _posH + 4 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _aceAngleSlider ctrlSetPosition _pos;
    _aceAngleSlider ctrlCommit 0;

    //--- Angle Text
    _pos set [1, _posY + 4 * _posH + 5 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _aceAngleSliderText ctrlSetPosition _pos;
    _aceAngleSliderText ctrlCommit 0;

    //--- Scale
    _pos set [1, _posY + 5 * _posH + 6 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _aceScaleSlider ctrlSetPosition _pos;
    _aceScaleSlider ctrlCommit 0;

    //--- Scale Text
    _pos set [1, _posY + 6 * _posH + 7 * BORDER + _timestampOffset];
    _pos set [2, _posW];
    _aceScaleSliderText ctrlSetPosition _pos;
    _aceScaleSliderText ctrlCommit 0;

    private _offsetButtons = 0;

    if (isMultiplayer) then {
        _pos set [1,_posY + 7 * _posH + 9 * BORDER + _timestampOffset];
        _pos set [3,_posH];
        _descriptionChannel ctrlSetStructuredText parseText format ["<t size='0.8'>%1:</t>", localize "str_a3_cfgvehicles_modulerespawnposition_f_arguments_marker_0"];
        _descriptionChannel ctrlSetPosition _pos;
        _descriptionChannel ctrlCommit 0;

        _pos set [1,_posY + 8 * _posH + 9 * BORDER + _timestampOffset];
        _pos set [3,_posH];
        _channel ctrlSetPosition _pos;
        _channel ctrlCommit 0;

        // channels are added by engine and not script. we have to manually delete them. requires channel names to be unique?
        private _enabledChannels = true call FUNC(getEnabledChannels);
        private _i = 0;

        while {_i < lbSize _channel} do {
            private _channelName = _channel lbText _i;

            // _enabledChannels can not include custom channels names. Therefore also check if it's a custom one. Blame BI if the unit should not access the channel.
            if (_channelName in _enabledChannels || {!(_channelName in CHANNEL_NAMES)}) then {
                _i = _i + 1;
            } else {
                _channel lbDelete _i;
            };
        };

        private _selectChannel = if (GVAR(editingMarker) isNotEqualTo "") then {
            //get the channel where the marker was placed in
            parseNumber ((GVAR(editingMarker) splitString "/") param [2, "3"])
        } else {
            currentChannel
        };

        private _currentChannelName = CHANNEL_NAMES param [_selectChannel, localize "str_channel_group"];

        // select current channel in list box, must be done after lbDelete
        for "_j" from 0 to (lbSize _channel - 1) do {
            if (_channel lbText _j == _currentChannelName) then {
                _channel lbSetCurSel _j;
                setCurrentChannel (CHANNEL_NAMES find _currentChannelName);
            };
        };

        _channel ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedChannel)}];

        _offsetButtons = 9 * _posH + 10 * BORDER;
    } else {
        _descriptionChannel ctrlShow false;
        _channel ctrlShow false;
        _offsetButtons = 7 * _posH + 9 * BORDER;
    };

    //--- ButtonOK
    _pos set [1, _posY + _offsetButtons + _timestampOffset];
    _pos set [2, _posW / 2 - BORDER];
    _pos set [3, _posH];
    _buttonOk ctrlSetPosition _pos;
    _buttonOk ctrlCommit 0;

    //--- ButtonCancel
    _pos set [0, _posX + _posW / 2];
    _pos set [1, _posY + _offsetButtons + _timestampOffset];
    _pos set [2, _posW / 2];
    _pos set [3, _posH];
    _buttonCancel ctrlSetPosition _pos;
    _buttonCancel ctrlCommit 0;

    ////////////////////
    // init marker timestamp cb
    _buttonOK ctrlAddEventHandler ["ButtonClick", FUNC(onButtonClickConfirm)];
    _ctrlTimestamp ctrlAddEventHandler ["CheckedChanged", FUNC(onCheckedChangedTimestamp)];

    ////////////////////
    // init marker shape lb
    lbClear _aceShapeLB;
    {
        _x params ["_add", "_set", "_pic", "_classname"];
        _aceShapeLB lbAdd _add;
        _aceShapeLB lbSetValue [_forEachIndex, _set];
        _aceShapeLB lbSetPicture [_forEachIndex, _pic];

        if ((markerType GVAR(editingMarker)) isEqualTo _classname) then {
            //if the marker is being edited then get the original shape
            GVAR(curSelMarkerShape) = _forEachIndex;
        };
    } forEach GVAR(MarkersCache);

    private _curSelShape = GETGVAR(curSelMarkerShape,0);
    _aceShapeLB lbSetCurSel _curSelShape;

    //Update now and add eventHandler:
    [_aceShapeLB, _curSelShape] call FUNC(onLBSelChangedShape);
    _aceShapeLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedShape)}];

    ////////////////////
    // init marker color lb
    lbClear _aceColorLB;
    {
        _x params ["_add", "_set", "_pic", "_classname"];
        _aceColorLB lbAdd _add;
        _aceColorLB lbSetValue [_forEachIndex, _set];
        _aceColorLB lbSetPicture [_forEachIndex, _pic];

        if ((markerColor GVAR(editingMarker)) isEqualTo _classname) then {
            //if the marker is being edited then get the original color
            GVAR(curSelMarkerColor) = _forEachIndex;
        };
    } forEach GVAR(MarkerColorsCache);

    private _curSelColor = GETGVAR(curSelMarkerColor,0);
    _aceColorLB lbSetCurSel _curSelColor;

    //Update now and add eventHandler:
    [_aceColorLB, _curSelColor] call FUNC(onLBSelChangedColor);
    _aceColorLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedColor)}];

    ////////////////////
    // init marker angle slider
    _aceAngleSlider sliderSetRange [-180, 180];

    if (GVAR(editingMarker) isNotEqualTo "") then {
        //get the original direction
        GVAR(currentMarkerAngle) = markerDir GVAR(editingMarker);
    };

    private _curSelAngle = GETGVAR(currentMarkerAngle,0);
    _aceAngleSlider sliderSetPosition _curSelAngle;
    _aceAngleSlider ctrlSetTooltip LLSTRING(MarkerDirectionScaleSlider_Tooltip);

    //Update now and add eventHandler:
    [_aceAngleSlider, _curSelAngle] call FUNC(onSliderPosChangedAngle);
    _aceAngleSlider ctrlAddEventHandler ["SliderPosChanged", {_this call FUNC(onSliderPosChangedAngle)}];
    _aceAngleSlider ctrlAddEventHandler ["MouseButtonUp", {_this call FUNC(onSliderMouseButtonUpAngle)}];

    ////////////////////
    // init marker scale slider
    _aceScaleSlider sliderSetRange [0.5, 2.0];

    if !(GVAR(editingMarker) isEqualTo "") then {
        //get the original scale
        GVAR(currentMarkerScale) = (markerSize GVAR(editingMarker)) param [0, 1];
    };

    private _curSelScale = GETGVAR(currentMarkerScale,1);
    _aceScaleSlider sliderSetPosition _curSelScale;
    _aceScaleSlider ctrlSetTooltip LLSTRING(MarkerDirectionScaleSlider_Tooltip);

    //Update now and add eventHandler:
    [_aceScaleSlider, _curSelScale] call FUNC(onSliderPosChangedScale);
    _aceScaleSlider ctrlAddEventHandler ["SliderPosChanged", {_this call FUNC(onSliderPosChangedScale)}];
    _aceScaleSlider ctrlAddEventHandler ["MouseButtonUp", {_this call FUNC(onSliderMouseButtonUpScale)}];
}, _this] call CBA_fnc_execNextFrame;
