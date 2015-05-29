/*
 * Author: Gundy
 *
 * Description:
 *   Process cached notifications
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_processNotifications;
 *
 * Public: No
 */

#include "script_component.hpp"

#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

private ["_displayName","_display","_ctrl","_currentTime","_text","_notification"];

// make sure there is no PFH already, the interface is open and notifications are available
if (isNil QGVAR(processNotificationsPFH) && !(I_CLOSED) && count GVAR(notificationCache) != 0) then {
    _displayName = I_GET_NAME;
    _display = uiNamespace getVariable _displayName;
    _ctrl = _display displayCtrl IDC_NOTIFICATION;
    
    // only proceed if there is a notification control
    if (!isNull _ctrl) then {
        // run every 4 seconds
        GVAR(processNotificationsPFH) = [{
            private ["_ctrl","_notification"];
            
            if !(I_CLOSED) then {
                if (count GVAR(notificationCache) != 0) then {
                    // grab and delete the oldest notification
                    _notification = GVAR(notificationCache) deleteAt 0;
                    
                    _currentTime = [] call FUNC(currentTime);
                    // see if notification was issued in the same minute, if so, omit showing the time
                    if (_currentTime isEqualTo (_notification select 1)) then {
                        _text = format ["%1",_notification select 2];
                    } else {
                        _text = format ["%1: %2",_notification select 1,_notification select 2];
                    };
                    // if the counter on the notification is greater than 1, append the counter to the notification text
                    if ((_notification select 3) > 1) then {
                        _text = format ["%1 (x%2)",_text,_notification select 3];
                    };
                    
                    // show the notification
                    _ctrl = _this select 0 select 0;
                    _ctrl ctrlSetText _text;
                    // make the control visible (it might have had its fade set to 1 before)
                    _ctrl ctrlSetFade 0;
                    _ctrl ctrlCommit 0;
                    _ctrl ctrlShow true;
                    
                    // bring the control to the front. Enable is required before focus can be set
                    _ctrl ctrlEnable true;
                    ctrlSetFocus _ctrl;
                    _ctrl ctrlEnable false;
                    
                    // make the control fade out
                    _ctrl ctrlSetFade 1;
                    _ctrl ctrlCommit 5;
                } else {
                    [_this select 1] call CBA_fnc_removePerFrameHandler;
                    _ctrl ctrlShow false;
                    GVAR(processNotificationsPFH) = nil;
                };
            } else {
                [_this select 1] call CBA_fnc_removePerFrameHandler;
                GVAR(processNotificationsPFH) = nil;
            };
        },4,[_ctrl]] call CBA_fnc_addPerFrameHandler;
    };
};

true