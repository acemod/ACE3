/*
 * Author: Gundy
 *
 * Description:
 *   Take control of the currently selected UAV's gunner turret
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_remoteControlUAV;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_uavGunner"];

// see if there is a selected UAV and if it is alive before continuing
if (isNil QGVAR(actUav) || {!alive GVAR(actUav)}) exitWith {false};

// make sure there is noone currently controlling the gunner seat
// unfortunately this fails as soon as there is a driver connected as only one unit is returned using UAVControl and it will alwasys be the driver if present.
// see http://feedback.arma3.com/view.php?id=23693
if (UAVControl GVAR(actUav) select 1 != "GUNNER") then {
    // see if there is actually a gunner AI that we can remote control
    _uavGunner = gunner GVAR(actUav);
    if (!isNull _uavGunner) then {
        [] call FUNC(ifClose);
        player remoteControl _uavGunner;
        GVAR(actUav) switchCamera "Gunner";
        GVAR(uavViewActive) = true;
        // spawn a loop in-case control of the UAV is released elsewhere
        [{
            if (cameraOn != (_this select 0) || !GVAR(uavViewActive)) then {
                [_this select 1] call CBA_fnc_removePerFrameHandler;
                GVAR(uavViewActive) = false;
            };
        },0,GVAR(actUav)] call CBA_fnc_addPerFrameHandler;
    } else {
        // show notification
        ["UAV","No gunner optics available",5] call FUNC(addNotification);
    };
} else {
    // show notification
    ["UAV","Another user has control",5] call FUNC(addNotification);
};

true