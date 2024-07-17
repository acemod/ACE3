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

            // only let a unit make a frag event once per second
            private _instigator = _shotParents#1;
            if (CBA_missionTime < (_instigator getVariable [QGVAR(nextSpallEvent), -1])) exitWith {};
            _instigator setVariable [QGVAR(nextSpallEvent), CBA_missionTime + 1];
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

if (GVAR(reflectionsEnabled) || GVAR(enabled) && _ammo call FUNC(shouldFrag)) then {
    _projectile addEventHandler [
        "Explode",
        {
            params ["_projectile", "_posASL", "_velocity"];

            if (GVAR(reflectionsEnabled)) then {
                [_posASL, _ammo] call FUNC(doReflections);
            };
            if (_projectile getVariable [QGVAR(blacklisted), false]) exitWith {
                TRACE_2("projectile blackisted",typeOf _projectile,_projectile);
            };

            private _shotParents = getShotParents _projectile;
            private _ammo = typeOf _projectile;

            // only let a unit make a frag event once per second
            private _instigator = _shotParents#1;
            if (CBA_missionTime < (_instigator getVariable [QGVAR(nextFragEvent), -1])) exitWith {};
            _instigator setVariable [QGVAR(nextFragEvent), CBA_missionTime + 1];

            // Wait a frame to make sure it doesn't target the dead
            [
                { [QGVAR(frag_eh), _this] call CBA_fnc_serverEvent; },
                [_posASL, _velocity, _ammo, _shotParents]
            ] call CBA_fnc_execNextFrame;
        }
    ];
};

#ifdef DEBUG_MODE_DRAW
if (GVAR(debugOptions) && {_ammo call FUNC(shouldFrag) || {_ammo call FUNC(shouldSpall)}}) then {
    [_projectile, "red", true] call FUNC(dev_trackObj);
};
#endif
TRACE_1("firedExit",_ammo);
