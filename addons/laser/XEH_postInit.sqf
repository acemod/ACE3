#include "script_component.hpp"

if (hasInterface) then {
#include "initKeybinds.sqf"

    GVAR(pfID) = -1;

    ["ace_settingsInitialized", {
        ["turret", LINKFUNC(showVehicleHud), false] call CBA_fnc_addPlayerEventHandler;
        ["vehicle", LINKFUNC(showVehicleHud), true] call CBA_fnc_addPlayerEventHandler; // only one of these needs the retro flag

        // Add UAV Control Compatibility
        ["ACE_controlledUAV", {
            params ["_UAV", "_seatAI", "_turret", "_position"];
            TRACE_4("ACE_controlledUAV EH",_UAV,_seatAI,_turret,_position);
            if ( !isNull _seatAI) then {
                [_seatAI] call FUNC(showVehicleHud);
            } else {
                [ace_player] call FUNC(showVehicleHud);
            };
        }] call CBA_fnc_addEventHandler;
    }] call CBA_fnc_addEventHandler;
};

// Global Laser EHs
["ace_laserOn", {
    params ["_uuid", "_args"];
    TRACE_2("ace_laserOn eh",_uuid,_args);
    [GVAR(laserEmitters), _uuid, _args] call CBA_fnc_hashSet;
    private _unit = _args select 0;
    if (hasPilotCamera _unit) then {
        [_unit] call FUNC(laserPointTrack);
    };
}] call CBA_fnc_addEventHandler;

["ace_laserOff", {
    params ["_uuid"];
    TRACE_1("ace_laserOn eh",_uuid);
    if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
        [GVAR(laserEmitters), _uuid] call CBA_fnc_hashRem;
    };
}] call CBA_fnc_addEventHandler;

["ace_markerOn", {
    params ["_uuid", "_args"];
    _args params ["_vehicle"];
    private _found = false;
    {
        _x params ["_unit", "_sourceName", "_selectedWeapon", "_selectedTurret", "_pilotLaser", "_active"];
        if(isNull _unit) exitWith {};
        if (_unit == _vehicle) exitWith {
            _found = true;
            GVAR(laserMarkers) set [_forEachIndex, [_unit, _sourceName, _selectedWeapon, _selectedTurret, _pilotLaser, true]];
            private _markerMessage = localize ([LSTRING(LaserMarkOff), LSTRING(LaserMarkOn)] select (true));
            [_markerMessage] call EFUNC(common,displayTextStructured);
            _unit setVariable [QGVAR(laserMarkerOn), true];
        };
    } forEach GVAR(laserMarkers);

    //If not in the list; add to the list
    if (! _found) then {
        private _weapons = weapons _vehicle;
        {
            _weapons = _weapons + (_vehicle weaponsTurret _x);
        } forEach (allTurrets _vehicle);
        private _selectedWeapon = "";
        private _selectedTurret = [];
        private _sourcePoint = "";
        private _hasMarker = false;
        private _pilotLaser = false;
        {
            if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Laser")) == 1) exitWith {
                _selectedWeapon = _x;
                _y = _x;
                _hasMarker = (getNumber (configFile >> "CfgWeapons" >> _x >> QUOTE(ADDON) >> "markerEnabled")) > 0;
                if (_hasMarker) then {
                    _pilotLaser = (getNumber (configFile >> "CfgWeapons" >> _x >> QUOTE(ADDON) >> "pilotLaser")) > 0;
                    if(_pilotLaser) then {
                        _sourcePoint = getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "memoryPointDriverOptics");
                    };
                };
                {
                    private _turretWeapons = _vehicle weaponsTurret _x;
                    if (_turretWeapons find _y > -1) then {
                        private _turretConfig = [_vehicle, _x] call CBA_fnc_getTurret;
                        _selectedTurret = _x;
                        _sourcePoint = getText(_turretConfig >> "memoryPointGunnerOptics");
                    };
                } forEach (allTurrets _vehicle);
            };
        } forEach _weapons;
        if(allUnitsUAV find _vehicle > -1) then {
            _sourcePoint = getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "uavCameraGunnerPos");
        };
        GVAR(laserMarkers) pushBack [_vehicle, _sourcePoint, _selectedWeapon, _selectedTurret, _pilotLaser, false];
    };

    
}] call CBA_fnc_addEventHandler;

["ace_markerOff", {
    params ["_uuid", "_args"];
    _args params ["_vehicle"];
    {
        _x params ["_unit", "_sourceName", "_selectedWeapon", "_selectedTurret", "_pilotLaser", "_active"];
        if(isNull _unit) exitWith {};
        if (_unit == _vehicle) exitWith {
            _vehicle setVariable [QGVAR(laserMarkerOn), false];
            GVAR(laserMarkers) set [_forEachIndex, [_vehicle, _sourceName, _selectedWeapon, _selectedTurret, _pilotLaser, false]];
            private _markerMessage = localize ([LSTRING(LaserMarkOff), LSTRING(LaserMarkOn)] select (false));
            [_markerMessage] call EFUNC(common,displayTextStructured);
        };
    } forEach GVAR(laserMarkers);
    
}] call CBA_fnc_addEventHandler;

[QGVAR(updateCode), {
    params ["_uuid", "_newCode"];
    TRACE_2("ace_laser_updateCode eh",_uuid,_newCode);
    if ([GVAR(laserEmitters), _uuid] call CBA_fnc_hashHasKey) then {
        private _laserArray = [GVAR(laserEmitters), _uuid] call CBA_fnc_hashGet;
        TRACE_2("updating",_newCode,_laserArray select 4);
        _laserArray set [4, _newCode];
    };
}] call CBA_fnc_addEventHandler;

["AllVehicles", "init", {
    params ["_unit"];
    
    private _weapons = weapons _unit;
    {
        _weapons = _weapons + (_unit weaponsTurret _x);
    } forEach (allTurrets _unit);
    
    private _selectedWeapon = "";
    private _selectedTurret = [];
    private _sourcePoint = "";
    private _hasMarker = false;
    private _pilotLaser = false;
    {
        if ((getNumber (configFile >> "CfgWeapons" >> _x >> "Laser")) == 1) exitWith {
            _selectedWeapon = _x;
            _y = _x;
            _hasMarker = (getNumber (configFile >> "CfgWeapons" >> _x >> QUOTE(ADDON) >> "markerEnabled")) > 0;
            if (_hasMarker) then {
                _pilotLaser = (getNumber (configFile >> "CfgWeapons" >> _x >> QUOTE(ADDON) >> "pilotLaser")) > 0;
                if(_pilotLaser) then {
                    _sourcePoint = getText (configfile >> "CfgVehicles" >> (typeOf _unit) >> "memoryPointDriverOptics");
                };
            };
            {
                private _turretWeapons = _unit weaponsTurret _x;
                if (_turretWeapons find _y > -1) then {
                    private _turretConfig = [_unit, _x] call CBA_fnc_getTurret;
                    _selectedTurret = _x;
                    _sourcePoint = getText(_turretConfig >> "memoryPointGunnerOptics");
                };
            } forEach (allTurrets _unit);
        };
    } forEach _weapons;

    if(allUnitsUAV find _unit > -1) then {
        _sourcePoint = getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "uavCameraGunnerPos");
    };
    
    GVAR(laserMarkers) pushBack [_unit, _sourcePoint, _selectedWeapon, _selectedTurret, _pilotLaser, false];

    if (hasPilotCamera _unit) then {
        _unit setVariable [QGVAR(hasLaserSpotTracker), true];
        _unit setVariable [QGVAR(laserSpotTrackerOn), false];
        private _actionOff = ["LSTOff", localize LSTRING(LSTOff), "", {[_this select 0] call FUNC(toggleLST)}, {(_this select 0) getVariable [QGVAR(laserSpotTrackerOn), false]}] call ace_interact_menu_fnc_createAction;
        [_unit, 1, ["ACE_SelfActions"], _actionOff] call ace_interact_menu_fnc_addActionToObject;
        private _actionOn = ["LSTOn", localize LSTRING(LSTOn), "", {[_this select 0] call FUNC(toggleLST)}, {!((_this select 0) getVariable [QGVAR(laserSpotTrackerOn), false])}] call ace_interact_menu_fnc_createAction;
        [_unit, 1, ["ACE_SelfActions"], _actionOn] call ace_interact_menu_fnc_addActionToObject;
    };

    if (_hasMarker && !(_unit isKindOf "Man")) then {
        _unit setVariable [QGVAR(laserMarkerOn), false];
        private _actionOff = ["LaserMarkerOff", localize LSTRING(laserMarkOff), "", {[_this select 0] call FUNC(toggleMarker)}, {(_this select 0) getVariable [QGVAR(laserMarkerOn), false]}] call ace_interact_menu_fnc_createAction;
        [_unit, 1, ["ACE_SelfActions"], _actionOff] call ace_interact_menu_fnc_addActionToObject;
        private _actionOn = ["LaserMarkerOn", localize LSTRING(laserMarkOn), "", {[_this select 0] call FUNC(toggleMarker)}, {!((_this select 0) getVariable [QGVAR(laserMarkerOn), false])}] call ace_interact_menu_fnc_createAction;
        [_unit, 1, ["ACE_SelfActions"], _actionOn] call ace_interact_menu_fnc_addActionToObject;
    };
}, true, [], true] call CBA_fnc_addClassEventHandler;

[] call FUNC(manageMarkers);

// Shows detector and mine posistions in 3d when debug is on
#ifdef DRAW_LASER_INFO
addMissionEventHandler ["Draw3D", {_this call FUNC(dev_drawVisibleLaserTargets)}];
#endif
