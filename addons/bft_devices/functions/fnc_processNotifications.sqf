#include "script_component.hpp"
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
 *   [] call ace_bft_devices_fnc_processNotifications;
 *
 * Public: No
 */


#include "\z\ace\addons\bft_devices\UI\defines\shared_defines.hpp"

disableSerialization;

// make sure there is no PFH already, the interface is open and notifications are available
if (isNil QGVAR(processNotificationsPFH) && {!I_CLOSED} && {!(GVAR(notificationCache) isEqualTo [])}) then {
    private _displayName = I_GET_NAME;
    private _display = uiNamespace getVariable _displayName;
    private _ctrl = _display displayCtrl IDC_NOTIFICATION;

    // only proceed if there is a notification control
    if (!isNull _ctrl) then {
        // run every 4 seconds
        GVAR(processNotificationsPFH) = [{
            params ["_args", "_idPFH"];
            systemChat format ["args %1", _args];
            _args params ["_ctrl"];

            if !(I_CLOSED) then {
                if (count GVAR(notificationCache) != 0) then {
                    // grab and delete the oldest notification
                    systemChat format ["notification %1", GVAR(notificationCache)];
                    private _notification = GVAR(notificationCache) deleteAt 0;
                    _notification params ["_type", "_time1", "_time2", "_decayTime", "_counter"];

                    private _currentTime = [] call FUNC(currentTime);
                    // see if notification was issued in the same minute, if so, omit showing the time
                    private _text = [format ["%1: %2",_time1,_time2], _time2] select (_currentTime isEqualTo _time1);

                    // if the counter on the notification is greater than 1, append the counter to the notification text
                    if (_counter > 1) then {
                        _text = format ["%1 (x%2)",_text,_counter];
                    };
                    systemChat format ["%1 ctrlsettext %2", _type, _text];
                    // show the notification
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
                    _ctrl ctrlCommit _decayTime;
                } else {
                    [_idPFH] call CBA_fnc_removePerFrameHandler;
                    _ctrl ctrlShow false;
                    GVAR(processNotificationsPFH) = nil;
                };
            } else {
                [_idPFH] call CBA_fnc_removePerFrameHandler;
                GVAR(processNotificationsPFH) = nil;
            };
        }, 4, [_ctrl]] call CBA_fnc_addPerFrameHandler;
    };
};

true
