#include "script_component.hpp"

private ["_li"];
PARAMS_1(_obj);

if(hasInterface) then {
    _li = "#lightpoint" createVehicleLocal [0,0,100000];
    _li setLightBrightness 0.35;
    _li setLightAmbient[0.8, 0.6, 0.2];
    _li setLightColor[1, 0.5, 0.2];
    _li lightAttachObject [_obj, [0,0,0]];
};

[{
    private["_factor", "_nearObjects", "_isBurning", "_flameSize", "_dir"];
    
    PARAMS_2(_params,_handle);
    EXPLODE_3_PVT(_params,_obj,_startTime,_light);
    
    _factor = 1+((time-_startTime)/2) min 2;
    
    if(alive _obj) then {
        /* @TODO: BURN PEOPLE 
        _nearObjects = (getPos _obj) nearEntities ["CAManBase", 2.4+_factor];
        //_nearObjects = nearestObjects [(getPos _obj), ["CAManBase"], 2.4+_factor];
        {
            if(local _x) then {
                _isBurning = _x getVariable ["ace_is_burning", false];
                if(!_isBurning) then {
                    /* DAFUQ WAS THIS SHIT?!?!?!?!
                    ["ace_sys_wounds_checkburn", [_x, 30]] call ACE_fnc_receiverOnlyEvent;
                    [_x] spawn {
                        sleep 5+(random 8);
                        (_this select 0) setDamage 1;
                    };
                };
            };
        } forEach _nearObjects;
        */
        
        if(hasInterface) then {
            _light setLightBrightness 0.35*(_factor/5);
            if((typeOf _obj) == "ace_flameout_1") then {
                drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                    "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                    [-0.1 + random 0.2, -0.1 + random 0.2, 0],
                    [0,0,15*(_factor/2)], 
                    0, 10, 7.9, 0.075, 
                    [1.25*_factor, 2.5*_factor], 
                    [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                    [2 + random 1], 1, 0, "", "", _obj];
            };
            _flameSize = 2;
            _factor = _factor / 2;
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [0,20*(_factor/2),0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [0,-20*(_factor/2),0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [20*(_factor/2),0,0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [-20*(_factor/2),0,0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            
            _dir = 20*(_factor/2);
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [_dir,_dir,0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            _dir = -20*(_factor/2);
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [_dir,_dir,0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            _dir = 20*(_factor/2);
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [_dir,-(_dir),0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
            _dir = 20*(_factor/2);
            drop [["\a3\data_f\ParticleEffects\Universal\Universal",16,2,32],
                "", "Billboard", 1,(0.1 + (random 0.2))*_factor, 
                [-0.1 + random 0.2, -0.1 + random 0.2, -1],
                [-(_dir),_dir,0], 
                0, 10, 7.9, 0.075, 
                [1.25*_factor, _flameSize*_factor], 
                [[1, 1, 1, -2],[1, 1, 1, -2], [1, 1, 1, -1], [1, 1, 1, -0]], 
                [2 + random 1], 1, 0, "", "", _obj];
        };
    } else {
        [_handle] call cba_fnc_removePerFrameHandler;
        if(hasInterface) then {
            deleteVehicle _light;
        };
    };
}, 0, [_obj, time, _li]] call cba_fnc_addPerFrameHandler;