#include "script_component.hpp"
/*
 * Author: Jaynus, NouberNou
 * Starts tracking a round that will frag.
 * Should only be called once per round.
 *
 * Arguments:
 * 0: Shooter <OBJECT>
 * 1: Ammo classname <STRING>
 * 2: Projectile <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "handGrenade", bullet] call ace_frag_fnc_addPfhRound
 *
 * Public: No
 */

params ["_gun", "_type", "_round"];
TRACE_3("addPfhRound",_gun,_type,_round);

if (!GVAR(enabled)) exitWith {TRACE_1("setting disabled",_this);};

if (!alive _round) exitWith {TRACE_1("round dead?",_this);};

if (_round in GVAR(blackList)) exitWith {
    TRACE_1("round in blackList",_this);
    REM(GVAR(blackList),_round);
};

// Exit on max track
if ((count GVAR(objects)) >= GVAR(maxTrack)) exitWith {TRACE_1("maxTrack limit",count GVAR(objects));};

private _doSpall = false;
if (GVAR(SpallEnabled)) then {
    if (GVAR(spallIsTrackingCount) <= 0) then {
        GVAR(spallHPData) = [];
    };
    if (GVAR(spallIsTrackingCount) > 5) then {
        TRACE_1("At Spall Limit",GVAR(spallIsTrackingCount));
    } else {
        _doSpall = true;
        INC(GVAR(spallIsTrackingCount));
    };
    TRACE_2("",_doSpall,GVAR(spallIsTrackingCount));
};

#ifdef DRAW_FRAG_INFO
[ACE_player, _round, [0, 1, 0, 1]] call FUNC(dev_addTrack);
#endif

// We only do the single track object check here.
// We should do an {!(_round in GVAR(objects))}
// But we leave that out here for optimization. So this cannot be a framework function
// Otherwise, it should only be added once and from the FiredEH
if (alive _round) then {
    private _spallTrack = [];
    private _spallTrackID = [];

    private _args = [
        _round, getPosASL _round, velocity _round, _type, diag_frameno, _gun, _doSpall, _spallTrack, _spallTrackID,
        getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(skip)),
        getNumber (configFile >> "CfgAmmo" >> _type >> "explosive"),
        getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange"),
        getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(force)),
        getNumber (configFile >> "CfgAmmo" >> _type >> "indirecthit") * (sqrt (getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")))
    ];
    TRACE_1("Initializing track", _round);
    GVAR(objects) pushBack _round;
    GVAR(arguments) pushBack _args;

    if (_doSpall) then {
        [_round, 1, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
};
