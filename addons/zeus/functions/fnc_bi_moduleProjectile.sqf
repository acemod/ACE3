/*
 * Author: Bohemia Interactive
 * Module function for spawning projectiles
 * Used by Curator artillery modules etc
 * Edited to remove radio warning and add ballistics support
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_bi_moduleProjectile
 *
 * Public: No
 */

#include "script_component.hpp"

_fnc_scriptNameParentTemp = if !(isNil '_fnc_scriptName') then {_fnc_scriptName} else {'BIS_fnc_moduleProjectile'};
private _fnc_scriptNameParent = _fnc_scriptNameParentTemp;
_fnc_scriptNameParentTemp = nil;

private _fnc_scriptName = 'BIS_fnc_moduleProjectile';
scriptname _fnc_scriptName;

params ["_logic", "_units", "_activated"];

if ({local _x} count (objectcurators _logic) > 0) then {
    //--- Reveal the circle to curators
    _logic hideobject false;
    _logic setpos position _logic;
};
if !(isserver) exitWith {};

if (_activated) then {
    _ammo = _logic getVariable ["type",gettext (configFile >> "CfgVehicles" >> typeOf _logic >> "ammo")];
    if (_ammo != "") then {
        _CfgAmmo = configFile >> "CfgAmmo" >> _ammo;
        _dirVar = _fnc_scriptname + typeOf _logic;
        _logic setdir (missionnamespace getVariable [_dirVar,direction _logic]); //--- Restore custom direction
        _pos = getposatl _logic;
        _posAmmo = +_pos;
        _posAmmo set [2,0];
        _dir = direction _logic;
        _simulation = tolower gettext (configFile >> "CfgAmmo" >> _ammo >> "simulation");
        _altitude = 0;
        _velocity = [];
        _attach = false;
        _radio = "";
        _delay = 60;
        _sound = "";
        _soundSourceClass = "";
        _hint = [];
        _shakeStrength = 0;
        _shakeRadius = 0;
        switch (_simulation) do {
            case "shotshell": {
                _altitude = 1000;
                _velocity = [0,0,-100];
                _radio = "SentGenIncoming";
                _sounds = if (getnumber (_cfgAmmo >> "hit") < 200) then {["mortar1","mortar2"]} else {["shell1","shell2","shell3","shell4"]};
                _sound = selectRandom _sounds;
                _hint = ["Curator","PlaceOrdnance"];
                _shakeStrength = 0.01;
                _shakeRadius = 300;
            };
            case "shotsubmunitions": {
                _posAmmo = [_posAmmo,500,_dir + 180] call bis_fnc_relpos;
                _altitude = 1000 - ((getterrainheightasl _posAmmo) - (getterrainheightasl _pos));
                _posAmmo set [2,_altitude];
                _velocity = [sin _dir * 68,cos _dir * 68,-100];
                _radio = "SentGenIncoming";
                _hint = ["Curator","PlaceOrdnance"];
                _shakeStrength = 0.02;
                _shakeRadius = 500;
            };
            case "shotilluminating": {
                _altitude = 66;
                _velocity = [wind select 0,wind select 1,30];
                _sound = "SN_Flare_Fired_4";
                _soundSourceClass = "SoundFlareLoop_F";
            };
            case "shotnvgmarker";
            case "shotsmokex": {
                _altitude = 0;
                _velocity = [0,0,0];
                _attach = true;
            };
            default {["Ammo simulation '%1' is not supported",_simulation] call bis_fnc_error;};
        };
        _fnc_playRadio = {
            if (_radio != "") then {
                _entities = (getposatl _logic) nearentities ["All",100];
                _sides = [];
                {
                    if (isplayer _x) then {
                        _side = side group _x;
                        if (_side in [east,west,resistance,civilian]) then {
                            //--- Play radio (only if it wasn't played recently)
                            if (CBA_missionTime > _x getVariable ["BIS_fnc_moduleProjectile_radio",-_delay]) then {
                                [[_side,_radio,"side"],"bis_fnc_sayMessage",_x] call bis_fnc_mp;
                                _x setVariable ["BIS_fnc_moduleProjectile_radio",CBA_missionTime + _delay];
                            };
                        };
                    };
                } forEach _entities;
            };
        };
        if (count _hint > 0 && {count objectCurators _logic > 0}) then {
            [[_hint,nil,nil,nil,nil,nil,nil,true],"bis_fnc_advHint",objectcurators _logic] call bis_fnc_mp;
        };
        if (count _velocity == 3) then {
            _altitude = (_logic getVariable ["altitude",_altitude]) call bis_fnc_parsenumber;
            _radio = _logic getVariable ["radio",_radio];

            //--- Create projectile
            _posAmmo set [2,_altitude];
            _projectile = createvehicle [_ammo,_posAmmo,[],0,"none"];
            _projectile setpos _posAmmo;
            _projectile setvelocity _velocity;
            if (_attach) then {_projectile attachto [_logic,[0,0,_altitude]];};

           // Added by ace_zeus for ace_frag compatibility
            if (!isNil QEFUNC(frag,addPfhRound)) then {
                [objNull, _ammo, _projectile, true] call EFUNC(frag,addPfhRound);
            };

            //--- Play sound
            if (_sound != "") then {[[_logic,_sound,"say3D"],"bis_fnc_sayMessage"] call bis_fnc_mp;};

            //--- Create sound source
            _soundSource = if (_soundSourceClass != "") then {createSoundSource [_soundSourceClass,_pos,[],0]} else {objnull};

            // Added by ace_zeus to toggle ordnance radio message
            if (GVAR(radioOrdnance)) then {
                //--- Play radio warning
                [] call _fnc_playRadio;
            };

            //--- Update
            if (_attach) then {
                waitUntil {
                    _soundSource setposatl getposatl _projectile;
                    sleep 1;
                    isnull _projectile || isnull _logic
                };
            } else {
                waitUntil {
                    _soundSource setposatl getposatl _projectile;

                    if (getposatl _logic distance _pos > 0 || direction _logic != _dir) then {
                        _posNew = getposasl _logic;
                        _dirDiff = direction _logic - _dir;
                        _posNew = [_posNew,[getposasl _projectile,_pos] call bis_fnc_distance2d,direction _logic + 180] call bis_fnc_relpos;
                        _posNew set [2,getposasl _projectile select 2];
                        _projectile setvelocity ([velocity _projectile,-_dirDiff] call bis_fnc_rotatevector2d);
                        _projectile setposasl _posNew;
                        _pos = getposatl _logic;
                        _dir = direction _logic;
                        missionnamespace setVariable [_dirVar,_dir];
                    };
                    sleep 0.1;
                    isnull _projectile || isnull _logic
                };
            };
            deletevehicle _projectile;
            deletevehicle _soundSource;
            if (count objectcurators _logic > 0) then {

                //--- Delete curator spawned logic
                if (_shakeStrength > 0) then {
                    if (_simulation == "shotsubmunitions") then {sleep 0.5;};
                    [[_shakeStrength,0.7,[position _logic,_shakeRadius]],"bis_fnc_shakeCuratorCamera"] call bis_fnc_mp;
                };
                deletevehicle _logic;
            } else {

                //--- Repeat to achieve permanent effect
                _repeat = _logic getVariable ["repeat",0] > 0;
                if (_repeat) then {
                    [_logic,_units,_activated] call bis_fnc_moduleprojectile;
                } else {
                    deletevehicle _logic;
                };
            };
        } else {
            deletevehicle _logic;
        };
    } else {
        ["Cannot create projectile, 'ammo' config attribute is missing in %1",typeOf _logic] call bis_fnc_error;
    };
};
