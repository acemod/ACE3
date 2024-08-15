#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Adds a "HitPart" eventhandler if it will produce spall and the spall system is enabled, and calls the
 * roundFragInit function if frag or explosion reflections are enabled.
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
    private _hitPartEventHandler = _projectile addEventHandler [
        "HitPart",
        {
            params ["_projectile", "_hitObject", "", "_posASL", "_velocity"];

            // starting v2.18 it may be faster to use the instigator EH parameter, the same as the second entry shotParents, to recreate _shotParent
            // The "explode" EH does not get the same parameter
            private _shotParents = getShotParents _projectile;
            private _ammo = typeOf _projectile;

            /*
             * Wait a frame to see what happens to the round, may result in
             * multiple hits / slowdowns getting shunted to the first hit
             */
            [
                // only let a unit make a frag event once per ACE_FRAG_SPALL_UNIT_HOLDOFF
                {
                    private _shotParents = _this#5;
                    if (CBA_missionTime < _shotParents#1 getVariable [QGVAR(nextSpallEvent), -1]) exitWith {};
                    _this call FUNC(doSpall);
                },
                [_hitObject, _ammo, _projectile, _posASL, _velocity, [objNull, _shotParents#1]]
            ] call CBA_fnc_execNextFrame;
        }
    ];
    _projectile setVariable [QGVAR(hitPartEventHandler), _hitPartEventHandler];
};
if !(GVAR(reflectionsEnabled) || GVAR(enabled)) exitWith {
    TRACE_1("firedExit No frag/reflections",_ammo);
};

[_ammo, _projectile] call FUNC(roundInitFrag);
TRACE_1("firedExit",_ammo);
