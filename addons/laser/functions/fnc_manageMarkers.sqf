#include "script_component.hpp"

/*
/*
 * Author: LorenLuke
 * Used to initiate long-running PFH for laser markers;
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_laser_fnc_manageMarkers
 *
 * Public: No
 */

[{
    if ((currentVisionMode ACE_player) == 0) exitWith {};
    if(count GVAR(laserMarkers) < 1) exitWith {};

    //randomly schedule an occasional pruning
    if ((random 5000) < 2) then {
        {
            _x params ["_unit", "_sourceName", "_selectedWeapon", "_selectedTurret", "_pilotLaser", "_active"];
            private _weapons = weapons _unit;
            {
                _weapons = _weapons + (_unit weaponsTurret _x);
            } forEach (allTurrets _unit);
            if(_weapons find _selectedWeapon < 0) then {
                GVAR(laserMarkers) deleteAt _forEachIndex;
            };
        } forEach GVAR(laserMarkers);
    };

    {
        _x params ["_unit", "_sourceName", "_selectedWeapon", "_selectedTurret", "_pilotLaser", "_active"];
        if(_active) then {
            private _laserTargetPos = getPosASL (laserTarget _unit);
            if (_laserTargetPos isEqualTo [0,0,0]) then {
                {
                    _x params ["_targetObject", "_owner", "_laserUuid", "_laserCode"];
                    if(_owner == _unit) exitWith {
                        _laserTargetPos = getPosASL _targetObject;
                    };
                } forEach GVAR(trackedLaserTargets);
            };
            if(! (_laserTargetPos isEqualTo [0,0,0])) then {
                private _laserSource = [0,0,0];
                private _direction = _unit weaponDirection _selectedWeapon;
                if(count _selectedTurret > 0) then {
                    private _turretConfig = [_unit, _selectedTurret] call CBA_fnc_getTurret;
                    _sourceName = getText(_turretConfig >> "memoryPointGunnerOptics");
                    private _gunEnd = getText(_turretConfig >> "gunEnd");
                    private _gunBeg = getText(_turretConfig >> "gunBeg");
                    if( !((_gunEnd == "") || (_gunBeg == "")) ) then {
                        private _modelPos =  (vehicle player selectionPosition _gunEnd) vectorFromTo (vehicle player selectionPosition _gunBeg);
                        _direction = (_unit ModelToWorldVisual [0,0,0]) vectorFromTo (_unit modelToWorldVisual _modelPos);
                    } else {
                        private _animationSourceBody = getText(_turretConfig >> "animationSourceBody");
                        private _animationSourceGun = getText(_turretConfig >> "animationSourceGun");
                        private _gBody = -deg(_unit animationPhase _animationSourceBody);
                        private _gGun = deg(_unit animationPhase _animationSourceGun);
                        private _modelPos = _unit vectorModelToWorldVisual ([1, _gBody, _gGun] call CBA_fnc_polar2vect);
                        _direction = (_unit ModelToWorldVisual [0,0,0]) vectorFromTo (_unit modelToWorldVisual _modelPos);
                    };
                };

                if( _pilotLaser) then {
                    _direction = (_unit modelToWorldWorld [0,0,0]) vectorFromTo (_unit modelToWorldWorld (getPilotCameraDirection _unit));
                };

                
                if(_sourceName == "") then {
                    private _p0 = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "lefthand"));
                    private _p1 = AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "righthand"));
                    _laserSource = ((_p0 vectorAdd _p1) vectorMultiply (1/2));
                    _laserSource = _laserSource vectorAdd ( ( vectorNormalized(_direction vectorCrossProduct (_laserSource vectorFromTo _p1))) vectorMultiply 0.025);
                } else {
                    _laserSource = _unit modelToWorldVisualWorld (_unit selectionPosition _sourceName);
                };

                _vecCos = acos(_direction vectorCos (_laserSource vectorFromTo _laserTargetPos));
                if( acos(_direction vectorCos (_laserSource vectorFromTo _laserTargetPos)) > 0.01) then {
                    private _intersects= lineIntersectsSurfaces [_laserSource, _laserSource vectorAdd (_direction vectorMultiply 10000), _unit];
                    _laserTargetPos = _laserSource vectorAdd (_direction vectorMultiply 10000);
                    if(count _intersects > 0) then {
                        _laserPos = (_intersects select 0) select 0;
                    };
                };
                
                private _distance = ( (_laserTargetPos distance _laserSource) max ((getPosASL (laserTarget _unit)) distance (_laserSource)) ) + 1.5;
                private _vector = _laserSource vectorFromTo _laserTargetPos;
                
                private _num = 13;
                private _diam = 0.005;
                for "_i" from 1 to _num do {
                    private _toPos = (_laserSource vectorAdd (_vector vectorMultiply _distance)) vectorAdd [sin(_i*(360/_num))*_diam,cos(_i*(360/_num))*_diam,0];
                    drawLine3D [ASLToAGL (_laserSource), ASLToAGL (_toPos), [0.8,1,0.8,1]];
                };
            };
        };
    
    } forEach GVAR(laserMarkers);

}, 0, []] call CBA_fnc_addPerFrameHandler;