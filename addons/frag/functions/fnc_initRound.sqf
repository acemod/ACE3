#include "..\script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function adds rounds using their config init EH

 * Arguments:
 * 0: _projectile <OBJECT> - The object created
 *
 * Return Value:
 * None
 *
 * Example:
 * [_proj] call ace_frag_fnc_initRound;
 *
 * Public: No
 */
 TRACE_1("ACE_Frag rndInit",_this);
params [
    ["_projectile", objNull, [objNull]]
];


private _ammo = typeOf _projectile;
if (_ammo isEqualTo "" || {isNull _projectile}) exitWith {
    TRACE_2("bad ammo or projectile",_ammo,_projectile);
};

private _shouldFrag = _ammo call FUNC(shouldFrag);
if (_shouldFrag && GVAR(enabled)) then {
    _projectile addEventHandler [
        "Explode",
        {
            params ["_proj", "_posASL"];
            private _shotParents = getShotParents _proj;
            private _ammo = typeOf _proj;
            // wait for frag damage to kill units before spawning fragments
            [
                FUNC(doFrag),
                _this + [_ammo, _shotParents]
            ] call CBA_fnc_execNextFrame;
            if (GVAR(reflectionsEnabled)) then {
                [_posASL, _ammo] call FUNC(doReflections);
            };
        }
    ];
};


private _shouldSpall = _ammo call FUNC(shouldSpall);
if (GVAR(spallEnabled) && {_shouldSpall}) then
{
    _projectile addEventHandler [
        "HitPart",
        {
            params ["_proj", "_hitObj", "",
                "_posASL", "_vel", "_sNorm", "",
                "", "_surfType"
            ];
            private _shotPrnt = getShotParents _proj;
            private _ammo = typeOf _proj;
            private _vUp = vectorUp _proj;
            /*
             * Wait a round to see what happens to the round, may result in
             * multiple hits / slowdowns getting shunted to the first hit
             */
            [
                FUNC(doSpall),
                [_proj, _hitObj, _posASL, _vel, _sNorm, _surfType, _ammo, _shotPrnt, _vUp]
            ] call CBA_fnc_execNextFrame;
        }
    ];
};
#ifdef DEBUG_MODE_DRAW
if (GVAR(debugOptions) && (_shouldFrag || _shouldSpall)) then {
    [_projectile, "red", true] call FUNC(dev_trackObj);
};
#endif
TRACE_2("initExit",_shouldFrag,_shouldSpall);