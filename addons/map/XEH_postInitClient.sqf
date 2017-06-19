#include "script_component.hpp"

// Exit on Headless as well
if (!hasInterface) exitWith {};

LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

[{
    if (isNull findDisplay 12) exitWith {};

    GVAR(lastStillPosition) = ((findDisplay 12) displayCtrl 51) ctrlMapScreenToWorld [0.5, 0.5];
    GVAR(lastStillTime) = CBA_missionTime;
    GVAR(isShaking) = false;

    //map sizes are multiples of 1280
    GVAR(worldSize) = worldSize / 1280;
    GVAR(mousePos) = [0.5,0.5];

    //Allow panning the lastStillPosition while mapShake is active
    GVAR(rightMouseButtonLastPos) = [];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", {_this call FUNC(updateMapEffects)}];
    ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseMoving", {
        if (GVAR(isShaking) && {(count GVAR(rightMouseButtonLastPos)) == 2}) then {
            private _lastPos = (_this select 0) ctrlMapScreenToWorld GVAR(rightMouseButtonLastPos);
            private _newPos = (_this select 0) ctrlMapScreenToWorld (_this select [1,2]);
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

["ace_settingsInitialized", {
    if (isMultiplayer && {GVAR(DefaultChannel) != -1}) then {
        //Set the chat channel once the map has finished loading
        [{
            if ((isNull findDisplay 37) && {isNull findDisplay 52} && {isNull findDisplay 53} && {isNull findDisplay 12}) exitWith {};
            [_this select 1] call CBA_fnc_removePerFrameHandler;

            setCurrentChannel GVAR(DefaultChannel);
            if (currentChannel == GVAR(DefaultChannel)) then {
                // INFO_1("Channel Set - %1", currentChannel);
            } else {
                ERROR_2("Failed To Set Channel %1 (is %2)", GVAR(DefaultChannel), currentChannel);
            };
        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };

    // Start Blue Force Tracking if Enabled
    if (GVAR(BFT_Enabled)) then {
        GVAR(BFT_markers) = [];
        [FUNC(blueForceTrackingUpdate), GVAR(BFT_Interval), []] call CBA_fnc_addPerFrameHandler;
    };

    //illumination settings
    if (GVAR(mapIllumination)) then {
        ["loadout", {
            params ["_player", ""];
            private _unitLight = _player getVariable [QGVAR(flashlight), ["", objNull]];
            _unitLight params ["_flashlight", "_glow"];
            if ((_flashlight != "") && {!(_flashlight in ([_player] call FUNC(getUnitFlashlights)))}) then {
                // remove the current glow if the unit suddenly lost it's flashlight
                if (!isNull _glow) then {
                    _glow = [_player, "", false] call FUNC(flashlightGlow);
                };
                _player setVariable [QGVAR(flashlight), ["", _glow], true];
            };
        }] call CBA_fnc_addPlayerEventHandler;

        if (GVAR(mapGlow)) then {
            ["visibleMap", {
                params ["_player", "_mapOn"];
                private _unitLight = _player getVariable [QGVAR(flashlight), ["", objNull]];
                _unitLight params ["_flashlight", "_glow"];
                private _flashlightOn = !(_flashlight isEqualTo "");
                if (_mapOn) then {
                    if (_flashlightOn && {isNull _glow}) then {
                        [_player, _flashlight] call FUNC(flashlightGlow);
                        playSound QGVAR(flashlightClick);
                    };
                } else {
                    if (!isNull _glow) then {
                        [_player, ""] call FUNC(flashlightGlow);
                    };
                };
            }] call CBA_fnc_addPlayerEventHandler;
        };
    };
}] call CBA_fnc_addEventHandler;

// hide clock on map if player has no watch
GVAR(hasWatch) = true;

["loadout", {
    params ["_unit"];
    if (isNull _unit) exitWith {
        GVAR(hasWatch) = true;
    };
    GVAR(hasWatch) = false;
    {
        if (_x isKindOf ["ItemWatch", configFile >> "CfgWeapons"]) exitWith {GVAR(hasWatch) = true;};
        false
    } count (assignedItems _unit);
}, true] call CBA_fnc_addPlayerEventHandler;
