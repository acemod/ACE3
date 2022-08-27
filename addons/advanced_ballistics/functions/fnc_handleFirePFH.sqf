#include "script_component.hpp"
/*
 * Author: Glowbal, Ruthberg, joko // Jonas, Brett Mayson
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

private _deleted = false;
{
    _y params ["_bullet","_caliber","_bulletTraceVisible"];

    if (alive _bullet) then {
        private _bulletVelocity = velocity _bullet;
        private _bulletPosition = getPosASL _bullet;

        if (_bulletTraceVisible && {vectorMagnitude _bulletVelocity > BULLET_TRACE_MIN_VELOCITY}) then {
            drop ["\A3\data_f\ParticleEffects\Universal\Refract","","Billboard",1,0.1,getPos _bullet,[0,0,0],0,1.275,1,0,[0.02*_caliber,0.01*_caliber],[[0,0,0,0.65],[0,0,0,0.2]],[1,0],0,0,"","",""];
        };

        (
            "ace" callExtension ["ballistics:bullet:simulate", [
                _x,
                _bulletVelocity,
                _bulletPosition,
                wind,
                ASLToATL(_bulletPosition) select 2,
                CBA_missionTime toFixed 6
            ]]
        ) params ["_data", "_code"];
        if (_code == 0) then {
            _bullet setVelocity (_bulletVelocity vectorAdd (parseSimpleArray (_data)));
        };
    } else {
        GVAR(allBullets) deleteAt _x;
        "ace" callExtension ["ballistics:bullet:delete", [_x]];
    };
} forEach GVAR(allBullets)
