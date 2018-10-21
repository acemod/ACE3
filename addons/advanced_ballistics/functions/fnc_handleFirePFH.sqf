#include "script_component.hpp"
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
 * Example:
 * [] call ace_advanced_ballistics_fnc_handleFirePFH
 *
 * Public: No
 */

{
    _x params ["_bullet","_caliber","_bulletTraceVisible","_index"];

    if (!alive _bullet) then {
        GVAR(allBullets) deleteAt (GVAR(allBullets) find _x);
    } else {
        private _bulletVelocity = velocity _bullet;
        private _bulletPosition = getPosASL _bullet;

        if (_bulletTraceVisible && {vectorMagnitude _bulletVelocity > BULLET_TRACE_MIN_VELOCITY}) then {
            drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.02*_caliber,0.01*_caliber],[[0,0,0,0.65],[0,0,0,0.2]],[1,0],0,0,"","",""];
        };

        _bullet setVelocity (_bulletVelocity vectorAdd (parseSimpleArray ("ace_advanced_ballistics" callExtension format["simulate:%1:%2:%3:%4:%5:%6", _index, _bulletVelocity, _bulletPosition, wind, ASLToATL(_bulletPosition) select 2, CBA_missionTime toFixed 6])));
    };
    nil
} count +GVAR(allBullets);

if (GVAR(allBullets) isEqualTo []) then {
    [_this select 1] call CBA_fnc_removePerFrameHandler;
    GVAR(BulletPFH) = nil;
};
