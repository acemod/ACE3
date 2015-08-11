#include "script_component.hpp"

// Exit on Headless as well
if (!hasInterface) exitWith {};

LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

[{
    if (isNull findDisplay 12) exitWith {};

    GVAR(lastStillPosition) = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5, 0.5];
    GVAR(lastStillTime) = ACE_time;
    GVAR(isShaking) = false;

    //map sizes are multiples of 1280
    GVAR(worldSize) = worldSize / 1280;
    GVAR(mousePos) = [0.5,0.5];

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

    //get mouse position on map
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {
        GVAR(mousePos) = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
    }];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseHolding", {
        GVAR(mousePos) = (_this select 0) ctrlMapScreenToWorld [_this select 1, _this select 2];
    }];

    [_this select 1] call CBA_fnc_removePerFrameHandler;
}, 0] call CBA_fnc_addPerFrameHandler;

["SettingsInitialized", {
    // Start Blue Force Tracking if Enabled
    if (GVAR(BFT_Enabled)) then {
        GVAR(BFT_markers) = [];
        [FUNC(blueForceTrackingUpdate), GVAR(BFT_Interval), []] call CBA_fnc_addPerFrameHandler;
    };

    //illumination settings
    if (GVAR(mapIllumination)) then {
        GVAR(flashlightInUse) = "";
        GVAR(aceNVG) = ["ace_nightvision"] call EFUNC(common,isModLoaded);
        GVAR(glow) = objNull;

        ["playerInventoryChanged", {
            _flashlights = [ACE_player] call FUNC(getUnitFlashlights);
            if ((GVAR(flashlightInUse) != "") && !(GVAR(flashlightInUse) in _flashlights)) then {
                GVAR(flashlightInUse) = "";
            };
        }] call EFUNC(common,addEventHandler);

        if (GVAR(mapGlow)) then {
            ["visibleMapChanged", {
                params ["_player", "_mapOn"];
                if (_mapOn) then {
                    if (!alive _player && !isNull GVAR(glow)) then {
                        GVAR(flashlightInUse) = "";
                    };
                    if (GVAR(flashlightInUse) != "") then {
                        if (isNull GVAR(glow)) then {
                            [GVAR(flashlightInUse)] call FUNC(flashlightGlow);
                        };
                    } else {
                        if (!isNull GVAR(glow)) then {
                            [""] call FUNC(flashlightGlow);
                        };
                    };
                } else {
                    if (!isNull GVAR(glow)) then {
                        [""] call FUNC(flashlightGlow);
                    };
                };
            }] call EFUNC(common,addEventHandler);
        };
    };
}] call EFUNC(common,addEventHandler);