#include "script_component.hpp"

// Exit on Headless as well
if (!hasInterface) exitWith {};

LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

GVAR(flashlights) = [] call CBA_fnc_createNamespace;

["CBA_settingsInitialized", {
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
                if (_mapOn) then {
                    if (_flashlight isNotEqualTo "" && {isNull _glow}) then {
                        [_player, _flashlight] call FUNC(flashlightGlow);
                        if ([_player, _flashlight] call FUNC(needPlaySound)) then {playSound QGVAR(flashlightClick)};
                    };
                } else {
                    if (!isNull _glow) then {
                        [_player, ""] call FUNC(flashlightGlow);
                        if ([_player, _flashlight] call FUNC(needPlaySound)) then {playSound QGVAR(flashlightClick)};
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


// Vehicle map lighting:
GVAR(vehicleLightCondition) = {true};
GVAR(vehicleExteriorTurrets) = [];
GVAR(vehicleLightColor) = [1,1,1,0];

["vehicle", {
    params ["_unit", "_vehicle"];
    if ((isNull _vehicle) || {_unit == _vehicle}) exitWith {};
    private _cfg = configOf _vehicle;
    GVAR(vehicleExteriorTurrets) = getArray (_cfg >> QGVAR(vehicleExteriorTurrets));
    GVAR(vehicleLightColor) = [_cfg >> QGVAR(vehicleLightColor), "array", [1,1,1,0]] call CBA_fnc_getConfigEntry;

    // Handle vehicles with toggleable interior lights:
    private _vehicleLightCondition = getText (_cfg >> QGVAR(vehicleLightCondition));
    if (_vehicleLightCondition == "") then {
        private _userAction = toLower getText (_cfg >> "UserActions" >> "ToggleLight" >> "statement");
        if (
            false // isClass (_cfg >> "compartmentsLights")
            || {_userAction find "cabinlights_hide" > 0}
            || {_userAction find "cargolights_hide" > 0}
        ) then {
            _vehicleLightCondition = "false";
        };
    };

    GVAR(vehicleLightCondition) = if (_vehicleLightCondition != "") then {
        if (_vehicle isKindOf "Helicopter" || {_vehicle isKindOf "Plane"}) then {
            compile format ["(driver _vehicle == _unit) || {gunner _vehicle == _unit} || {%1}", _vehicleLightCondition];
        } else {
            compile _vehicleLightCondition
        };
    } else {
        switch (true) do {
            case (_vehicle isKindOf "Tank");
            case (_vehicle isKindOf "Wheeled_APC_F"): { {true} };
            case (_vehicle isKindOf "ParachuteBase"): { {false} };
            case (_vehicle isKindOf "Helicopter");
            case (_vehicle isKindOf "Plane"): { {(driver _vehicle == _unit) || {gunner _vehicle == _unit}} };
            default { {false} };
        };
    };
}, true] call CBA_fnc_addPlayerEventHandler;

// compartmentsLights work only when cameraView == "INTERNAL" so we switch it on map opening
["visibleMap", {
    params ["_player", "_mapOn"];
    if (_mapOn) then {
        if (!isClass (configOf vehicle _player >> "compartmentsLights") || {cameraView == "INTERNAL"}) exitWith {};
        GVAR(cameraViewLast) = cameraView;
        vehicle _player switchCamera "INTERNAL";
    } else {
        if (isNil QGVAR(cameraViewLast)) exitWith {};
        vehicle _player switchCamera GVAR(cameraViewLast);
        GVAR(cameraViewLast) = nil;
    };
}] call CBA_fnc_addPlayerEventHandler;
