#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Add eventhandlers to rounds as needed
 *
 * Arguments:
 * Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * Nothing Useful
 *
 * Example:
 * [clientFiredBIS-XEH] call ace_frag_fnc_fired
 *
 * Public: No
 */

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile,_vehicle,_gunner,_turret);

if (_ammo isEqualTo "" || {isNull _projectile} ||
    {_projectile getVariable [QGVAR(blacklisted), false]}) exitWith {
    TRACE_2("bad ammo or projectile, or blackList",_ammo,_projectile);
};


#ifdef DEBUG_MODE_DRAW
if (GVAR(debugOptions) && {true in (_ammo call FUNC(shouldFrag)) || {_ammo call FUNC(shouldSpall)}}) then {
    [_projectile, "red", true] call FUNC(dev_trackObj);
};
#endif

if (GVAR(spallEnabled) && {_ammo call FUNC(shouldSpall)}) then {
    _projectile addEventHandler [
        "HitPart",
        {
            params ["_projectile", "_hitObject", "", "_posASL", "_velocity", "_surfNorm", "", "", "_surfType"];

            if (_projectile getVariable [QGVAR(blacklisted), false]) exitWith {
                TRACE_2("projectile blackisted",typeOf _projectile,_projectile);
            };

            // starting v2.18 it may be faster to use the instigator parameter, the same as the second entry shotParents, to recreate _shotParent
            // The "explode" EH does not get the same parameter
            private _shotParent = getShotParents _projectile;
            private _ammo = typeOf _projectile;
            private _vectorUp = vectorUp _projectile;
            /*
             * Wait a frame to see what happens to the round, may result in
             * multiple hits / slowdowns getting shunted to the first hit
             */
            [
                FUNC(doSpallLocal),
                [_projectile, _hitObject, _posASL, _velocity, _surfNorm, _surfType, _ammo, _shotParent, _vectorUp]
            ] call CBA_fnc_execNextFrame;
        }
    ];
};
if !(GVAR(reflectionsEnabled) || GVAR(enabled)) exitWith {
    TRACE_1("firedExit No frag/reflections",_ammo);
};

[_ammo, _projectile] call FUNC(roundInitFrag);

TRACE_1("firedExit",_ammo);
