#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds projectile explode and hitPart event handlers and is
 * intended to be called from an projectile config init event handler.
 *
 * Arguments:
 * 0: The projectile to be initialized <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_projectile] call ace_frag_fnc_initRound;
 *
 * Public: No
 */

TRACE_1("ACE_Frag rndInit",_this);
if (!isServer) exitWith {};
params ["_projectile"];

private _ammo = typeOf _projectile;
if (_ammo isEqualTo "" || {isNull _projectile}) exitWith {
    TRACE_2("bad ammo or projectile",_ammo,_projectile);
};

if (GVAR(enabled) && {_ammo call FUNC(shouldFrag)}) then {
    _projectile addEventHandler [
        "Explode",
        {
            params ["_projectile", "_posASL", "_velocity"];
            private _shotParents = _projectile getVariable [QGVAR(shotParent), getShotParents _projectile];
            private _ammo = typeOf _projectile;
            // wait for frag damage to kill units before spawning fragments
            [
                FUNC(doFrag),
                [_posASL, _velocity, _ammo, _shotParents]
            ] call CBA_fnc_execNextFrame;
            if (GVAR(reflectionsEnabled)) then {
                [_posASL, _ammo] call FUNC(doReflections);
            };
        }
    ];
};

if (GVAR(spallEnabled) && {_ammo call FUNC(shouldSpall)}) then {
    _projectile addEventHandler [
        "HitPart",
        {
            params ["_projectile", "_hitObject", "", "_posASL", "_velocity", "_surfNorm", "", "", "_surfType"];
            private _shotParent = getShotParents _projectile;
            private _ammo = typeOf _projectile;
            private _vectorUp = vectorUp _projectile;
            /*
             * Wait a frame to see what happens to the round, may result in
             * multiple hits / slowdowns getting shunted to the first hit
             */
            [
                FUNC(doSpall),
                [_projectile, _hitObject, _posASL, _velocity, _surfNorm, _surfType, _ammo, _shotParent, _vectorUp]
            ] call CBA_fnc_execNextFrame;
        }
    ];
};
#ifdef DEBUG_MODE_DRAW
if (GVAR(debugOptions) && {_ammo call FUNC(shouldFrag) || {_ammo call FUNC(shouldSpall)}}) then {
    [_projectile, "red", true] call FUNC(dev_trackObj);
};
#endif
TRACE_1("initExit",_ammo);
