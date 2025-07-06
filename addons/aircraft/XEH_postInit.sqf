#include "script_component.hpp"

[QGVAR(droneModifyWaypoint), LINKFUNC(droneModifyWaypoint)] call CBA_fnc_addEventHandler;
[QGVAR(droneSetWaypoint), LINKFUNC(droneSetWaypoint)] call CBA_fnc_addEventHandler;

if (hasInterface) then {
    ["ACE_controlledUAV", LINKFUNC(droneAddActions)] call CBA_fnc_addEventHandler;

    // Fix turret returning to old stabilized position when zooming in from unstabilized mode to stabilized mode
    addUserActionEventHandler ["zoomIn", "Activate", {
        // In Zeus or Splendid Camera cameraView = "INTERNAL"
        if (cameraView isNotEqualTo "GUNNER") exitWith {};

        private _vehicle = objectParent ACE_player;
        if (isNull _vehicle) exitWith {};

        private _turret = _vehicle unitTurret ACE_player;
        if (_turret in [[], [-1]]) exitWith {};

        private _opticsCfg = "true" configClasses (([typeOf _vehicle, _turret] call CBA_fnc_getTurret) >> "OpticsIn");
        private _count = count _opticsCfg;
        private _currOpticsMode = _vehicle getTurretOpticsMode _turret;
        if (_count < 2 || {_currOpticsMode + 1 == _count}) exitWith {};

        private _currStabilized = getNumber (_opticsCfg select _currOpticsMode >> "directionStabilized");
        private _nextStabilized = getNumber (_opticsCfg select (_currOpticsMode + 1) >> "directionStabilized");
        if (_currStabilized != 0 || {_nextStabilized != 1}) exitWith {};

        _vehicle lockCameraTo [AGLToASL positionCameraToWorld [0, 0, 1000], _turret, true];
        [{ params ["_vehicle", "_turret"]; _vehicle lockCameraTo [objNull, _turret, true]; }, [_vehicle, _turret]] call CBA_fnc_execNextFrame;
    }];
};
