#include "script_component.hpp"

// Exit on Headless as well
if (!hasInterface) exitWith {};

LOG(MSG_INIT);

// Calculate the maximum zoom allowed for this map
call FUNC(determineZoom);

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
                    if (!(_flashlight isEqualTo "") && {isNull _glow}) then {
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
GVAR(updateActiveMap) = true;
GVAR(activeMapTypeIDC) = 51;
["loadout", {
    params ["_unit"];
    if (isNull _unit) exitWith {
        GVAR(hasWatch) = true;
        GVAR(activeMapTypeIDC) = 51;
    };
    GVAR(hasWatch) = ((assignedItems _unit) findIf {_x isKindOf ["ItemWatch", configFile >> "CfgWeapons"]}) != -1;
    GVAR(activeMapTypeIDC) = 51 max getNumber (configFile >> "CfgWeapons" >> ((assignedItems _unit) param [0, ""]) >> QGVAR(MapTypeIDC));
}, true] call CBA_fnc_addPlayerEventHandler;

["visibleMap", { GVAR(updateActiveMap) = true; }] call CBA_fnc_addPlayerEventHandler;
addMissionEventHandler ["Loaded", { GVAR(updateActiveMap) = true; }];

// Vehicle map lighting:
GVAR(vehicleLightCondition) = {true};
GVAR(vehicleExteriorTurrets) = [];
GVAR(vehicleLightColor) = [1,1,1,0];

["vehicle", {
    params ["_unit", "_vehicle"];
    if ((isNull _vehicle) || {_unit == _vehicle}) exitWith {};
    private _cfg = configfile >> "CfgVehicles" >> (typeOf _vehicle);
    GVAR(vehicleExteriorTurrets) = getArray (_cfg >> QGVAR(vehicleExteriorTurrets));
    GVAR(vehicleLightColor) = [_cfg >> QGVAR(vehicleLightColor), "array", [1,1,1,0]] call CBA_fnc_getConfigEntry;

    // Handle vehicles with toggleable interior lights:
    private _vehicleLightCondition = getText (_cfg >> QGVAR(vehicleLightCondition));
    if (_vehicleLightCondition == "") then {
        private _userAction = toLower getText (_cfg >> "UserActions" >> "ToggleLight" >> "statement");
        switch (true) do {
            case ((_userAction find "cabinlights_hide") > 0): {_vehicleLightCondition = "(_vehicle animationSourcePhase 'cabinlights_hide') == 1";};
            case ((_userAction find "cargolights_hide") > 0): {_vehicleLightCondition = "(_vehicle animationSourcePhase 'cargolights_hide') == 1";};
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
            case (_vehicle isKindOf "Wheeled_APC"): { {true} };
            case (_vehicle isKindOf "ParachuteBase"): { {false} };
            case (_vehicle isKindOf "Helicopter");
            case (_vehicle isKindOf "Plane"): { {(driver _vehicle == _unit) || {gunner _vehicle == _unit}} };
            default { {false} };
        };
    };
}, true] call CBA_fnc_addPlayerEventHandler;

// Draw map effects
["Draw", {call FUNC(onDrawMap)}, true] call EFUNC(common,addMapEventHandler);
["Draw", {call FUNC(updateMapEffects)}, true] call EFUNC(common,addMapEventHandler);

["MouseMoving", {
    params ["_control", "_x", "_y"];
    if (GVAR(isShaking) && {count GVAR(rightMouseButtonLastPos) == 2}) then {
        private _lastPos = _control ctrlMapScreenToWorld GVAR(rightMouseButtonLastPos);
        private _newPos = _control ctrlMapScreenToWorld [_x, _y];
        GVAR(lastStillPosition) set [0, (GVAR(lastStillPosition) select 0) + (_lastPos select 0) - (_newPos select 0)];
        GVAR(lastStillPosition) set [1, (GVAR(lastStillPosition) select 1) + (_lastPos select 1) - (_newPos select 1)];
        GVAR(rightMouseButtonLastPos) = [_x, _y];
        TRACE_3("Mouse Move",_lastPos,_newPos,GVAR(rightMouseButtonLastPos));
    };
}, true] call EFUNC(common,addMapEventHandler);

["MouseButtonDown", {
    params ["", "_button", "_x", "_y"];
    if (_button == 1) then {
        GVAR(rightMouseButtonLastPos) = [_x, _y];
    };
}, true] call EFUNC(common,addMapEventHandler);

["MouseButtonUp", {
    params ["", "_button"];
    if (_button == 1) then {
        GVAR(rightMouseButtonLastPos) = [];
    };
}, true] call EFUNC(common,addMapEventHandler);

//get mouse position on map
["MouseMoving", {
    params ["_control", "_x", "_y"];
    GVAR(mousePos) = _control ctrlMapScreenToWorld [_x, _y];
}, true] call EFUNC(common,addMapEventHandler);

["MouseHolding", {
    params ["_control", "_x", "_y"];
    GVAR(mousePos) = _control ctrlMapScreenToWorld [_x, _y];
}, true] call EFUNC(common,addMapEventHandler);
