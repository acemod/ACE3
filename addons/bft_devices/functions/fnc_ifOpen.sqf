/*
 * Author: Gundy
 *
 * Description:
 *   Handles dialog / display startup and registering of event handlers
 *       
 *   This function will define iffOpen, using the following format:
 *       Parameter 0: Device ID <STRING>
 *       Parameter 1: Interface ID <STRING>
 *       Parameter 2: Interface type, 0 = Main, 1 = Secondary, 2 = Tertiary <INTEGER>
 *       Parameter 3: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg") <TRING>
 *       Parameter 4: isDialog (true if dialog, false if display) <BOOL>
 *       Parameter 5: Unit we registered the killed eventhandler for <OBJECT>
 *       Parameter 6: ID of registered eventhandler for killed event <INTEGER>
 *       Parameter 7: Vehicle we registered the GetOut eventhandler for (even if no EH is registered) <OBJECT>
 *       Parameter 8: ID of registered eventhandler for GetOut event (nil if no EH is registered) <INTEGER>
 *       Parameter 9: ID of registered eventhandler for Draw3D event (nil if no EH is registered) <INTEGER>
 *       Parameter 10: ID of registered eventhandler ACE_medical medical_onUnconscious event (nil if no EH is registered) <INTEGER>
 *       Parameter 11: ID of registered eventhandler ACE bft_updateDeviceOwner event (nil if no EH is registered) <INTEGER>
 *       Parameter 12: ID of registered eventhandler ACE playerChanged event (nil if no EH is registered) <INTEGER>
 *
 * Arguments:
 *   0: Device ID <STRING>
 *   1: Interface config name <STRING>
 *   2: Interface type, 0 = Main, 1 = Secondary, 3 = Tertiary <INTEGER>
 *   3: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg") <STRING>
 *   4: isDialog <BOOL>
 *   5: Unit to register killed EH for <OBJECT>
 *   6: Vehicle to register getOut EH for <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   // open TAD display as primary interface type
 *   ["deviceID","TAD",0,"ace_bft_devices_TAD_dsp",false,ACE_player,vehicle ACE_player] call ace_bft_devices_fnc_ifOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_interfaceType","_displayName","_player","_vehicle","_playerKilledEhId","_vehicleGetOutEhId","_inVehicle", "_deviceID", "_display", "_heading", "_isDialog", "_playerPos", "_veh","_interfaceID"];

// exit should we have an interface open already or are in the process of starting one
if (GVAR(ifOpenStart) || (!I_CLOSED)) exitWith {false};

GVAR(ifOpenStart) = true;

_deviceID = _this select 0;
_interface = _this select 1;
_interfaceType = _this select 2;
_displayName = _this select 3;
_isDialog = _this select 4;
_player = _this select 5;
_vehicle = _this select 6;
_inVehicle = (_vehicle != _player);

// genrate interface ID
_interfaceID = format ["%1%2",_deviceID,_interface];

// start setting up event-handlers
GVAR(ifOpen) = [
    _deviceID,
    _interfaceID,
    _interfaceType,
    _displayName,
    _isDialog,
    _player,
    _player addEventHandler ["killed",{[] call FUNC(ifClose)}],
    _vehicle,
    nil,
    nil,
    nil,
    nil,
    nil
];

// Only register the GetOut event handler for vehicle displays
if (_inVehicle && (_isDialog || _displayName in [QGVAR(TAD_dsp)])) then {
    GVAR(ifOpen) set [8,
        _vehicle addEventHandler ["GetOut",{if (_this select 2 == ACE_player) then {[] call FUNC(ifClose)}}]
    ];
};

// Set up event handler to update display header / footer
// Also set up vehicle icon
if (_displayName in [QGVAR(TAD_dsp),QGVAR(TAD_dlg)]) then {
    GVAR(ifOpen) set [9,
        addMissionEventHandler ["Draw3D",{
            _display = I_GET_DISPLAY;
            _veh = vehicle ACE_player;
            _playerPos = getPosASL _veh;
        
            // update time
            (_display displayCtrl IDC_OSD_TIME) ctrlSetText call FUNC(currentTime);
            
            // update grid position
            (_display displayCtrl IDC_OSD_GRID) ctrlSetText format ["%1", mapGridPosition _playerPos];
            
            // update current heading
            (_display displayCtrl IDC_OSD_DIR_DEGREE) ctrlSetText format ["%1°",[direction _veh,3] call CBA_fnc_formatNumber];
            
            // update current elevation (ASL) on TAD
            (_display displayCtrl IDC_OSD_ELEVATION) ctrlSetText format ["%1m",[round (_playerPos select 2),4] call CBA_fnc_formatNumber];
        }]
    ];
    GVAR(playerVehicleIcon) = if (_inVehicle) then {
        getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Icon")
    } else {
        "\A3\ui_f\data\map\VehicleIcons\iconmanvirtual_ca.paa"
    };
} else {
    GVAR(ifOpen) set [9,
        addMissionEventHandler ["Draw3D",{
            _display = I_GET_DISPLAY;
            _veh = vehicle ACE_player;
            _heading = direction _veh;
            // update time
            (_display displayCtrl IDC_OSD_TIME) ctrlSetText call FUNC(currentTime);
            
            // update grid position
            (_display displayCtrl IDC_OSD_GRID) ctrlSetText format ["%1", mapGridPosition getPosASL _veh];
            
            // update current heading
            (_display displayCtrl IDC_OSD_DIR_DEGREE) ctrlSetText format ["%1°",[_heading,3] call CBA_fnc_formatNumber];
            (_display displayCtrl IDC_OSD_DIR_OCTANT) ctrlSetText format ["%1",[_heading] call FUNC(degreeToOctant)];
        }]
    ];
    GVAR(playerVehicleIcon) = "\A3\ui_f\data\map\VehicleIcons\iconmanvirtual_ca.paa";
};

// Register with ACE_medical medical_onUnconscious event
GVAR(ifOpen) set [10,
    ["medical_onUnconscious",{
        if (_this select 0 == ACE_player && _this select 1) then {
            [] call FUNC(ifClose);
        };
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE bft_updateDeviceOwner event
GVAR(ifOpen) set [11,
    ["bft_updateDeviceOwner",{
        // if the device ID matches the one currently open and we aren't the owner anymore, close the interface
        if ((_this select 0 == I_GET_DEVICE) && (_this select 1 != ACE_player)) then {
            [] call FUNC(ifClose);
        };
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE playerChanged event
GVAR(ifOpen) set [12,
    ["playerChanged",{
        _this call FUNC(onPlayerChanged);
    }] call EFUNC(common,addEventHandler)
];

// get device owner
_deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
_deviceOwner = D_GET_OWNER(_deviceData);
_deviceAppData = D_GET_APP_DATA(_deviceData);

// if the device is a personal device, get settings from device appData store
if (!(_deviceAppData isEqualTo []) && (_deviceOwner isKindOf "ParachuteBase" || _deviceOwner isKindOf "CAManBase")) then {
    // write settings to local cache
    HASH_SET(GVAR(settings),_interfaceID,_deviceAppData);
} else {
    // if vehicle device, see if device app data is already cached, if not, retrieve from config
    if !(HASH_HASKEY(GVAR(settings),_interfaceID)) then {
        // read from config
        _deviceAppData = [_interface] call FUNC(getInterfaceSettingsFromConfig);
        
        // write to cache
        HASH_SET(GVAR(settings),_interfaceID,_deviceAppData);
    };
};

// register reporting modes
[EGVAR(bft,allReportingModes)] call EFUNC(bft,updateRegisteredModes);

// temporary helmet cam list update until implemented in BFT module
[] call FUNC(updateHCamList);

// temporary UAV list update until implemented in BFT module
[] call FUNC(updateUAVList);

// start the interface
if (_isDialog) then {
    // Check if map and / or another dialog is open and close them
    if (visibleMap) then {openMap false};
    while {dialog} do {
        closeDialog 0;
    };
    createDialog _displayName;
} else {
    GVAR(rscLayer) cutRsc [_displayName,"PLAIN",0, false];
};

true