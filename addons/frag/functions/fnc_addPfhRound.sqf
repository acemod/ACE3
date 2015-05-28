//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private ["_enabled","_doFragTrack", "_doSpall", "_spallTrack", "_spallTrackID"];
PARAMS_3(_gun,_type,_round);

if (!GVAR(enabled)) exitWith {};

//_enabled = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(enabled));
//if(_enabled < 1) exitWith {};

if(_round in GVAR(blackList)) exitWith {
    GVAR(blackList) = GVAR(blackList) - [_round];
};

// Exit on max track
if( (count GVAR(objects)) > GVAR(MaxTrack)) exitWith { };

_doFragTrack = false;
if(_gun == ACE_player) then {
    _doFragTrack = true;
} else {
    if((gunner _gun) == ACE_player) then {
        _doFragTrack = true;
    } else {
        if(local _gun && {!(isPlayer (gunner _gun))} && {!(isPlayer _gun)}) then {
            _doFragTrack = true;
        };
    };
};
if(GVAR(SpallEnabled)) then {
    if(GVAR(spallIsTrackingCount) <= 0) then {
        GVAR(spallHPData) = [];
    };
    if(GVAR(spallIsTrackingCount) > 5) then {
        // ACE_player sideChat "LIMT!";
        _doSpall = false;
    } else {
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
            (getNumber(configFile >> "CfgAmmo" >> _type >> "indirecthit")*(sqrt((getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")))))
        ];
    TRACE_1("Initializing track", _round);
    GVAR(objects) pushBack _round;
    GVAR(arguments) pushBack _args;
    
    if(_doSpall) then {
        [_round, 1, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
    // ACE_player sideChat "WTF2";
};



