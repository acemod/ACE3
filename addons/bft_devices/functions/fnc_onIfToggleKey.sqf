/*
 * Author: Gundy
 *
 * Description:
 *   Called whenever a interface toggle (open/close) key is pressed. Based on situation will open or close the interface for a BFT device
 *
 * Arguments:
 *   0: 0 = Primary, 1 = Secondary, 3 = Tertiary <INTEGER>
 *
 * Return Value:
 *   Handled <BOOL>
 *
 * Example:
 *   0 call ace_bft_devices_fnc_onIfToggleKey;
 *
 * Public: No
 */

#include "script_component.hpp"

private [];

// exit if we have already an interface starting up
if (GVAR(ifOpenStart)) exitWith {false};

_previousInterface = "";

// close interface and exit if there is an interface open of the same type
if (!isNil QGVAR(ifOpen) && {GVAR(ifOpen) select 0 == _this}) exitWith {
    [] call FUNC(ifClose);
    true
};

// close interface if there is one open
if !(isNil QGVAR(ifOpen)) then {
    _previousInterface = GVAR(ifOpen) select 1;
    [] call FUNC(ifClose);
};

// see if player is carrying any devices
_playerDevices = [ACE_player] call EFUNC(bft,getOwnedDevices);

// get devices for the vehicle the player might be in
_vehicleDevices =
    if (ACE_player != vehicle ACE_player) then {
        [vehicle ACE_player] call EFUNC(bft,getOwnedDevices);
    } else {
        [];
    };

// get class name for device
_className =
    if !(_playerDevices isEqualTo []) then {
        ([_playerDevices select 0] call EFUNC(bft,getDeviceData)) select 6
    } else {
        ""
    };

_displayName = getText (configFile >> "CfgWeapons" >> _className >> QGVAR(displayName));
_dialogName = getText (configFile >> "CfgWeapons" >> _className >> QGVAR(dialogName));

_interfaceName = switch (_this) do {
    case 0: {
        if (_displayName != "") then {_displayName} else {_dialogName};
    };
    case 1: {
        if (_dialogName != "") then {_dialogName} else {_displayName};
    };
    default {QGVAR(JV5_dlg)};
};

if (_interfaceName != "" && _interfaceName != _previousInterface) then {
    // queue the start up of the interface as we might still have one closing down
    [{
        if (isNil QGVAR(ifOpen)) then {
            ((_this select 0) + [ACE_player,vehicle ACE_player]) call FUNC(ifOpen);
            [_this select 1] call CBA_fnc_removePerFrameHandler;
        };
    }, 0, [_this,_interfaceName] ] call CBA_fnc_addPerFrameHandler;
};

true