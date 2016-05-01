#include "script_component.hpp"

ADDON = false;

TEST_TARGET_LINE_PFH = -1;

DFUNC(deploy) = {
    private ["_dlauncher"];
    if ("ACE_M47_Dragon" in (weapons ACE_player)) then {
        ACE_player removeWeapon "ACE_M47_Dragon";
        
        _dlauncher = "ACE_M47_Dragon_Static" createVehicle  position ACE_player;
        
        //_dlauncher setDir (getDir ACE_player + 180);
        //_dlauncher setPosASL (getPosASL ACE_player vectorAdd (vectorDir ACE_player));
        
        [ACE_player, _dlauncher] call ace_dragging_fnc_startCarry;
    };
};

DFUNC(pickup) = {
    private ["_dlauncher","_unit"];
    _dlauncher = _this select 0;
    _unit = _this select 1;
    if (_dlauncher getVariable ["dragonfired", false]) then {
        hint "Dragon expended.";    
    }else{
    
        _unit addWeapon "ACE_M47_Dragon";
        if ("ACE_M47_Dragon" in (weapons _unit)) then {
            deleteVehicle _dlauncher;
        };
    };    
};

DFUNC(getIn) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == ACE_player) then {
        if ("ACE_M47_Daysight" in (weapons ACE_player)) then {
			GVAR(dragonLauncher) = _this select 0;
			GVAR(dragonLauncher) animate ["optic_hide", 0];
			GVAR(dragonLauncher) animate ["rest_rotate", 0];
			if(isNil {GVAR(dragonLauncher) getVariable 'dragonfired'}) then {
				GVAR(dragonLauncher) removeWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) addMagazine "ace_m47_dragon";
				GVAR(dragonLauncher) addWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) selectWeapon "ACE_M47_Dragon_static";
				reload GVAR(dragonLauncher);           
			};
		} else {
            GVAR(dragonLauncher) removeWeapon "ACE_M47_Dragon_static";
			ACE_player leaveVehicle (_this select 0);
			ACE_player action ["getout",(_this select 0)];
			unassignVehicle ACE_player;
		};
	};
};

DFUNC(getOut) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == ACE_player) then {
        GVAR(dragonLauncher) removeMagazines "ace_m47_dragon";
        GVAR(dragonLauncher) removeWeapon "ACE_M47_Dragon_static";
		GVAR(dragonLauncher) animate ["optic_hide", 1];
		GVAR(dragonLauncher) animate ["rest_rotate", -0.35];
		GVAR(dragonLauncher) = nil;

	};
};

DFUNC(onFired) = {
	GVAR(dragonLauncher) animate ["missile_hide", 1];
    _this call FUNC(guidance);
    GVAR(dragonLauncher) setVariable ["dragonfired", true, true];
};

#define DRAGON_VELOCITY	100
#define SERVICE_INTERVAL	0.33
#define DRAGON_SERVICE_COUNT	60
#define DRAGON_TRIM 1.5
#define TRACKINTERVAL 0.025

#define CM  20
#define CHARGE_VEL 6.5 

DFUNC(guidance) = {

    if ((_this select 0) == ACE_player || {(gunner (_this select 0)) == ACE_player}) then {
        if ((typeOf (_this select 6)) == "ace_missile_dragon") then {
            _missile = (_this select 6);
            _vel = velocity _missile;
            _ppos = getPosASL _missile;
            _vec = vectorDir _missile;
            _vecUp = vectorUp _missile;
            deleteVehicle _missile;
            _unitVec = vectorNormalized _vel;
            
            _shell = "ace_missile_dragon" createVehicle [0,0,10000];
            _this set[6, _shell];
            _shell setPosASL (_ppos vectorAdd (_unitVec vectorMultiply 0.5));
            
            _newVel = _vec vectorMultiply (DRAGON_VELOCITY*1);
            _shell setVectorDirAndUp [_vec, _vecUp];
            _shell setVelocity _newVel;
            
            _gunner = _this select 0;
            
            
            _fnc = {
                if(accTime == 0) exitWith {};
                _params = _this select 0;
                _missile = _params select 0;
                _launcher = _params select 1;
                _serviceTime = _params select 2;
                _serviceCount = _params select 3;
                _pos1 = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "konec rakety"));
                _pos2 = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "spice rakety"));
                _oPos = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "look"));
                
                _launcherVec = _launcher weaponDirection (currentWeapon _launcher);//_pos1 vectorFromTo _pos2;

                if(alive _missile && _serviceCount > 0) then { 

                    
                    _mPos = getPosASL _missile;
                    if(_mPos vectorDistance _pos1 > 1500) exitWith { [(_this select 1)] call cba_fnc_removePerFrameHandler; };
                    
                    _missileVec = vectorDir _missile;
                    if(_serviceTime <= time) then {

                        _params set[2, time+SERVICE_INTERVAL];
                        
                        _centerDistance = (_mPos vectorDistance _oPos);
                        _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                        _vectorToCenter = _mPos vectorFromTo _centerLinePos;

                        
                        _vectorToPos = (_mPos vectorAdd (_launcherVec vectorMultiply (DRAGON_VELOCITY*SERVICE_INTERVAL))) vectorAdd (_vectorToCenter vectorMultiply CM);
                        
                        _vectorTo = _mPos vectorFromTo _vectorToPos;
                        
                        if((_vectorTo select 2) <= 0) then {
                            _vectorTo set[2, 0];
                        };
                        _velocity = (velocity _missile) vectorAdd (_vectorTo vectorMultiply CHARGE_VEL);
                        

                        _missile setVelocity _velocity;
                        _missile setVectorDir (vectorNormalized _velocity);
                        
                        "ace_m47_dragon_serviceCharge" createVehicle ((ASLtoATL _mPos) vectorAdd ((_vectorToCenter vectorMultiply -1) vectorMultiply 0.025));
                        _serviceCount = _serviceCount - 1;
                        
                    } else {
                        if(_serviceTime - time < SERVICE_INTERVAL/2) then {
                            
                            _centerDistance = (_mPos vectorDistance _oPos);
                            
                            _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                            if(_mPos vectorDistance _centerLinePos > 1) then {

                                _params set[2, time+SERVICE_INTERVAL];
                                
                                _centerDistance = (_mPos vectorDistance _oPos);
                                _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                                _vectorToCenter = _mPos vectorFromTo _centerLinePos;

                                
                                _vectorToPos = (_mPos vectorAdd (_launcherVec vectorMultiply (DRAGON_VELOCITY*SERVICE_INTERVAL))) vectorAdd (_vectorToCenter vectorMultiply CM);
                                
                                _vectorTo = _mPos vectorFromTo _vectorToPos;
                                
                                if((_vectorTo select 2) <= 0) then {

                                    _vectorTo set[2, 0];
                                };
                                _velocity = (velocity _missile) vectorAdd (_vectorTo vectorMultiply CHARGE_VEL);
                                

                                
                                _missile setVelocity _velocity;
                                _missile setVectorDir (vectorNormalized _velocity);
                                
                                "ace_m47_dragon_serviceCharge" createVehicle ((ASLtoATL _mPos) vectorAdd ((_vectorToCenter vectorMultiply -1) vectorMultiply 0.025));
                                _serviceCount = _serviceCount - 1;
                            };
                        };
                    };
                    _params set[3, _serviceCount];
                } else {
                    [(_this select 1)] call cba_fnc_removePerFrameHandler;
                };
            
            };
            [_fnc, 0, [_shell, vehicle _gunner, time+SERVICE_INTERVAL, 60]] call cba_fnc_addPerFrameHandler;
        };
    };
};


ADDON = true;