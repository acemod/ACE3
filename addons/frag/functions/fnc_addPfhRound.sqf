//#define DEBUG_MODE_FULL
#include "script_component.hpp"

if (!GVAR(enabled)) exitWith {};

private ["_enabled", "_doSpall", "_spallTrack", "_spallTrackID"];
params ["_gun", "_type", "_round", ["_doFragTrack", false]];


if(_round in GVAR(blackList)) exitWith {
    GVAR(blackList) = GVAR(blackList) - [_round];
};

// Exit on max track
if((count GVAR(objects)) > GVAR(MaxTrack)) exitWith {};


if (_doFragTrack) then {
    _doFragTrack = if (_gun == ACE_player) then {
        true;
    } else {
        if((gunner _gun) == ACE_player) then {
            true
        } else {
            if(local _gun && {!(isPlayer (gunner _gun))} && {!(isPlayer _gun)}) then {
                true
            } else {
                _doFragTrack
            };
        };
    };
};

_doSpall = false;
if(GVAR(SpallEnabled)) then {
    if(GVAR(spallIsTrackingCount) <= 0) then {
        GVAR(spallHPData) = [];
    };
    if !(GVAR(spallIsTrackingCount) > 5) then {
        _doSpall = true;
        GVAR(spallIsTrackingCount) = GVAR(spallIsTrackingCount) + 1;
    };
};
// ACE_player sideChat format["c: %1", GVAR(spallIsTrackingCount)];

if(GVAR(autoTrace)) then {
    [ACE_player, _round, [1,0,0,1]] call FUNC(addTrack);
};

// We only do the single track object check here.
// We should do an {!(_round in GVAR(objects))}
// But we leave that out here for optimization. So this cannot be a framework function
// Otherwise, it should only be added once and from the FiredEH
if(_doFragTrack && alive _round) then {
    _spallTrack = [];
    _spallTrackID = [];

    private["_args"];
    _args = [_round, (getPosASL _round), (velocity _round), _type, diag_frameno, _gun, _doSpall, _spallTrack, _spallTrackID,
    (getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(skip))),
    (getNumber (configFile >> "CfgAmmo" >> _type >> "explosive")),
    (getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")),
    (getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(force))),
    (getNumber (configFile >> "CfgAmmo" >> _type >> "indirecthit") * (sqrt((getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")))))
    ];
    TRACE_1("Initializing track", _round);
    GVAR(objects) pushBack _round;
    GVAR(arguments) pushBack _args;

    if(_doSpall) then {
        [_round, 1, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
};
