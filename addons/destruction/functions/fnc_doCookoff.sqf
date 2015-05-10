#define DEBUG_MODE_FULL
#include "script_component.hpp"

if(GVAR(cookOffCount) > 10 || {!GVAR(enableCookoff)}) exitWith {};
PARAMS_2(_vehicle,_intensity);


private["_addCount", "_burnOutSelections", "_isCooking", "_magazines", "_cargoMags", "_startTime", "_totalMagazines", "_transportMagazines", "_magNames", "_counts"];

_isCooking = _vehicle getVariable ["ace_is_cooking", false];
if(_isCooking) exitWith {};
GVAR(cookOffCount) = GVAR(cookOffCount) + 1;
_vehicle setVariable ["ace_is_cooking", true];
_magazines = magazines _vehicle;
_cargoMags = getMagazineCargo _vehicle;
// TODO: Include loaded ammoboxes via sys_cargo

_startTime = 5-(5*((_intensity/4)));
_totalMagazines = [];
if(!alive _vehicle) then {
    _transportMagazines = configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "TransportMagazines";
    _magNames = [];
    _counts = [];
    for "_i" from 0 to (count _transportMagazines)-1 do {
        _mag = _transportMagazines select _i;
        if(isClass _mag) then {
            _magName = getText(_mag >> "magazine");
            _count = getNumber(_mag >> "count");
            if(_magName != "" && {_count > 0}) then {
                _magNames set[(count _magNames), _magName];
                _counts set[(count _counts), _count];
            };
        };
    };
    _cargoMags = [_magNames, _counts];
};
{
    _addCount = ((random ((_cargoMags select 1) select _forEachIndex)) max 0);
    for "_i" from 1 to _addCount do {
        _magazines set[(count _magazines), _x];
    };
} forEach (_cargoMags select 0);
{
    private["_ammoCount", "_initSpeed"];
    _ammoCount = getNumber (configFile >> "CfgMagazines" >> _x >> "count");
    _initSpeed = getNumber (configFile >> "CfgMagazines" >> _x >> "initSpeed");
    _totalMagazines set[(count _totalMagazines), [_x, _ammoCount, _initSpeed]];
} forEach _magazines;

_burnOutSelections = ["osa_poklop_commander", "hatch_commander_axis"];
{
    private["_pos"];
    _pos = _vehicle selectionPosition _x;
    if(_pos distance [0,0,0] != 0) exitWith {
        _vehicle setVariable ["ace_burnout_selection", _x];
    };
} forEach _burnOutSelections;

if((count _totalMagazines) > 0) then {
    [{
        private ["_params", "_cookCount", "_burnoutStartTime"];
        private["_addCount", "_alwaysTop", "_ammo", "_ammoCount", "_bb", "_bullet", "_burnObj", "_burnOutCount", "_burnOutCountCum", "_burnOutSelections", "_burnSelection", "_c", "_caliber", "_cargoMags", "_cookOff", "_count", "_counts", "_crewArray", "_crewPosIndex", "_crewScreaming", "_didBurn", "_filter", "_finalied", "_flameType", "_fuseDistance", "_guy", "_handled", "_i", "_initSpeed", "_isBurning","_isCooking", "_m", "_mag", "_magName", "_magNames", "_maxTypes", "_newMags", "_objs", "_pos", "_randX", "_randY", "_randZ", "_report", "_reportClass", "_reportType", "_rippleCount", "_screamCount", "_simType", "_sound", "_soundidx", "_spacing", "_spawnPos", "_speed", "_time", "_totalMagazines", "_transportMagazines", "_vec", "_velVec", "_vertin"];
        
        _params = _this select 0;
        EXPLODE_5_PVT(_params,_startTime,_magazines,_vehicle,_finale,_finaleDone); 
        
        if(time > _startTime) then {
            _cookCount = 1;
            if(_finale && {!_finaleDone}) then {
                "ace_fuelexpbig" createvehicle (_vehicle modelToWorldVisual [0,0,0]);
                _cookCount = 3+(floor (random 3));
                _vehicle setVariable ["ace_cookoffinalied", true];
                _finale = true;
            };
            for "_i" from 1 to _cookCount do {
                _mag = _magazines select (floor (random (count _magazines)));
                _count = (_mag select 1);
                if(_count > 0) then {
                    _handled = false;
                    _ammo = getText(configFile >> "CfgMagazines" >> (_mag select 0) >> "ammo");
                    _simType = getText(configFile >> "CfgAmmo" >> _ammo >> "simulation");
                    if(toLower(_simType) == "shotbullet") then {
                        _handled = true;
                        _rippleCount = floor(random _count) min 40;
                        if(_finale) then {
                            _rippleCount = floor(random _count) min 10;
                        };
                        _mag set[1, 0];
                        [_vehicle, _ammo, _rippleCount, (_mag select 2)] spawn {
                            _vehicle = _this select 0;
                            _ammo = _this select 1;
                            _count = _this select 2;
                            _speed = _this select 3;
                            _spacing = (random 0.25) max 0.05;
                            _caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
                            _reportType = "small";
                            _maxTypes = 4;
                            if(_caliber > 1.1) then {
                                _reportType = "large";
                                _maxTypes = 3;
                            };
                        
                            _burnSelection = _vehicle getVariable ["ace_burnout_selection", ""];
                            _burnObj = nil;
                            _burnOutCount = _vehicle getVariable ["ace_burnOutCount", 0];
                            _didBurn = false;
                            if(_burnOutCount < 0) then {
                                _vehicle setVariable ["ace_burnOutCount", 0];
                                _burnOutCount = 0;
                            };
                            if ((random 1) > 0.8) then {
                                /*
                                    @TODO: SCreaming
                                _crewScreaming = _vehicle getVariable ["ace_flameout_crewscream", false];
                                if (!_crewScreaming && {({alive _x} count (crew _vehicle)) > 0}) then {
                                    _vehicle setVariable ["ace_flameout_crewscream", true];
                                    [_vehicle] spawn {
                                        _screamCount = floor((random (count (crew (_this select 0)))) min 4) max 1;
                                        _crewArray = (crew (_this select 0));
                                        for "_m" from 1 to _screamCount*2 do {
                                            _soundidx = floor (random 15) + 1;
                                            _sound = "ACE_VDBrutalScream" + (_soundidx call CBA_fnc_intToString);
                                            _crewPosIndex = (floor (random (count _crewArray)));
                                            _guy = _crewArray select _crewPosIndex;
                                            if (_guy in (_this select 0)) then {
                                                [[_crewArray select _crewPosIndex], _sound] call CBA_fnc_globalSay;
                                            };
                                            sleep 0.25+(random 1);
                                        };
                                    };
                                };
                                */
                            };
                            
                            if (_burnSelection != "" && {alive _vehicle} && {_spacing <= 0.18} && {_burnOutCount == 0} && {_count > 3}) then {
                                _alwaysTop = _vehicle getVariable ["ace_flameout_alwaystop", false];
                                _flameType = "ace_flameout_2";
                                if (_alwaysTop || {(random 10) >= 7.5}) then {
                                    _flameType = "ace_flameout_1";
                                    _vehicle setVariable ["ace_flameout_alwaystop", true];
                                };
                                
                                
                                _burnObj = _flameType createVehicle [0,0,10000];
                                _burnObj attachTo [_vehicle, [0,0,-0.2], _burnSelection];
                                _sound = createSoundSource ["ace_flameout", [0,0,10000], [], 0];
                                _sound attachTo [_burnObj, [0,0,-0.2], _burnSelection];
                                _vehicle setVariable ["ace_burnOutCount", 1];
                                _vehicle setVariable ["ace_burnOutStart", diag_tickTime];
                                _burnOutCountCum = _vehicle getVariable ["ace_burnOutCountCum", 0];
                                _vehicle setVariable ["ace_burnOutCountCum", _burnOutCountCum + 1];
                                _vehicle setVariable ["ace_burnObj", [_burnObj, _sound]];
                                [_burnObj] call FUNC(doFlameout);
                                _didBurn = true;
                            } else {
                                if (_burnOutCount > 0) then {
                                    _burnOutCountCum = _vehicle getVariable ["ace_burnOutCountCum", 0];
                                    _vehicle setVariable ["ace_burnOutCountCum", _burnOutCountCum + 1];
                                    _didBurn = true;
                                    _vehicle setVariable ["ace_burnOutCount", _burnOutCount + 1];
                                    _burnOutCountCum = _vehicle getVariable ["ace_burnOutCountCum", 0];
                                    if(_burnOutCountCum > 2) then {
                                        _vehicle setDamage 1;
                                    } else {
                                        _burnoutStartTime = _vehicle getVariable ["ace_burnOutStart", diag_tickTime];
                                        _time = diag_tickTime - _burnoutStartTime;
                                        if(_time > 3.5) then {
                                            _vehicle setDamage 1;
                                        };
                                    };
                                };
                            };
                            for "_i" from 1 to _count do {
                                _spawnPos = _vehicle modelToWorldVisual [(-0.2+(random 0.4)),(-0.2+(random 0.4)),(random 0.2)];//[_randX, _randY, _randZ];
                                if(_spawnPos select 2 < 0) then {
                                    _spawnPos set[2, 0];
                                };
                                _vec = [(-1 + (random 2)), (-1 + (random 2)), -0.2+(random 1)];
                                _filter = "filtered";
                                if(!alive _vehicle) then {
                                    _filter = "normal";
                                };
                                _reportClass = format["ACE_cookoff_%1_%2_%3", _reportType, ceil(random _maxTypes), _filter];
                                _report = _reportClass createVehicleLocal _spawnPos;
                                if(_i == 12) then {
                                    {
                                        if(alive _x) then {
                                            _x setDamage 1;
                                        };
                                    } forEach (crew _vehicle);
                                };
                                if((random 1) > 0.75) then {
                                    _report setPos _spawnPos;
                                    _speed = (((_speed*0.5)+(random (_speed/2))) min _speed);
                                    _velVec = [
                                                (_vec select 0)*_speed,
                                                (_vec select 1)*_speed,
                                                (_vec select 2)*_speed
                                            ];
                                    _bullet = _ammo createVehicleLocal _spawnPos;
                                    _bullet setPos _spawnPos;
                                    _bullet setVectorDir _velVec;
                                    _bullet setVelocity _velVec;
                                    // [ace_sys_frag_fnc_frag_trace, 0.05, [_bullet]] call cba_fnc_addPerFrameHandler;
                                };
                                if(alive _vehicle) then {
                                    _burnoutStartTime = _vehicle getVariable ["ace_burnOutStart", diag_tickTime];
                                    _time = diag_tickTime - _burnoutStartTime;
                                    if(_time > 3.5) then {
                                        _vehicle setDamage 1;
                                    };
                                };
                                _finalied = _vehicle getVariable ["ace_cookoffinalied", false];
                                _burnOutCount = _vehicle getVariable ["ace_burnOutCount", 0];
                                if(_finalied && {_burnOutCount > 0}) then { 
                                    _objs = (_vehicle getVariable "ace_burnObj");
                                    _vehicle setVariable ["ace_burnOutCount", 0];
                                    deleteVehicle (_objs select 1);
                                    deleteVehicle (_objs select 0);
                                };
                                sleep _spacing+(-0.02+(random 0.04));
                            };
                            if(_didBurn) then {
                                _burnOutCount = _vehicle getVariable ["ace_burnOutCount", 0];
                                _burnOutCount = _burnOutCount - 1;
                                if(_burnOutCount <= 0) then {
                                    _objs = (_vehicle getVariable "ace_burnObj");
                                    deleteVehicle (_objs select 1);
                                    deleteVehicle (_objs select 0);
                                    if(alive _vehicle) then {
                                        _burnOutCountCum = _vehicle getVariable ["ace_burnOutCountCum", 0];
                                        if(_burnOutCountCum > 2) then {
                                            _vehicle setDamage 1;
                                        } else {
                                            _burnoutStartTime = _vehicle getVariable ["ace_burnOutStart", diag_tickTime];
                                            _time = diag_tickTime - _burnoutStartTime;
                                            if(_time > 3.5) then {
                                                _vehicle setDamage 1;
                                            };
                                        };
                                    };
                                };
                                _vehicle setVariable ["ace_burnOutCount", _burnOutCount];
                            };
                        };
                    };
                    if(toLower(_simType) == "shotshell" || {toLower(_simType) == "shotgrenade"}) then {
                        _handled = true;
                        _rippleCount = floor(random _count) min 3;
                        _mag set[1, 0];
                        [{
                            PARAMS_1(_params);
                            
                            if(diag_tickTime > (_params select 4)) then {
                                EXPLODE_6_PVT(_params,_vehicle,_ammo,_count,_speed,_nextRunTime,_iter_save);
                            
                                _spacing = (random 0.5) max 0.1;
                                _caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
                                _fuseDistance = getNumber(configFile >> "CfgAmmo" >> _ammo >> "fuseDistance");
                                _reportType = "small";
                                _maxTypes = 4;
                                if(_caliber > 2) then {
                                    _reportType = "large";
                                    _maxTypes = 3;
                                };
                                _bb = boundingBox _vehicle;
          
                                _randX = ((_bb select 0) select 0)+(random (((_bb select 1) select 0)*2));
                                _randY = ((_bb select 0) select 1)+(random (((_bb select 1) select 1)*2));
                                _randZ = ((_bb select 0) select 2)+(random (((_bb select 1) select 2)*2));
                                
                                _spawnPos = _vehicle modelToWorldVisual [0,0,_fuseDistance];//[_randX, _randY, _fuseDistance];
                                if(_spawnPos select 2 < 0) then {
                                    _spawnPos set[2, 0];
                                };
                                _bullet = _ammo createVehicleLocal _spawnPos;
                                _bullet setPos _spawnPos;
                                _bullet setVectorDir [0,0,0];
                                _bullet setVelocity [0,0,-300];
                                
                                _nextRunTime = diag_tickTime + _spacing+(-0.02+(random 0.04));
                                
                                _iter_save = _iter_save + 1;
                                if(_iter_save >= _count) exitWith {
                                    [(_this select 1)] call CBA_fnc_removePerFrameHandler;
                                };
                                
                                _params set[4, _nextRunTime];
                                _params set[5, _iter_save];
                                _this set[0, _params];
                            };
                        }, [_vehicle, _ammo, _rippleCount, (_mag select 2), diag_tickTime, 0], 0] call CBA_fnc_addPerFrameHandler;
                    };
                    if(toLower(_simType) == "shotrocket" || {toLower(_simType) == "shotmissile"}) then {
                        _handled = true;
                        _rippleCount = (floor(random _count) min 6) max 1;
                        _mag set[1, 0];
                        [_vehicle, _ammo, _rippleCount, (_mag select 2)] spawn {
                            _vehicle = _this select 0;
                            _ammo = _this select 1;
                            _count = _this select 2;
                            _speed = _this select 3;
                            _spacing = (random 0.5) max 0.05;
                            _caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
                            _reportType = "small";
                            _maxTypes = 4;
                            if(_caliber > 1.1) then {
                                _reportType = "large";
                                _maxTypes = 3;
                            };
                            _bb = boundingBox _vehicle;
                            for "_i" from 1 to _count do {
                                _randX = ((_bb select 0) select 0)+(random (((_bb select 1) select 0)*2));
                                _randY = ((_bb select 0) select 1)+(random (((_bb select 1) select 1)*2));
                                _randZ = (random (((_bb select 1) select 2)))/2;
                                _spawnPos = _vehicle modelToWorldVisual [_randX, _randY, _randZ];
                                if(_spawnPos select 2 < 0) then {
                                    _spawnPos set[2, 0];
                                };
                                _vec = [(-1 + (random 2)), (-1 + (random 2)), -0.2+(random 0.8)];
                                _vertin = (random 1);
                                if(_vertin < 0.9) then {
                                    _spawnPos = _vehicle modelToWorldVisual [0,0,0];//[_randX, _randY, _randZ];
                                    _vec set[2, -0.999999];
                                };
                                _reportClass = format["ACE_cookoff_%1_%2", _reportType, ceil(random _maxTypes)];
                                _report = _reportClass createVehicleLocal _spawnPos;
                                _report setPos _spawnPos;
                                _speed = ((_speed*0.5)+(random _speed) min _speed)*0.6;
                                _velVec = [
                                            (_vec select 0)*_speed,
                                            (_vec select 1)*_speed,
                                            (_vec select 2)*_speed
                                        ];
                                _bullet = _ammo createVehicleLocal _spawnPos;
                                _bullet setPos _spawnPos;
                                _bullet setVectorDir _velVec;
                                _bullet setVelocity _velVec;
                                // [ace_sys_frag_fnc_frag_trace, 0.05, [_bullet]] call cba_fnc_addPerFrameHandler;
                                
                                sleep _spacing+(-0.02+(random 0.04));
                            };
                        };
                    };
                    if(!_handled) then {
                        _mag set[1, 0];
                    };
                };
                
                _newMags = [];
                {
                    if(_x select 1 != 0) then {
                        _newMags set[(count _newMags), _x];
                    };
                } forEach _magazines;
                _magazines = _newMags;
                _params set[1, _newMags];
            };
            if(_finale && {!_finaleDone}) then {
                _params set[4, true];
                _newMags = [];
                
                _c = floor((count _magazines)/_cookCount);
                for "_i" from 0 to _c do {
                    _newMags set[(count _newMags), (_magazines select _i)];
                };
                _magazines = _newMags;
                _params set[1, _newMags];
            };
            
            _params set[0, time+(random 5)*(random 3)];
        };
        
        _isBurning = _vehicle getVariable ["ace_is_burning", false];
        if(!_finale && {!(alive _vehicle)}) then {
            _params set[3, true];
            _params set[0, time-1];
        } else {
            if(!_isBurning || {(count _magazines) == 0}) then {
                _vehicle setVariable ["ace_is_cooking", false];
                [(_this select 1)] call CBA_fnc_removePerFrameHandler;
                GVAR(cookOffCount) = GVAR(cookOffCount) - 1;
            };
        };
    }, 0.25, [time+_startTime, _totalMagazines, _vehicle, false, false]] call cba_fnc_addPerFrameHandler;
} else {
    GVAR(cookOffCount) = GVAR(cookOffCount) - 1;
};
