/*
 * Author: Gundy
 *
 * Description:
 *   Update current interface (display or dialog) to match current settings.
 *   If no parameters are specified, all interface elements are updated (done on initial interface setup)
 *
 * Arguments:
 *   (Optional)
 *      0: Property pairs in the form of [["propertyName",propertyValue],[...]] <ARRAY>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [[["mapType","SAT"],["mapScaleDsp","4"]]] call ace_bft_devices_fnc_updateInterface;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_interfaceInit","_settings","_display","_displayName","_deviceID","_deviceData","_deviceType","_null","_osdCtrl","_text","_mode","_mapTypes","_mapType","_mapIDC","_targetMapName","_targetMapIDC","_targetMapCtrl","_previousMapCtrl","_previousMapIDC","_renderTarget","_loadingCtrl","_targetMapScale","_mapScale","_mapScaleKm","_mapScaleMin","_mapScaleMax","_mapScaleTxt","_mapWorldPos","_targetMapWorldPos","_displayItems","_btnActCtrl","_displayItemsToShow","_mapTools","_showMenu","_data","_uavListCtrl","_hcamListCtrl","_index","_isDialog","_background","_backgroundConfig","_brightness","_nightMode","_backgroundPosition","_backgroundPositionX","_backgroundPositionW","_backgroundConfigPositionX","_xOffset","_dspIfPosition","_backgroundOffset","_ctrlPos","_mousePos"];
disableSerialization;

if (I_CLOSED) exitWith {false};
_displayName = I_GET_NAME;
_deviceID = I_GET_DEVICE;
_display = uiNamespace getVariable _displayName;
_interfaceInit = false;
_loadingCtrl = _display displayCtrl IDC_LOADINGTXT;
_targetMapCtrl = controlNull;
_targetMapScale = nil;
_targetMapWorldPos = nil;
_isDialog = I_GET_ISDIALOG;

if (count _this == 1) then {
    _settings = _this select 0;
} else {
    // Retrieve all settings for the currently open interface
    _settings = [_deviceID] call FUNC(getSettings);
    _interfaceInit = true;
};

_mode = HASH_GET(_settings,"mode");
if (isNil "_mode") then {
    _mode = [_deviceID,"mode"] call FUNC(getSettings);
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
        private ["_value"];
        
        _value = (_settings select 1) select _forEachIndex;
        if (isNil "_value") exitWith {};
        
        // ------------ DISPLAY POSITION ------------
        if (_x == "dspIfPosition") exitWith {
            _dspIfPosition = _value;
            
            if !(_isDialog) then {
                // get the current position of the background control
                _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
                _backgroundPositionX = _backgroundPosition select 0 select 0;
                _backgroundPositionW = _backgroundPosition select 0 select 2;
                
                // get the original position of the background control
                _backgroundConfigPositionX = _backgroundPosition select 1 select 0;
                
                // figure out if we need to do anything
                if !((_backgroundPositionX != _backgroundConfigPositionX) isEqualTo _dspIfPosition) then {
                    // calculate offset required to shift position to the opposite
                    _xOffset = if (_backgroundPositionX == _backgroundConfigPositionX) then {
                            2 * safeZoneX + safeZoneW - _backgroundPositionW - 2 * _backgroundPositionX
                        } else {
                            _backgroundConfigPositionX - _backgroundPositionX
                        };
                    [_displayName,[_xOffset,0]] call FUNC(setInterfacePosition);
                };
            };
        };
        // ------------ DIALOG POSITION ------------
        if (_x == "dlgIfPosition") exitWith {
            _backgroundOffset = _value;
            
            if (_isDialog) then {
                if (_backgroundOffset isEqualTo []) then {
                    _backgroundOffset = if (_interfaceInit) then {
                            [0,0]
                        } else {
                            // reset to defaults
                            _backgroundPosition = [_displayName] call FUNC(getBackgroundPosition);
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
            _osdCtrl = _display displayCtrl IDC_BRIGHTNESS;
            if (!isNull _osdCtrl) then {
                _brightness = _value;
                _nightMode = [_deviceID,"nightMode"] call FUNC(getSettings);
                // if we are running night mode, lower the brightness proportionally
                if (!isNil "_nightMode") then {
                    if (_nightMode == 1 || {_nightMode == 2 && (sunOrMoon < 0.2)}) then {_brightness = _brightness * 0.7};
                };
                _osdCtrl ctrlSetBackgroundColor [0,0,0,1 - _brightness];
            };
        };
        
        // ------------ NIGHT MODE ------------
        // 0 = day mode, 1 = night mode, 2 = automatic
        if (_x == "nightMode") exitWith {
            _nightMode = _value;
            // transform nightMode into boolean
            _nightMode = if (_nightMode == 1 || {_nightMode == 2 && (sunOrMoon < 0.2)}) then {true} else {false};
            _deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
            _deviceType = D_GET_DEVICETYPE(_deviceData);
            
            // get config path for background
            _backgroundConfig = if (_nightMode) then {
                configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> QGVAR(backgroundNight);
            } else {
                configFile >> "ACE_BFT" >> "Devices" >> _deviceType >> QGVAR(backgroundDay);
            };
            
            // check for existence of background
            if (isText _backgroundConfig) then {
                _background = getText _backgroundConfig;
                (_display displayCtrl IDC_BACKGROUND) ctrlSetText _background;
                // call brightness adjustment if this is outside of interface init
                if (!_interfaceInit) then {
                    _brightness = [_deviceID,"brightness"] call FUNC(getSettings);
                    HASH_SET(_settings,"brightness",_brightness);
                };
            };
        };
        
        // ------------ MODE ------------
        if (_x == "mode") exitWith {
            _displayItems = call {
                if (_displayName == QGVAR(DK10_dlg)) exitWith {
                    [IDC_GROUP_DESKTOP,
                    IDC_GROUP_UAV,
                    IDC_GROUP_HCAM,
                    IDC_GROUP_MESSAGE,
                    IDC_MINIMAPBG,
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
                if (_displayName == QGVAR(GD300_dlg)) exitWith {
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
                _btnActCtrl = _display displayCtrl IDC_BTNACT;
                _displayItemsToShow = [];
                
                call {
                    // ---------- DESKTOP -----------
                    if (_mode == "DESKTOP") exitWith {
                        _displayItemsToShow pushback IDC_GROUP_DESKTOP;
                        _btnActCtrl ctrlSetText "";
                        _btnActCtrl ctrlSetTooltip "";
                    };
                    // ---------- BFT -----------
                    if (_mode == "BFT") exitWith {
                        _mapTypes = [_deviceID,"mapTypes"] call FUNC(getSettings);
                        _mapType = [_deviceID,"mapType"] call FUNC(getSettings);
                        _mapIDC = HASH_GET(_mapTypes,_mapType);
                        
                        _displayItemsToShow pushBack _mapIDC;
                        
                        _mapTools = [_deviceID,"mapTools"] call FUNC(getSettings);
                        if (!isNil "_mapTools" && {_mapTools}) then {
                            _displayItemsToShow append [
                                IDC_OSD_HOOK_GRID,
                                IDC_OSD_HOOK_ELEVATION,
                                IDC_OSD_HOOK_DST,
                                IDC_OSD_HOOK_DIR
                            ];
                        };
                        
                        _showMenu = [_deviceID,"showMenu"] call FUNC(getSettings);
                        if (!isNil "_showMenu" && {_showMenu}) then {
                            _displayItemsToShow pushBack IDC_GROUP_MENU;
                        };
                        
                        _btnActCtrl ctrlSetTooltip "";
                        
                        // update scale and world position when not on interface init
                        if (!_interfaceInit) then {
                            if (_isDialog) then {
                                _mapScale = [_deviceID,"mapScaleDlg"] call FUNC(getSettings);
                                HASH_SET(_settings,"mapScaleDlg",_mapScale);
                                _mapWorldPos = [_deviceID,"mapWorldPos"] call FUNC(getSettings);
                                HASH_SET(_settings,"mapWorldPos",_mapWorldPos);
                            };
                        };
                    };
                    // ---------- _NOT_ BFT -----------
                    if (_isDialog) then {
                        _mapTypes = [_deviceID,"mapTypes"] call FUNC(getSettings);
                        if (count _mapTypes > 1) then {
                            _targetMapName = [_deviceID,"mapType"] call FUNC(getSettings);
                            _targetMapIDC = HASH_GET(_mapTypes,_targetMapName);
                            _targetMapCtrl = _display displayCtrl _targetMapIDC;
                            
                            // If we find the map to be shown, we are switching away from BFT. Lets save map scale and position
                            if (ctrlShown _targetMapCtrl) then {
                                _mapScale = GVAR(mapScale) * GVAR(mapScaleFactor) / 0.86 * (safezoneH * 0.8);
                                [_deviceID,[["mapWorldPos",GVAR(mapWorldPos)],["mapScaleDlg",_mapScale]],false] call FUNC(setSettings);
                            };
                        };
                    };
                    // ---------- UAV -----------
                    if (_mode == "UAV") exitWith {
                        _displayItemsToShow = [
                            IDC_GROUP_UAV,
                            IDC_MINIMAPBG,
                            IDC_UAVMAP
                        ];
                        _btnActCtrl ctrlSetTooltip "View Gunner Optics";
                        HASH_SET(_settings,"uavListUpdate",true);
                        if (!_interfaceInit) then {
                            HASH_SET(_settings,"uavCam",[_deviceID,"uavCam"] call FUNC(getSettings));
                        };
                    };
                    // ---------- HELMET CAM -----------
                    if (_mode == "HCAM") exitWith {
                        _displayItemsToShow = [
                            IDC_GROUP_HCAM,
                            IDC_MINIMAPBG,
                            IDC_HCAMMAP
                        ];
                        _btnActCtrl ctrlSetTooltip "Toggle Fullscreen";
                        HASH_SET(_settings,"hCamListUpdate",true);
                        if (!_interfaceInit) then {
                            HASH_SET(_settings,"hCam",[_deviceID,"hCam"] call FUNC(getSettings));
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
                        _displayItemsToShow = [IDC_HCAM_FULL];
                        _data = [_deviceID,"hCam"] call FUNC(getSettings);
                        _btnActCtrl ctrlSetTooltip "Toggle Fullscreen";
                        ['rendertarget13',_data] call FUNC(createHelmetCam);
                    };
                };
                
                // hide every _displayItems not in _displayItemsToShow
                {(_display displayCtrl _x) ctrlShow (_x in _displayItemsToShow)} count _displayItems;
            };
        };
        // ------------ SHOW ICON TEXT ------------
        if (_x == "showIconText") exitWith {
            _osdCtrl = _display displayCtrl IDC_OSD_TXT_TGGL;
            if (!isNull _osdCtrl) then {
                _text = if (_value) then {"ON"} else {"OFF"};
                _osdCtrl ctrlSetText _text;
            };
        };
        // ------------ MAP SCALE DSP------------
        if (_x == "mapScaleDsp") exitWith {
            if (_mode == "BFT" && !_isDialog) then {
                _mapScaleKm = _value;
                // pre-Calculate map scales
                _mapScaleMin = [_deviceID,"mapScaleMin"] call FUNC(getSettings);
                _mapScaleMax = [_deviceID,"mapScaleMax"] call FUNC(getSettings);
                _mapScaleKm = call {
                    if (_mapScaleKm >= _mapScaleMax) exitWith {_mapScaleMax};
                    if (_mapScaleKm <= _mapScaleMin) exitWith {_mapScaleMin};
                    // pick the next best scale that is an even multiple of the minimum map scale... It does tip in favour of the larger scale due to the use of logarithm, so its not perfect
                    _mapScaleMin * 2 ^ round (log (_mapScaleKm / _mapScaleMin) / log (2))
                };
                if (_mapScaleKm != (_value)) then {
                    [_deviceID,[["mapScaleDsp",_mapScaleKm]],false] call FUNC(setSettings);
                };
                GVAR(mapScale) = _mapScaleKm / GVAR(mapScaleFactor);
                
                _osdCtrl = _display displayCtrl IDC_OSD_MAP_SCALE;
                if (!isNull _osdCtrl) then {
                    // divide by 2 because we want to display the radius, not the diameter
                    _mapScaleTxt = if (_mapScaleKm > 1) then {
                            _mapScaleKm / 2
                    } else {
                        [_mapScaleKm / 2,0,1] call CBA_fnc_formatNumber
                    };
                    _osdCtrl ctrlSetText format ["%1",_mapScaleTxt];    
                };
            };
        };
        // ------------ MAP SCALE DLG------------
        if (_x == "mapScaleDlg") exitWith {
            if (_mode == "BFT" && _isDialog) then {
                _mapScaleKm = _value;
                _targetMapScale = _mapScaleKm / GVAR(mapScaleFactor) * 0.86 / (safezoneH * 0.8);
            };
        };
        // ------------ MAP WORLD POSITION ------------
        if (_x == "mapWorldPos") exitWith {
            if (_mode == "BFT") then {
                if (_isDialog) then {
                    _mapWorldPos = _value;
                    if !(_mapWorldPos isEqualTo []) then {
                        _targetMapWorldPos = _mapWorldPos;
                    };
                };
            };
        };
        // ------------ MAP TYPE ------------
        if (_x == "mapType") exitWith {
            _mapTypes = [_deviceID,"mapTypes"] call FUNC(getSettings);
            if ((count (_mapTypes select 0) > 1) && (_mode == "BFT")) then {
                _targetMapName = _value;
                _targetMapIDC = HASH_GET(_mapTypes,_targetMapName);
                _targetMapCtrl = _display displayCtrl _targetMapIDC;
                
                if (!_interfaceInit && _isDialog) then {
                    _previousMapCtrl = controlNull;
                    {
                        _previousMapIDC = (_mapTypes select 1) select _forEachIndex;
                        _previousMapCtrl = _display displayCtrl _previousMapIDC;
                        if (ctrlShown _previousMapCtrl) exitWith {};
                        _previousMapCtrl = controlNull;
                    } forEach (_mapTypes select 0);
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
                        (_display displayCtrl ((_mapTypes select 1) select _forEachIndex)) ctrlShow false;
                    };
                } forEach (_mapTypes select 0);
                
                // Update OSD element if it exists
                _osdCtrl = _display displayCtrl IDC_OSD_MAP_TGGL;
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
                _data = _value;
                if (_data != "") then {
                    [_data,[[0,"rendertarget8"],[1,"rendertarget9"]]] call FUNC(createUavCam);
                } else {
                    [] call FUNC(deleteUavCam);
                };
            };
        };
        // ------------ HCAM ------------
        if (_x == "hCam") exitWith {
            _renderTarget = call {
                if (_mode == "HCAM") exitWith {"rendertarget12"};
                if (_mode == "HCAM_FULL") exitWith {"rendertarget13"}
            };
            if (!isNil "_renderTarget") then {
                _data = _value;
                if (_data != "") then {
                    [_renderTarget,_data] call FUNC(createHelmetCam);
                } else {
                    [] call FUNC(deleteHelmetCam);
                }
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
                    _text = if (_value) then {"OWN"} else {"CURS"};
                    _osdCtrl ctrlSetText _text;
                };
                _osdCtrl = _display displayCtrl IDC_OSD_HOOK_TGGL2;
                if (!isNull _osdCtrl) then {
                    _text = if (_value) then {"CURS"} else {"OWN"};
                    _osdCtrl ctrlSetText _text;
                };
            };
        };
        // ------------ MENU ------------
        if (_x == "showMenu") exitWith {
            _osdCtrl = _display displayCtrl IDC_GROUP_MENU;
            if (!isNull _osdCtrl) then {
                if (_mode == "BFT") then {
                    _osdCtrl ctrlShow (_value);
                };
            };
        };
        // ------------ UAV List Update ------------
        if (_x == "uavListUpdate") exitWith {
            if (_mode == "UAV") then {
                _data = [_deviceID,"uavCam"] call FUNC(getSettings);
                _uavListCtrl = _display displayCtrl IDC_UAVLIST;
                lbClear _uavListCtrl;
                _uavListCtrl lbSetCurSel -1;
                
                // update list of UAVs (temporary implementation)
                [] call FUNC(updateUAVList);
                
                // Populate list of UAVs
                {
                    _uavDevice = _x select 0;
                    _uavDeviceData = _x select 1;
                    _uav = D_GET_OWNER(_uavDeviceData);
                    
                    if (!(crew _uav isEqualTo [])) then {
                        _index = _uavListCtrl lbAdd format ["%1 (%2)",D_GET_CALLSIGN(_uavDeviceData),getText (configfile >> "cfgVehicles" >> typeOf _uav >> "displayname")];
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
                        [_deviceID,[["uavCam",""]]] call FUNC(setSettings);
                    };
                };
            };
        };
        // ------------ HCAM List Update ------------
        if (_x == "hCamListUpdate") exitWith {
            if (_mode == "HCAM") then {
                _data = [_deviceID,"hCam"] call FUNC(getSettings);
                _hcamListCtrl = _display displayCtrl IDC_HCAMLIST;
                // Populate list of HCAMs
                lbClear _hcamListCtrl;
                _hcamListCtrl lbSetCurSel -1;
                {
                    _index = _hcamListCtrl lbAdd format ["%1:%2 (%3)",groupId group _x,[_x] call CBA_fnc_getGroupIndex,name _x];
                    _hcamListCtrl lbSetData [_index,str _x];
                } count GVAR(Hcamlist);
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
                        [_deviceID,[["hCam",""]]] call FUNC(setSettings);
                    };
                };
            };
        };
        // ----------------------------------
    };
} forEach (_settings select 0);

// update scale and world position if we have to. If so, fill in the blanks and make the changes
if ((!isNil "_targetMapScale") || (!isNil "_targetMapWorldPos")) then {
    if (isNull _targetMapCtrl) then {
        _targetMapName = [_deviceID,"mapType"] call FUNC(getSettings);
        _mapTypes = [_deviceID,"mapTypes"] call FUNC(getSettings);
        _targetMapIDC = HASH_GET(_mapTypes,_targetMapName);
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
        _ctrlPos = ctrlPosition _loadingCtrl;
        // put the mouse position in the center of the screen
        _mousePos = [(_ctrlPos select 0) + ((_ctrlPos select 2) / 2),(_ctrlPos select 1) + ((_ctrlPos select 3) / 2)];
        // delay moving the mouse cursor by one frame using a PFH, for some reason its not working without
        [{
            [_this select 1] call CBA_fnc_removePerFrameHandler;
            setMousePosition (_this select 0);
        },0,_mousePos] call CBA_fnc_addPerFrameHandler;
    };
    
    _loadingCtrl ctrlShow false;
    while {ctrlShown _loadingCtrl} do {};
};

// call notification system
if (_interfaceInit) then {[] call FUNC(processNotifications)};

true