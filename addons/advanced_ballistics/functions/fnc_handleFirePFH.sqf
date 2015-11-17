/*
 * Author: Glowbal, Ruthberg, joko // Jonas
 * Handle the PFH for Bullets
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

private "_deleted";

_deleted = 0;

_aceTimeSecond = floor ACE_time;

{
    private ["_bulletVelocity", "_bulletPosition", "_bulletSpeed"];
    _x params["_bullet","_caliber","_bulletTraceVisible","_index"];

    _bulletVelocity = velocity _bullet;

    _bulletSpeed = vectorMagnitude _bulletVelocity;

    if (!alive _bullet || _bulletSpeed < 100) then {
        GVAR(allBullets) deleteAt _forEachIndex;

        // An index was removed, remember to account for it
        _forEachIndex = _forEachIndex - 1;
    } else {
        _bulletPosition = getPosASL _bullet;

        if (_bulletTraceVisible && _bulletSpeed > 500) then {
            drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.02*_caliber,0.01*_caliber],[[0,0,0,0.65],[0,0,0,0.2]],[1,0],0,0,"","",""];
        };

        call compile ("ace_advanced_ballistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6:%7", _index, _bulletVelocity, _bulletPosition, ACE_wind, ASLToATL(_bulletPosition) select 2, _aceTimeSecond, ACE_time - _aceTimeSecond]);
    };
} forEach GVAR(allBullets);

if (GVAR(allBullets) isEqualTo []) then {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
    GVAR(BulletPFH) = nil;
};
