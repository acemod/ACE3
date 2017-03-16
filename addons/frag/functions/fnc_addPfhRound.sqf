//#define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_gun", "_type", "_round", ["_doFragTrack", false]];

if (!GVAR(enabled)) exitWith {};

//_enabled = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(enabled));
//if (_enabled < 1) exitWith {};

if (_round in GVAR(blackList)) exitWith {
    REM(GVAR(blackList),_round);
};

// Exit on max track
if ((count GVAR(objects)) > GVAR(maxTrack)) exitWith {};

if (
    _gun == ACE_player ||
    {(gunner _gun) == ACE_player} ||
    {local _gun && {!(isPlayer (gunner _gun))} && {!(isPlayer _gun)}}
) then {
    _doFragTrack = true;
};

private _doSpall = false;
if (GVAR(SpallEnabled)) then {
    if (GVAR(spallIsTrackingCount) <= 0) then {
        GVAR(spallHPData) = [];
    };
    if (GVAR(spallIsTrackingCount) > 5) then {
        // ACE_player sideChat "LIMT!";
    } else {
        _doSpall = true;
        INC(GVAR(spallIsTrackingCount));
    };
};
// ACE_player sideChat format ["c: %1", GVAR(spallIsTrackingCount)];

if (GVAR(autoTrace)) then {
    [ACE_player, _round, [1, 0, 0, 1]] call FUNC(addTrack);
};

// We only do the single track object check here.
// We should do an {!(_round in GVAR(objects))}
// But we leave that out here for optimization. So this cannot be a framework function
// Otherwise, it should only be added once and from the FiredEH
if (_doFragTrack && {alive _round}) then {
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
    // ACE_player sideChat "WTF2";
};
