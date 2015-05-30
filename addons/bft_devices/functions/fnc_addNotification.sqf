/*
 * Author: Gundy
 *
 * Description:
 *   Add a notification. The provided appID will be checked against existing notifications with the same ID and when found, the existing notification will be replaced and its counter will be increased. This is to prevent notification spam.
 *
 * Arguments:
 *   0: App ID <STRING>
 *   1: Notification <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [_appID,"This is a notification"] call ace_bft_devices_addNotification;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_appID","_notification","_time","_done"];

_appID = _this select 0;
_notification = _this select 1;
_time = call FUNC(currentTime);
_done = false;

// search for other _appID notifications
{
    // if we find one, override it and increase the counter
    if ((_x select 0) isEqualTo _appID) exitWith {
        GVAR(notificationCache) set [_forEachIndex,[_appID,_time,_notification,(_x select 3) + 1]];
        _done = true;
    };
} forEach GVAR(notificationCache);

// if we haven't added the notification to the cache above, do it now
if !(_done) then {
    GVAR(notificationCache) pushBack [_appID,_time,_notification];
};

[] call FUNC(processNotifications);

true