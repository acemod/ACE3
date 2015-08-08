#include "script_component.hpp"

// Exit on Headless as well
if !(hasInterface) exitWith {};

LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

// This spawn is probably worth keeping, as pfh don't work natively on the briefing screen and IDK how reliable the hack we implemented for them is.
// The thread dies as soon as the mission start, so it's not really compiting for scheduler space.
[] spawn {
    // Wait until the map display is detected
    waitUntil {(!isNull findDisplay 12)};

    GVAR(lastStillPosition) = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5, 0.5];
    GVAR(lastStillTime) = ACE_time;
    GVAR(isShaking) = false;

    //Allow panning the lastStillPosition while mapShake is active
    GVAR(rightMouseButtonLastPos) = [];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {[] call FUNC(updateMapEffects);}];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {
        if (GVAR(isShaking) && {(count GVAR(rightMouseButtonLastPos)) == 2}) then {
            private["_lastPos", "_newPos"];
            _lastPos = (_this select 0) ctrlMapScreenToWorld GVAR(rightMouseButtonLastPos);
            _newPos = (_this select 0) ctrlMapScreenToWorld (_this select [1,2]);
            GVAR(lastStillPosition) set [0, (GVAR(lastStillPosition) select 0) + (_lastPos select 0) - (_newPos select 0)];
            GVAR(lastStillPosition) set [1, (GVAR(lastStillPosition) select 1) + (_lastPos select 1) - (_newPos select 1)];
            GVAR(rightMouseButtonLastPos) = _this select [1,2];
            TRACE_3("Mouse Move",_lastPos,_newPos,GVAR(rightMouseButtonLastPos));
        };
    }];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", {
        if ((_this select 1) == 1) then {
            GVAR(rightMouseButtonLastPos) = _this select [2,2];
        };
    }];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonUp", {
        if ((_this select 1) == 1) then {
            GVAR(rightMouseButtonLastPos) = [];
        };
    }];
};

["SettingsInitialized", {
    // Start Blue Force Tracking if Enabled
    if (GVAR(BFT_Enabled)) then {
        diag_log text "[ACE] Blue Force Tracking Enabled (client)";
        GVAR(BFT_markers) = [];
        [FUNC(blueForceTrackingUpdate), GVAR(BFT_Interval), []] call CBA_fnc_addPerFrameHandler;
    };
}] call EFUNC(common,addEventHandler);
