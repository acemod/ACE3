#include "script_component.hpp"
/*
 * Author: Gundy, TheMagnetar
 *
 * Description:
 *   Update current interface (display or dialog) to match current settings.
 *   If no parameters are specified, all interface elements are updated (done on initial interface setup)
 *
 * Arguments:
 *   (Optional)
 *      0: Property hash in the form of [["propertyName1",...],[propertyValue1,...]] <ARRAY>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [[["mapType","mapScaleDsp"],["SAT","4"]]] call ace_bft_devices_fnc_ifUpdate;
 *
 * Public: No
 */


#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

disableSerialization;

if (I_CLOSED) exitWith {false};

private _displayName = I_GET_NAME;
private _interfaceID = I_GET_ID;
private _display = uiNamespace getVariable _displayName;
private _interfaceInit = false;
private _loadingCtrl = _display displayCtrl IDC_LOADINGTXT;
private _targetMapCtrl = controlNull;
private _targetMapScale = nil;
private _targetMapWorldPos = nil;
private _isDialog = I_GET_ISDIALOG;

params [ ["_settings", nil] ];

if (isNil "_settings") then {
    // Retrieve all settings for the currently open interface
    _settings = [_interfaceID] call FUNC(getSettings);
    _interfaceInit = true;
};

private _mode = [_settings, "mode"] call CBA_fnc_hashGet;
if (isNil "_mode") then {
    _mode = [_interfaceID,"mode"] call FUNC(getSettings);
    // do not show "Loading" control since we are not switching modes
    _loadingCtrl = displayNull;
} else {
    // show "Loading" control to hide all the action while its going on
    if (!isNull _loadingCtrl) then {
        _loadingCtrl ctrlShow true;
        while {!ctrlShown _loadingCtrl} do {};
    };
};

{
    call {
        private _value = [_settings, _x] call CBA_fnc_hashGet;
        if (isNil "_value") exitWith {};

        // ------------ DISPLAY POSITION ------------
        if (_x == "dspIfPosition") exitWith {
            private _dspIfPosition = _value;

            if !(_isDialog) then {
                // get the current position of the background control
                private _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
                private _backgroundPositionX = _backgroundPosition select 0 select 0;
                private _backgroundPositionW = _backgroundPosition select 0 select 2;

                // get the original position of the background control
                private _backgroundConfigPositionX = _backgroundPosition select 1 select 0;

                // figure out if we need to do anything
                if !((_backgroundPositionX != _backgroundConfigPositionX) isEqualTo _dspIfPosition) then {
                    // calculate offset required to shift position to the opposite
                    private _xOffset = [
                        _backgroundConfigPositionX - _backgroundPositionX,
                        2 * safeZoneX + safeZoneW - _backgroundPositionW - 2 * _backgroundPositionX
                    ] select (_backgroundPositionX == _backgroundConfigPositionX);
                    [_displayName,[_xOffset,0]] call FUNC(setInterfacePosition);
                };
            };
        };
        // ------------ DIALOG POSITION ------------
        if (_x == "dlgIfPosition") exitWith {
            private _backgroundOffset = _value;

            if (_isDialog) then {
                if (_backgroundOffset isEqualTo []) then {
                    _backgroundOffset = if (_interfaceInit) then {
                            [0,0]
                        } else {
                            // reset to defaults
                            private _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
                            [(_backgroundPosition select 1 select 0) - (_backgroundPosition select 0 select 0),(_backgroundPosition select 1 select 1) - (_backgroundPosition select 0 select 1)]
                        };
                };
                if !(_backgroundOffset isEqualTo [0,0]) then {
                    // move by offset
                    [_displayName,_backgroundOffset] call FUNC(setInterfacePosition);
                };
            };
        };
        // ------------ BRIGHTNESS ------------
        // Value ranges from 0 to 1, 0 being off and 1 being full brightness
        if (_x == "brightness") exitWith {
            private _osdCtrl = _display displayCtrl IDC_BRIGHTNESS;
            if (!isNull _osdCtrl) then {
                private _brightness = _value;
                private _nightMode = [_interfaceID,"nightMode"] call FUNC(getSettings);
                // if we are running night mode, lower the brightness proportionally
                if (!isNil "_nightMode") then {
                    if (_nightMode == 1 || {_nightMode == 2 && ([] call EFUNC(common,ambientBrightness)) < 0.2}) then {_brightness = _brightness * 0.7};
                };
                _osdCtrl ctrlSetBackgroundColor [0,0,0,1 - _brightness];
            };
        };

        // ------------ NIGHT MODE ------------
        // 0 = day mode, 1 = night mode, 2 = automatic
        if (_x == "nightMode") exitWith {
            private _nightMode = _value;
            // transform nightMode into boolean
            _nightMode = _nightMode == 1 || {_nightMode == 2 && ([] call EFUNC(common,ambientBrightness)) < 0.2};

            // get config path for background
            private _backgroundConfig = ["backgroundDay", "backgroundNight"] select (_nightMode);
            _backgroundConfig = configFile >> "ACE_BFT" >> "Interfaces" >> I_GET_CONFIGNAME >> _backgroundConfig;

            // check for existence of background
            if (isText _backgroundConfig) then {
                private _background = getText _backgroundConfig;
                (_display displayCtrl IDC_BACKGROUND) ctrlSetText _background;
                // call brightness adjustment if this is outside of interface init
                if (!_interfaceInit) then {
                    private _brightness = [_interfaceID,"brightness"] call FUNC(getSettings);
                    [_settings, "brightness", _brightness] call CBA_fnc_hashSet;
                };
            };
        };

        // ------------ MODE ------------
        if (_x == "mode") exitWith {
            private _displayItems = call {
                if (_displayName == QEGVAR(bft_device_dk10,DK10_dlg)) exitWith {
                    [IDC_GROUP_DESKTOP,
                    IDC_GROUP_UAV,
                    IDC_GROUP_HCAM,
                    IDC_GROUP_MESSAGE,
                    IDC_HCAMMAP,
                    IDC_UAVMAP,
                    IDC_SCREEN,
                    IDC_SCREEN_TOPO,
                    IDC_HCAM_FULL,
                    IDC_OSD_HOOK_GRID,
                    IDC_OSD_HOOK_ELEVATION,
                    IDC_OSD_HOOK_DST,
                    IDC_OSD_HOOK_DIR,
                    IDC_NOTIFICATION]
                };
                if (_displayName == QEGVAR(bft_device_gd300,GD300_dlg)) exitWith {
                    [IDC_GROUP_MENU,
                    IDC_GROUP_MESSAGE,
                    IDC_GROUP_COMPOSE,
                    IDC_SCREEN,
                    IDC_SCREEN_TOPO,
                    IDC_OSD_HOOK_GRID,
                    IDC_OSD_HOOK_ELEVATION,
                    IDC_OSD_HOOK_DST,
                    IDC_OSD_HOOK_DIR,
                    IDC_NOTIFICATION]
                };
                [IDC_NOTIFICATION] // default
            };
            if !(_displayItems isEqualTo []) then {
                private _btnActCtrl = _display displayCtrl IDC_BTNACT;
                private _displayItemsToShow = [];

                if (!_interfaceInit) then {
                    [] call FUNC(deleteHelmetCam);
                    [] call FUNC(deleteUAVcam);
                };

                call {
                    // ---------- DESKTOP -----------
                    if (_mode == "DESKTOP") exitWith {
                        _displayItemsToShow pushback IDC_GROUP_DESKTOP;
                        _btnActCtrl ctrlSetText "";
                        _btnActCtrl ctrlSetTooltip "";
                    };
                    // ---------- BFT -----------
                    if (_mode == "BFT") exitWith {
                        private _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
                        private _mapType = [_interfaceID,"mapType"] call FUNC(getSettings);
                        private _mapIDC = [_mapTypes, _mapType] call CBA_fnc_hashGet;

                        _displayItemsToShow pushBack _mapIDC;

                        private _mapTools = [_interfaceID,"mapTools"] call FUNC(getSettings);
                        if (!isNil "_mapTools" && {_mapTools}) then {
                            _displayItemsToShow append [
                                IDC_OSD_HOOK_GRID,
                                IDC_OSD_HOOK_ELEVATION,
                                IDC_OSD_HOOK_DST,
                                IDC_OSD_HOOK_DIR
                            ];
                        };

                        private _showMenu = [_interfaceID,"showMenu"] call FUNC(getSettings);
                        if (!isNil "_showMenu" && {_showMenu}) then {
                            _displayItemsToShow pushBack IDC_GROUP_MENU;
                        };

                        _btnActCtrl ctrlSetTooltip "";

                        // update scale and world position when not on interface init
                        if (!_interfaceInit) then {
                            if (_isDialog) then {
                                private _mapScale = [_interfaceID,"mapScaleDlg"] call FUNC(getSettings);
                                [_settings, "mapScaleDlg", _mapScale] call CBA_fnc_hashSet;
                                private _mapWorldPos = [_interfaceID,"mapWorldPos"] call FUNC(getSettings);
                                [_settings, "mapWorldPos", _mapWorldPos] call CBA_fnc_hashSet;
                            };
                        };
                    };
                    // ---------- _NOT_ BFT -----------
                    if (_isDialog) then {
                        private _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
                        if (count _mapTypes > 1) then {
                            private _targetMapName = [_interfaceID,"mapType"] call FUNC(getSettings);
                            private _targetMapIDC = [_mapTypes, _targetMapName] call CBA_fnc_hashGet;
                            _targetMapCtrl = _display displayCtrl _targetMapIDC;

                            // If we find the map to be shown, we are switching away from BFT. Lets save map scale and position
                            if (ctrlShown _targetMapCtrl) then {
                                private _mapScale = GVAR(mapScale) * GVAR(mapScaleFactor) / 0.86 * (safezoneH * 0.8);
                                [_interfaceID,[["mapWorldPos",GVAR(mapWorldPos)],["mapScaleDlg",_mapScale]],false] call FUNC(setSettings);
                            };
                        };
                    };
                    // ---------- UAV -----------
                    if (_mode == "UAV") exitWith {
                        _displayItemsToShow = [
                            IDC_GROUP_UAV,
                            IDC_UAVMAP
                        ];
                        _btnActCtrl ctrlSetTooltip "View Gunner Optics";
                        [_settings, "uavListUpdate", true] call CBA_fnc_hashSet;
                        if (!_interfaceInit) then {
                            private _uav = [_interfaceID,"uavCam"] call FUNC(getSettings);
                            [_settings, "uavCam", _uav] call CBA_fnc_hashSet;
                        };
                    };
                    // ---------- HELMET CAM -----------
                    if (_mode == "HCAM") exitWith {
                        _displayItemsToShow = [
                            IDC_GROUP_HCAM,
                            IDC_HCAMMAP
                        ];
                        _btnActCtrl ctrlSetTooltip "Toggle Fullscreen";
                        [_settings, "hCamListUpdate", true] call CBA_fnc_hashSet;
                        if (!_interfaceInit) then {
                            private _hCam = [_interfaceID,"hCam"] call FUNC(getSettings);
                            [_settings, "hCam", _hCam] call CBA_fnc_hashSet;
                        };
                    };
                    // ---------- MESSAGING -----------
                    if (_mode == "MESSAGE") exitWith {
                        _displayItemsToShow = [IDC_GROUP_MESSAGE];
                        call FUNC(msgGuiLoad);
                        GVAR(rscLayerMailNotification) cutText ["", "PLAIN"];
                        _btnActCtrl ctrlSetTooltip "";
                    };
                    // ---------- MESSAGING COMPOSE -----------
                    if (_mode == "COMPOSE") exitWith {
                        _displayItemsToShow pushBack IDC_GROUP_COMPOSE;
                        call FUNC(msgGuiLoad);
                    };
                    // ---------- FULLSCREEN HELMET CAM -----------
                    if (_mode == "HCAM_FULL") exitWith {
                        private _data = [_interfaceID,"hCam"] call FUNC(getSettings);
                        // see if camera could be set up
                        if (['rendertarget13',_data] call FUNC(createHelmetCam)) then {
                            _displayItemsToShow = [IDC_HCAM_FULL];
                        } else {
                            // drop back to HCAM mode if cam could not be set up
                            [_interfaceID,[["mode","HCAM"]],false] call FUNC(setSettings);
                            _mode = "HCAM";
                            _displayItemsToShow = [
                                IDC_GROUP_HCAM,
                                IDC_HCAMMAP
                            ];
                            [_settings, "hCamListUpdate", true] call CBA_fnc_hashSet;
                            if (!_interfaceInit) then {
                                private _hCam = [_interfaceID,"hCam"] call FUNC(getSettings);
                                [_settings, "hCam", _hCam] call CBA_fnc_hashSet;
                            };
                        };
                        _btnActCtrl ctrlSetTooltip "Toggle Fullscreen";
                    };
                };

                // hide every _displayItems not in _displayItemsToShow
                {(_display displayCtrl _x) ctrlShow (_x in _displayItemsToShow)} count _displayItems;
            };
        };
        // ------------ SHOW ICON TEXT ------------
        if (_x == "showIconText") exitWith {
            [_value] call EFUNC(bft_drawing,setDrawText);
            private _osdCtrl = _display displayCtrl IDC_OSD_TXT_TGGL;
            if (!isNull _osdCtrl) then {
                private _text = ["OFF", "ON"] select (_value);
                _osdCtrl ctrlSetText _text;
            };
        };
        // ------------ MAP SCALE DSP------------
        if (_x == "mapScaleDsp") exitWith {
            if (_mode == "BFT" && !_isDialog) then {
                private _mapScaleKm = _value;
                // pre-Calculate map scales
                private _mapScaleMin = [_interfaceID,"mapScaleMin"] call FUNC(getSettings);
                private _mapScaleMax = [_interfaceID,"mapScaleMax"] call FUNC(getSettings);
                _mapScaleKm = call {
                    if (_mapScaleKm >= _mapScaleMax) exitWith {_mapScaleMax};
                    if (_mapScaleKm <= _mapScaleMin) exitWith {_mapScaleMin};
                    // pick the next best scale that is an even multiple of the minimum map scale... It does tip in favour of the larger scale due to the use of logarithm, so its not perfect
                    _mapScaleMin * 2 ^ round (log (_mapScaleKm / _mapScaleMin) / log (2))
                };
                if (_mapScaleKm != (_value)) then {
                    [_interfaceID,[["mapScaleDsp",_mapScaleKm]],false] call FUNC(setSettings);
                };
                GVAR(mapScale) = _mapScaleKm / GVAR(mapScaleFactor);

                private _osdCtrl = _display displayCtrl IDC_OSD_MAP_SCALE;
                if (!isNull _osdCtrl) then {
                    // divide by 2 because we want to display the radius, not the diameter
                    private _mapScaleTxt = [ [_mapScaleKm / 2,0,1] call CBA_fnc_formatNumber, _mapScaleKm / 2] select (_mapScaleKm > 1);
                    _osdCtrl ctrlSetText format ["%1",_mapScaleTxt];
                };
            };
        };
        // ------------ MAP SCALE DLG------------
        if (_x == "mapScaleDlg") exitWith {
            if (_mode == "BFT" && _isDialog) then {
                private _mapScaleKm = _value;
                private _targetMapScale = _mapScaleKm / GVAR(mapScaleFactor) * 0.86 / (safezoneH * 0.8);
            };
        };
        // ------------ MAP WORLD POSITION ------------
        if (_x == "mapWorldPos") exitWith {
            if (_mode == "BFT") then {
                if (_isDialog) then {
                    private _mapWorldPos = _value;
                    if !(_mapWorldPos isEqualTo []) then {
                        _targetMapWorldPos = _mapWorldPos;
                    };
                };
            };
        };
        // ------------ MAP TYPE ------------
        if (_x == "mapType") exitWith {
            private _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
            if ((count ([_mapTypes] call CBA_fnc_hashKeys) > 1) && (_mode == "BFT")) then {
                private _targetMapName = _value;
                private _targetMapIDC = [_mapTypes, _targetMapName] call CBA_fnc_hashGet;
                _targetMapCtrl = _display displayCtrl _targetMapIDC;

                if (!_interfaceInit && _isDialog) then {
                    private _previousMapCtrl = controlNull;
                    {
                        private _previousMapIDC = ([_mapTypes, _x] call CBA_fnc_hashGet);
                        _previousMapCtrl = _display displayCtrl _previousMapIDC;
                        if (ctrlShown _previousMapCtrl) exitWith {};
                        _previousMapCtrl = controlNull;
                    } forEach ([_mapTypes] call CBA_fnc_hashKeys);
                    // See if _targetMapCtrl is already being shown
                    if ((!ctrlShown _targetMapCtrl) && (_targetMapCtrl != _previousMapCtrl)) then {
                        // Update _targetMapCtrl to scale and position of _previousMapCtrl
                        if (isNil "_targetMapScale") then {_targetMapScale = ctrlMapScale _previousMapCtrl;};
                        if (isNil "_targetMapWorldPos") then {_targetMapWorldPos = [_previousMapCtrl] call FUNC(ctrlMapCenter)};
                    };
                };

                // Hide all unwanted map types
                {
                    if (_x != _targetMapName) then {
                        (_display displayCtrl ([_mapTypes, _x] call CBA_fnc_hashGet)) ctrlShow false;
                    };
                } forEach ([_mapTypes] call CBA_fnc_hashKeys);

                // Update OSD element if it exists
                private _osdCtrl = _display displayCtrl IDC_OSD_MAP_TGGL;
                if (!isNull _osdCtrl) then {_osdCtrl ctrlSetText _targetMapName;};

                // show correct map contorl
                if (!ctrlShown _targetMapCtrl) then {
                    _targetMapCtrl ctrlShow true;
                    // wait until map control is shown, otherwise we can get in trouble with ctrlMapAnimCommit later on, depending on timing
                    while {!ctrlShown _targetMapCtrl} do {};
                };
            };
        };
        // ------------ UAV CAM ------------
        if (_x == "uavCam") exitWith {
            if (_mode == "UAV") then {
                private _data = _value;
                if (_data != "") then {
                    [_data,[[0,"rendertarget8"],[1,"rendertarget9"]]] call FUNC(createUavCam);
                } else {
                    [] call FUNC(deleteUavCam);
                };
            };
        };
        // ------------ HCAM ------------
        if (_x == "hCam") exitWith {
            if (_mode == "HCAM") then {
                private _renderTarget = call {
                    if (_mode == "HCAM") exitWith {"rendertarget12"};
                    if (_mode == "HCAM_FULL") exitWith {"rendertarget13"}
                };
                if (!isNil "_renderTarget") then {
                    private _data = _value;
                    if (_data != "") then {
                        [_renderTarget,_data] call FUNC(createHelmetCam);
                    } else {
                        [] call FUNC(deleteHelmetCam);
                    }
                };
            };
        };
        // ------------ MAP TOOLS ------------
        if (_x == "mapTools") exitWith {
            if (_displayName in [QGVAR(TAD_dlg)]) then {
                GVAR(drawMapTools) = true;
                GVAR(mapToolsArrowToCursor) = _value;
            } else {
                GVAR(drawMapTools) = if (_isDialog) then {_value} else {false};
                GVAR(mapToolsArrowToCursor) = true;
            };
            if (_mode == "BFT") then {
                private "_osdCtrl";
                if !(_displayName in [QGVAR(TAD_dlg),QGVAR(TAD_dsp)]) then {
                    {
                        _osdCtrl = _display displayCtrl _x;
                        if (!isNull _osdCtrl) then {
                            _osdCtrl ctrlShow GVAR(drawMapTools);
                        };
                    } count [IDC_OSD_HOOK_GRID,IDC_OSD_HOOK_DIR,IDC_OSD_HOOK_DST,IDC_OSD_HOOK_ELEVATION];
                };
                _osdCtrl = _display displayCtrl IDC_OSD_HOOK_TGGL1;
                if (!isNull _osdCtrl) then {
                    private _text = ["CURS", "OWN"] select (_value);
                    _osdCtrl ctrlSetText _text;
                };
                _osdCtrl = _display displayCtrl IDC_OSD_HOOK_TGGL2;
                if (!isNull _osdCtrl) then {
                    private _text = ["CURS", "OWN"] select (_value);
                    _osdCtrl ctrlSetText _text;
                };
            };
        };
        // ------------ MENU ------------
        if (_x == "showMenu") exitWith {
            private _osdCtrl = _display displayCtrl IDC_GROUP_MENU;
            if (!isNull _osdCtrl) then {
                if (_mode == "BFT") then {
                    _osdCtrl ctrlShow (_value);
                };
            };
        };
        // ------------ UAV List Update ------------
        if (_x == "uavListUpdate") exitWith {
            if (_mode == "UAV") then {
                private _data = [_interfaceID,"uavCam"] call FUNC(getSettings);
                private _uavListCtrl = _display displayCtrl IDC_UAVLIST;
                lbClear _uavListCtrl;
                _uavListCtrl lbSetCurSel -1;

                // Populate list of UAVs
                {
                    private _uavDevice = _x select 0;
                    private _uavDeviceData = _x select 1;
                    private _uav = D_GET_OWNER(_uavDeviceData);

                    if (!(crew _uav isEqualTo [])) then {
                        private _index = _uavListCtrl lbAdd format ["%1 (%2)",D_GET_CALLSIGN(_uavDeviceData),getText (configfile >> "cfgVehicles" >> typeOf _uav >> "displayname")];
                        _uavListCtrl lbSetData [_index,_uavDevice];
                    };
                } count GVAR(UAVlist);
                lbSort [_uavListCtrl, "ASC"];
                if (_data != "") then {
                    // Find last selected UAV and select if found
                    for "_x" from 0 to (lbSize _uavListCtrl - 1) do {
                        if (_data == _uavListCtrl lbData _x) exitWith {
                            if (lbCurSel _uavListCtrl != _x) then {
                                _uavListCtrl lbSetCurSel _x;
                            };
                        };
                    };
                    // If no UAV could be selected, clear last selected UAV
                    if (lbCurSel _uavListCtrl == -1) then {
                        [_interfaceID,[["uavCam",""]]] call FUNC(setSettings);
                    };
                };
            };
        };
        // ------------ HCAM List Update ------------
        if (_x == "hCamListUpdate") exitWith {
            if (_mode == "HCAM") then {
                private _data = [_interfaceID,"hCam"] call FUNC(getSettings);
                private _hcamListCtrl = _display displayCtrl IDC_HCAMLIST;
                // Populate list of HCAMs
                lbClear _hcamListCtrl;
                _hcamListCtrl lbSetCurSel -1;
                {
                    _index = _hcamListCtrl lbAdd format ["%1:%2 (%3)",groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
                    _hcamListCtrl lbSetData [_index,str _x];
                } count GVAR(hCamList);
                lbSort [_hcamListCtrl, "ASC"];
                if (_data != "") then {
                    // Find last selected hCam and select if found
                    for "_x" from 0 to (lbSize _hcamListCtrl - 1) do {
                        if (_data == _hcamListCtrl lbData _x) exitWith {
                            if (lbCurSel _hcamListCtrl != _x) then {
                                _hcamListCtrl lbSetCurSel _x;
                            };
                        };
                    };
                    // If no hCam could be selected, clear last selected hCam
                    if (lbCurSel _hcamListCtrl == -1) then {
                        [_interfaceID,[["hCam",""]]] call FUNC(setSettings);
                    };
                };
            };
        };
        // ------------ Draw Size Multiplier ------------
        if (_x == "drawSizeMultiplier") exitWith {
            if (_interfaceInit) then {
                private _drawSizeMultiplier = _value;
                _drawSizeMultiplier = [_drawSizeMultiplier] call EFUNC(bft_drawing,updateDrawSize);
                if (_drawSizeMultiplier != _value) then {
                    [_interfaceID,[["drawSizeMultiplier",_drawSizeMultiplier]],false] call FUNC(setSettings);
                };
            };
        };
        // ----------------------------------
    };
} forEach (_settings select 1);

// update scale and world position if we have to. If so, fill in the blanks and make the changes
if ((!isNil "_targetMapScale") || (!isNil "_targetMapWorldPos")) then {
    if (isNull _targetMapCtrl) then {
        private _targetMapName = [_interfaceID,"mapType"] call FUNC(getSettings);
        private _mapTypes = [_interfaceID,"mapTypes"] call FUNC(getSettings);
        private _targetMapIDC = [_mapTypes, _targetMapName] call CBA_fnc_hashGet;
        _targetMapCtrl = _display displayCtrl _targetMapIDC;
    };
    if (isNil "_targetMapScale") then {
        _targetMapScale = ctrlMapScale _targetMapCtrl;
    };
    if (isNil "_targetMapWorldPos") then {
        _targetMapWorldPos = [_targetMapCtrl] call FUNC(ctrlMapCenter);
    };
    _targetMapCtrl ctrlMapAnimAdd [0,_targetMapScale,_targetMapWorldPos];
    ctrlMapAnimCommit _targetMapCtrl;
    while {!(ctrlMapAnimDone _targetMapCtrl)} do {};
};

// now hide the "Loading" control since we are done
if (!isNull _loadingCtrl) then {
    // move mouse cursor to the center of the screen if its a dialog
    if (_interfaceInit && _isDialog) then {
        private _ctrlPos = ctrlPosition _loadingCtrl;
        // put the mouse position in the center of the screen
        private _mousePos = [(_ctrlPos select 0) + ((_ctrlPos select 2) / 2),(_ctrlPos select 1) + ((_ctrlPos select 3) / 2)];
        // delay moving the mouse cursor by one frame, for some reason its not working without
        [{
            setMousePosition _this;
        },_mousePos] call CBA_fnc_execNextFrame
    };

    _loadingCtrl ctrlShow false;
    while {ctrlShown _loadingCtrl} do {};
};

// call notification system
if (_interfaceInit) then {[] call FUNC(processNotifications)};

true
