/*
 * Author: Gundy
 *
 * Description:
 *   Handles dialog / display startup and registering of event handlers
 *       
 *   This function will define iffOpen, using the following format:
 *       Parameter 0: Device ID <STRING>
 *       Parameter 1: Interface type, 0 = Main, 1 = Secondary, 2 = Tertiary
 *       Parameter 2: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg")
 *       Parameter 3: Unit we registered the killed eventhandler for
 *       Parameter 4: ID of registered eventhandler for killed event
 *       Parameter 5: Vehicle we registered the GetOut eventhandler for (even if no EH is registered)
 *       Parameter 6: ID of registered eventhandler for GetOut event (nil if no EH is registered)
 *       Parameter 7: ID of registered eventhandler for Draw3D event (nil if no EH is registered)
 *       Parameter 8: ID of registered eventhandler ACE_medical medical_onUnconscious event (nil if no EH is registered)
 *       Parameter 9: ID of registered eventhandler ACE playerInventoryChanged event (nil if no EH is registered)
 *       Parameter 10: ID of registered eventhandler ACE playerChanged event (nil if no EH is registered)
 *
 * Arguments:
 *   0: Interface type, 0 = Main, 1 = Secondary <INTEGER>
 *   1: Name of uiNameSpace variable for display / dialog (i.e. "ace_bft_devices_TAD_dlg") <STRING>
 *   2: Unit to register killed eventhandler for <OBJECT>
 *   3: Vehicle to register GetOut eventhandler for <OBJECT>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   // open TAD display as primary interface type
 *   [0,"ace_bft_devices_TAD_dsp",player,vehicle player] call ace_bft_devices_ifOpen;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_interfaceType","_displayName","_player","_vehicle","_playerKilledEhId","_vehicleGetOutEhId","_inVehicle"];

// exit should we have an interface open already or are in the process of starting one
if (GVAR(ifOpenStart) || (!I_CLOSED)) exitWith {false};

GVAR(ifOpenStart) = true;

_deviceID = _this select 0;
_interfaceType = _this select 1;
_displayName = _this select 2;
_player = _this select 3;
_vehicle = _this select 4;
_inVehicle = (_vehicle != _player);

_isDialog = [_displayName] call FUNC(isDialog);

// start setting up event-handlers
GVAR(ifOpen) = [
    _deviceID,
    _interfaceType,
    _displayName,
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
    GVAR(ifOpen) set [6,
        _vehicle addEventHandler ["GetOut",{if (_this select 2 == ACE_player) then {[] call FUNC(ifClose)}}]
    ];
};

// Set up event handler to update display header / footer
// Also set up vehicle icon
if (_displayName in [QGVAR(TAD_dsp),QGVAR(TAD_dlg)]) then {
    GVAR(ifOpen) set [7,
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
    GVAR(ifOpen) set [7,
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
GVAR(ifOpen) set [8,
    ["medical_onUnconscious",{
        if (_this select 0 == ACE_player && _this select 1) then {
            [] call FUNC(ifClose);
        };
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE playerInventoryChanged event
// use bft_updateDeviceOwner instead and check for 0: deviceID matches the currently open one and 1: owner == ACE_player
GVAR(ifOpen) set [9,
    ["playerInventoryChanged",{
        _this call FUNC(onPlayerInventoryChanged);
    }] call EFUNC(common,addEventHandler)
];

// Register with ACE playerChanged event
GVAR(ifOpen) set [10,
    ["playerChanged",{
        _this call FUNC(onPlayerChanged);
    }] call EFUNC(common,addEventHandler)
];

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