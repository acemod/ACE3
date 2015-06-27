/*
 * Author: Gundy
 *
 * Description:
 *   Handles dialog / display startup and registering of event handlers
 *       
 *   This function will define iffOpen, using the following format:
 *       Parameter 0: Device ID <STRING>
 *       Parameter 1: Interface type, 0 = Main, 1 = Secondary, 2 = Tertiary <INTEGER>
 *       Parameter 2: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg") <TRING>
 *       Parameter 3: isDialog (true if dialog, false if display) <BOOL>
 *       Parameter 4: Unit we registered the killed eventhandler for <OBJECT>
 *       Parameter 5: ID of registered eventhandler for killed event <INTEGER>
 *       Parameter 6: Vehicle we registered the GetOut eventhandler for (even if no EH is registered) <OBJECT>
 *       Parameter 7: ID of registered eventhandler for GetOut event (nil if no EH is registered) <INTEGER>
 *       Parameter 8: ID of registered eventhandler for Draw3D event (nil if no EH is registered) <INTEGER>
 *       Parameter 9: ID of registered eventhandler ACE_medical medical_onUnconscious event (nil if no EH is registered) <INTEGER>
 *       Parameter 10: ID of registered eventhandler ACE bft_updateDeviceOwner event (nil if no EH is registered) <INTEGER>
 *       Parameter 11: ID of registered eventhandler ACE playerChanged event (nil if no EH is registered) <INTEGER>
 *
 * Arguments:
 *   0: Device ID <STRING>
 *   1: Interface type, 0 = Main, 1 = Secondary, 3 = Tertiary <INTEGER>
 *   2: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg") <STRING>
 *   3: isDialog <BOOL>
 *   4: Unit to register killed EH for <OBJECT>
 *   5: Vehicle to register getOut EH for <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   // open TAD display as primary interface type
 *   ["deviceID",0,"ace_bft_devices_TAD_dsp",false] call ace_bft_devices_ifOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_interfaceType","_displayName","_player","_vehicle","_playerKilledEhId","_vehicleGetOutEhId","_inVehicle", "_deviceID", "_display", "_heading", "_isDialog", "_playerPos", "_veh"];

// exit should we have an interface open already or are in the process of starting one
if (GVAR(ifOpenStart) || (!I_CLOSED)) exitWith {false};

GVAR(ifOpenStart) = true;

_deviceID = _this select 0;
_interfaceType = _this select 1;
_displayName = _this select 2;
_isDialog = _this select 3;
_player = _this select 4;
_vehicle = _this select 5;
_inVehicle = (_vehicle != _player);

// start setting up event-handlers
GVAR(ifOpen) = [
    _deviceID,
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
    GVAR(ifOpen) set [7,
        _vehicle addEventHandler ["GetOut",{if (_this select 2 == ACE_player) then {[] call FUNC(ifClose)}}]
    ];
};

// Set up event handler to update display header / footer
// Also set up vehicle icon
if (_displayName in [QGVAR(TAD_dsp),QGVAR(TAD_dlg)]) then {
    GVAR(ifOpen) set [8,
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
    GVAR(ifOpen) set [8,
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
GVAR(ifOpen) set [9,
    ["medical_onUnconscious",{
        if (_this select 0 == ACE_player && _this select 1) then {
            [] call FUNC(ifClose);
        };
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE bft_updateDeviceOwner event
GVAR(ifOpen) set [10,
    ["bft_updateDeviceOwner",{
        // if the device ID matches the one currently open and we aren't the owner anymore, close the interface
        if ((_this select 0 == I_GET_DEVICE) && (_this select 1 != ACE_player)) then {
            [] call FUNC(ifClose);
        };
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE playerChanged event
GVAR(ifOpen) set [11,
    ["playerChanged",{
        _this call FUNC(onPlayerChanged);
    }] call EFUNC(common,addEventHandler)
];

// get device owner
_deviceData = [_deviceID] call EFUNC(bft,getDeviceData);
_deviceOwner = D_GET_OWNER(_deviceData);

// if the device is a personal device, get settings from device appData store
if (_deviceOwner isKindOf "ParachuteBase" || _deviceOwner isKindOf "CAManBase") then {
    _deviceAppData = D_GET_APP_DATA(_deviceData);
    if !(_deviceAppData isEqualTo []) then {
        // write settings to local cache
        HASH_SET(GVAR(settings),_deviceID,_deviceAppData);
    };
};

// temporary implemenation of setting the registred encryption key, should be implemented on deviceOpened event
// remove current keys
[false,EGVAR(bft,registeredEncyptionKeys)] call EFUNC(bft,updateRegisteredEncryptionKeys);
// add device keys
[true,D_GET_ENCRYPTION(_deviceData)] call EFUNC(bft,updateRegisteredEncryptionKeys);

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