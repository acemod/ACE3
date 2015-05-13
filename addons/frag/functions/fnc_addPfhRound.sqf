#include "script_component.hpp"

private ["_enabled", "_gun", "_type", "_round", "_doFragTrack", "_doSpall", "_spallTrack", "_spallTrackID"];

if (!GVAR(enabled)) exitWith {};

_gun = _this select 0;
_type = _this select 1;
_round = _this select 2;

_enabled = getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(enabled));
if(_enabled < 1) exitWith {};

if(_round in GVAR(blackList)) exitWith {
    GVAR(blackList) = GVAR(blackList) - [_round];
};

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
if(GVAR(spallEnabled)) then {
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

#ifdef DEBUG_MODE_FULL
[ACE_player, _round, [1,0,0,1]] call FUNC(addTrack);
#endif

// We only do the single track object check here.
if(_doFragTrack && alive _round && {!(_round in GVAR(objects))} ) then {
    _spallTrack = [];
    _spallTrackID = [];
    
    private["_args"];
    _args = [_round, (getPosASL _round), (velocity _round), _type, time, _gun, _doSpall, _spallTrack, _spallTrackID,
            (getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(skip))),
            (getNumber (configFile >> "CfgAmmo" >> _type >> "explosive")),
            (getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")),
            (getNumber (configFile >> "CfgAmmo" >> _type >> QGVAR(force))),
            (getNumber(configFile >> "CfgAmmo" >> _type >> "indirecthit")*(sqrt((getNumber (configFile >> "CfgAmmo" >> _type >> "indirectHitRange")))))
        ];
    
    GVAR(objects) pushBack _round;
    GVAR(arguments) pushBack _args;
    
    if(_doSpall) then {
        [_round, 2, _spallTrack, _spallTrackID] call FUNC(spallTrack);
    };
    // ACE_player sideChat "WTF2";
};



