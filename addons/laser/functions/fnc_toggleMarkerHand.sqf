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
 

params ["_unit"];

_unit setVariable [QGVAR(laserMarkerOn), !(_unit getVariable [QGVAR(laserMarkerOn),false])];
private _markerMessage = localize ([LSTRING(LaserMarkOff), LSTRING(LaserMarkOn)] select (_unit getVariable [QGVAR(laserMarkerOn), false]));
[_markerMessage] call EFUNC(common,displayTextStructured);

private _enabled = _unit getVariable QGVAR(laserMarkerOn);
if(! _enabled) exitWith {};
/*
private _markerMessage = localize ([LSTRING(LaserMarkOff), LSTRING(LaserMarkOn)] select (_vehicle getVariable [QGVAR(laserMarkerOn), false]));
[_markerMessage] call EFUNC(common,displayTextStructured);
*/

GVAR(TrackerpfID) = [{
    params ["_args", "_pfID"];
    _args params ["_unit"];
    
    private _p0 = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "lefthand"));
    private _p1 = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "righthand"));
    private _weaponDirection = _unit weaponDirection (currentWeapon _unit);
    private _laserSource = ((_p0 vectorAdd _p1) vectorMultiply (1/2));
    _laserSource = _laserSource vectorAdd ( ( vectorNormalized(_weaponDirection vectorCrossProduct (_laserSource vectorFromTo _p1))) vectorMultiply 0.025);
    
    if ( !(_unit getVariable [QGVAR(laserMarkerOn), false]) || !(alive _unit) || (currentWeapon _unit) != "Laserdesignator" ) exitWith {
        [_pfID] call CBA_fnc_removePerFrameHandler;
    };
    if (isNull (laserTarget _unit)) exitWith {};
    private _intersects= lineIntersectsSurfaces [_laserSource, _laserSource vectorAdd (_weaponDirection vectorMultiply 10000), _unit];
    private _laserPos = _laserSource vectorAdd (_weaponDirection vectorMultiply 10000);
    if(count _intersects > 0) then {
        _laserPos = (_intersects select 0) select 0;
    };
    private _distance = ( (_laserPos distance _laserSource) max ((getPosASL (laserTarget _unit)) distance (_laserSource)) ) + 1.5;
    private _vector = _laserSource vectorFromTo _laserPos;
    
    private _list = [];
    private _num = 15;
    for "_i" from 1 to _num do {
        private _toPos = (_laserSource vectorAdd (_vector vectorMultiply _distance)) vectorAdd [sin(_i*(360/_num))*0.005,cos(_i*(360/_num))*0.005,0];
        _list pushback [ASLToAGL (_laserSource), ASLToAGL (_toPos), [0.8,1,0.8,1]];
    };
    [_list] remoteExec [QFUNC(drawLaserLine), 0, false];
}, 0, [_unit]] call CBA_fnc_addPerFrameHandler;
