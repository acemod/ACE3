#include "script_component.hpp"
/*
 * Author: LorenLuke
 * Toggles the marker laser mode for any laser-designating vehicle;
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [vehicle player] call ace_laser_fnc_toggleMarker
 *
 * Public: No
 */
 

params ["_vehicle"];

_hasMarker = _vehicle getVariable [QGVAR(hasMarkerLaser), false];
if ( ! _hasMarker) exitWith {};

private _enabled = _vehicle getVariable [QGVAR(laserMarkerOn), false];
_vehicle setVariable [QGVAR(laserMarkerOn), ! _enabled];

private _markerMessage = localize ([LSTRING(LaserMarkOff), LSTRING(LaserMarkOn)] select (_vehicle getVariable [QGVAR(laserMarkerOn), false]));
[_markerMessage] call EFUNC(common,displayTextStructured);

private _weapon = "";
private _weapons = weapons _vehicle;
{
    _weapons = _weapons + (_vehicle weaponsTurret _x);
} forEach (allTurrets _vehicle);

if (_weapons find "Laserdesignator_mounted" > -1) then {
    _weapon = "Laserdesignator_mounted";
} else {
    _weapon = "Laserdesignator_pilotCamera";
};

private _sourcePoint = "";
if (hasPilotCamera _vehicle && (_weapon == "Laserdesignator_pilotCamera")) then {
    _sourcePoint = getText (configfile >> "CfgVehicles" >> (typeOf _vehicle) >> "memoryPointDriverOptics");
} else {
    {
        private _weapons = _vehicle weaponsTurret _x;
        
        if (_weapons find _weapon > -1) then {
            private _turretConfig = [_vehicle, _x] call CBA_fnc_getTurret;
            _sourcePoint = getText(_turretConfig >> "memoryPointGunnerOptics");
        };
    } forEach (allTurrets _vehicle);
};

GVAR(TrackerpfID) = [{
    params ["_args", "_pfID"];
    _args params ["_vehicle","_sourcePoint","_turret"];
    
    if (isNil "_turret" || {isNull _turret}) then {
        _turret = _vehicle;
    };
    
    if ( !(_vehicle getVariable [QGVAR(laserMarkerOn), false]) || !(alive _vehicle) ) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    if (isNull (laserTarget _turret)) exitWith {};

    private _laserSource = (_vehicle modelToWorldVisualWorld (_vehicle selectionPosition _sourcePoint));
    
    private _laserPos = getPosASL (laserTarget _turret);
    private _distance = (_laserPos distance _laserSource) + 1.5;
    private _vector = _laserSource vectorFromTo _laserPos;
    
    private _num = 15;
    for "_i" from 1 to _num do {
        private _toPos = (_laserSource vectorAdd (_vector vectorMultiply _distance)) vectorAdd [sin(_i*(360/_num))*0.075,cos(_i*(360/_num))*0.075,0];
        [ASLToAGL (_laserSource), ASLToAGL (_toPos), [0.8,1,0.8,1]] remoteExec [QFUNC(drawLaserLine), 0, false];
    };
}, 0, [_vehicle, _sourcePoint]] call CBA_fnc_addPerFrameHandler;
