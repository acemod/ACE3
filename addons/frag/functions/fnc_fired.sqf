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

if (GVAR(spallEnabled) && {_ammo call FUNC(shouldSpall)}) then {
    private _hitPartEventHandler = _projectile addEventHandler [
        "HitPart",
        {
            params ["_projectile", "_hitObject", "", "_posASL", "_velocity", "_surfNorm", "", "", "_surfType"];

            // starting v2.18 it may be faster to use the instigator parameter, the same as the second entry shotParents, to recreate _shotParent
            // The "explode" EH does not get the same parameter
            private _shotParents = getShotParents _projectile;
            private _ammo = typeOf _projectile;


            /*
             * Wait a frame to see what happens to the round, may result in
             * multiple hits / slowdowns getting shunted to the first hit
             */
            [
                // only let a unit make a frag event once per ACE_FRAG_SPALL_EVENT_HOLDOFF
                {
                    private _shotParents = _this#5;
                    if (CBA_missionTime < _shotParents#1 getVariable [QGVAR(nextSpallEvent), -1]) exitWith {};
                    _this call FUNC(doSpall);
                },
                [_hitObject, _ammo, _projectile, _posASL, _velocity, _shotParents]
            ] call CBA_fnc_execNextFrame;
        }
    ];
    _projectile setVariable [QGVAR(hitPartEventHandler), _hitPartEventHandler];
};

if (GVAR(reflectionsEnabled) || GVAR(enabled) && _ammo call FUNC(shouldFrag)) then {
    private _explodeEventHandler = _projectile addEventHandler [
        "Explode",
        {
            params ["_projectile", "_posASL", "_velocity"];

            if (GVAR(reflectionsEnabled)) then {
                [_posASL, _ammo] call FUNC(doReflections);
            };

            private _shotParents = getShotParents _projectile;
            private _ammo = typeOf _projectile;

            // only let a unit make a frag event once per second
            private _instigator = _shotParents#1;
            if (CBA_missionTime < (_instigator getVariable [QGVAR(nextFragEvent), -1])) exitWith {};
            _instigator setVariable [QGVAR(nextFragEvent), CBA_missionTime + ACE_FRAG_FRAG_EVENT_HOLDOFF];

            // Wait a frame to make sure it doesn't target the dead
            [
                { [QGVAR(frag_eh), _this] call CBA_fnc_serverEvent; },
                [_posASL, _velocity, _ammo, _shotParents]
            ] call CBA_fnc_execNextFrame;
        }
    ];
    _projectile setVariable [QGVAR(explodeEventHandler), _explodeEventHandler];
};

#ifdef DEBUG_MODE_DRAW
if (GVAR(debugOptions) && {_ammo call FUNC(shouldFrag) || {_ammo call FUNC(shouldSpall)}}) then {
    [_projectile, "red", true] call FUNC(dev_trackObj);
};
#endif
TRACE_1("firedExit",_ammo);
