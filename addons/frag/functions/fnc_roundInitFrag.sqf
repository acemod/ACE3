#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * Adds fragmentation event handlers to projectiles as needed.
 * Seperated from fired function for use with submunitions.
 *
 * Arguments:
 * 0: class name of projectile being initialized <STRING>
 * 1: Projectile being initialized <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * ["ACE_20mm_HE", _projectile_ACE20mmHE] call ace_frag_fnc_roundInitFrag;
 *
 * Public: No
 */
params ["_ammo", "_projectile"];

_ammo call FUNC(shouldFrag) params ["_shouldFrag", "_submunitionShouldFrag"];
if (_shouldFrag) then {
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
            // Wait a frame to make sure it doesn't target soon to be dead objects
            [
                { [QGVAR(explosionEvent), _this] call CBA_fnc_serverEvent; },
                [_posASL, _velocity, _ammo, _shotParents]
            ] call CBA_fnc_execNextFrame;
        }
    ];
};

if (_submunitionShouldFrag) then {
    _projectile addEventHandler [
        "SubmunitionCreated",
        {
            params ["", "_submunitionProjectile"];
            [typeOf _submunitionProjectile, _submunitionProjectile] call FUNC(roundInitFrag);
        }
    ];
};