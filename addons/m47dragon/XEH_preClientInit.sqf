#include "script_component.hpp"

ADDON = false;

TEST_TARGET_LINE_PFH = -1;

DFUNC(getIn) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == ACE_player) then {
        if ("ACE_M47_Daysight" in (weapons ACE_player)) then {
			GVAR(dragonLauncher) = _this select 0;
			GVAR(dragonLauncher) animate ["optic_hide", 0];
			GVAR(dragonLauncher) animate ["rest_rotate", 0];
			if(GVAR(dragonLauncher) animationPhase "missile_hide" == 0) then {
				GVAR(dragonLauncher) removeWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) addMagazine "ace_m47_dragon";
				GVAR(dragonLauncher) addWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) selectWeapon "ACE_M47_Dragon_static";
				reload GVAR(dragonLauncher);
                
                TEST_TARGET_LINE_PFH = [{
                    _launcher = (vehicle player);
                    _pos1 = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "konec rakety"));
                    _pos2 = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "spice rakety"));
                    _oPos = ATLtoASL (_launcher modelToWorldVisual (_launcher selectionPosition "look"));
                    _launcherVec = _pos1 vectorFromTo _pos2;
                    _dp1 = _oPos;
                    _dp2 = _oPos vectorAdd (_launcherVec vectorMultiply 800);
                    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _dp2, 0.75, 0.75, 0, "OP", 0.5, 0.025, "TahomaB"];
                    drawLine3D [ASLtoATL _dp1, ASLtoATL _dp2, [1, 0, 0, 1]];
                    _dp1 = _oPos;
                    _dp2 = _oPos vectorAdd ((_launcher weaponDirection (currentWeapon _launcher)) vectorMultiply 800);
                    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,1,1,1], ASLtoATL _dp2, 0.75, 0.75, 0, "WD", 0.5, 0.025, "TahomaB"];
                    drawLine3D [ASLtoATL _dp1, ASLtoATL _dp2, [0, 1, 0, 1]];
                }, 0, []] call cba_fnc_addPerFrameHandler;
                
			};
		} else {
			ACE_player leaveVehicle (_this select 0);
			ACE_player action ["getout",(_this select 0)];
			unassignVehicle ACE_player;
		};
	};
};

DFUNC(getOut) = {
	PARAMS_3(_launcher,_pos,_unit);
	if (_unit == ACE_player) then {
		GVAR(dragonLauncher) animate ["optic_hide", 1];
		GVAR(dragonLauncher) animate ["rest_rotate", -0.35];
		//GVAR(dragonLauncher) removeMagazines "Dragon_EP1";
		GVAR(dragonLauncher) = nil;
        [TEST_TARGET_LINE_PFH] call cba_fnc_removePerFrameHandler;
	};
};

DFUNC(onFired) = {
	// GVAR(dragonLauncher) animate ["missile_hide", 1];
    _this call FUNC(guidance);
};

#define DRAGON_VELOCITY	100
#define SERVICE_INTERVAL	0.3
#define DRAGON_SERVICE_COUNT	60
#define DRAGON_TRIM 1.5
#define TRACKINTERVAL 0.025

#define CM  20
#define CHARGE_VEL 6.5 

DFUNC(guidance) = {
    player sideChat format["t: %1", _this];
    setAccTime 0;
    if ((_this select 0) == ACE_player || {(gunner (_this select 0)) == ACE_player}) then {
        if ((typeOf (_this select 6)) == "ace_missile_dragon") then {
            _missile = (_this select 6);
            _vel = velocity _missile;
            _ppos = getPosASL _missile;
            _vec = vectorDir _missile;
            _vecUp = vectorUp _missile;
            // _missile spawn {
                // waitUntil {
                    // drop ["\a3\data_f\Cl_basic","","Billboard",1,90,(getPos _this),[0,0,0],1,1.275,1.0,0.0,[5],[[0,1,0,1]],[0],0.0,2.0,"","",""];
                    // !alive _this;
                // };
            // };
            deleteVehicle _missile;
            _unitVec = vectorNormalized _vel;
            diag_log text format["VEC: %1", _unitVec];
            _shell = "ace_missile_dragon" createVehicle [0,0,10000];
            _this set[6, _shell];
            _shell setPosASL (_ppos vectorAdd (_unitVec vectorMultiply 0.5));
            
            _newVel = _vec vectorMultiply (DRAGON_VELOCITY*1);
            _shell setVectorDirAndUp [_vec, _vecUp];
            _shell setVelocity _newVel;
            
            _gunner = _this select 0;
            
            diag_log "boossssssssp";
            [] spawn {
                sleep 2;
                GVAR(dragonLauncher) removeWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) addMagazine "ace_m47_dragon";
				GVAR(dragonLauncher) addWeapon "ACE_M47_Dragon_static";
				GVAR(dragonLauncher) selectWeapon "ACE_M47_Dragon_static";
            };
            
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
                
                _launcherVec = _pos1 vectorFromTo _pos2;
                // if(_serviceTime <= time) then {
                    // hintSilent format["%1", vectorMagnitude (velocity _missile)];
                    // [(_this select 1)] call cba_fnc_removePerFrameHandler;
                // };
                if(alive _missile && _serviceCount > 0) then { 
                    hintSilent format["%1", vectorMagnitude (velocity _missile)];
                    
                    _mPos = getPosASL _missile;
                    if(_mPos vectorDistance _pos1 > 1500) exitWith { [(_this select 1)] call cba_fnc_removePerFrameHandler; };
                    
                    _missileVec = vectorDir _missile;
                    if(_serviceTime <= time) then {
                        // diag_log text "pop";
                        _params set[2, time+SERVICE_INTERVAL];
                        
                        _centerDistance = (_mPos vectorDistance _oPos);
                        _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                        _vectorToCenter = _mPos vectorFromTo _centerLinePos;
                        
                        // TEST_PAIRS pushBack [_oPos, _centerLinePos, [0,1,1,1]];
                        
                        // TEST_PAIRS pushBack [_mPos, _centerLinePos, [1,0,0,1]];
                        
                        _vectorToPos = (_mPos vectorAdd (_launcherVec vectorMultiply (DRAGON_VELOCITY*SERVICE_INTERVAL))) vectorAdd (_vectorToCenter vectorMultiply CM);
                        
                        _vectorTo = _mPos vectorFromTo _vectorToPos;
                        
                        if((_vectorTo select 2) <= 0) then {
                            player sideChat "PLIP";
                            _vectorTo set[2, 0];
                        };
                        _velocity = (velocity _missile) vectorAdd (_vectorTo vectorMultiply CHARGE_VEL);
                        
                        // TEST_PAIRS pushBack [_mPos, _mPos vectorAdd _velocity, [0,1,0,1]];
                        
                        _missile setVelocity _velocity;
                        
                        "ace_m47_dragon_serviceCharge" createVehicle (ASLtoATL _mPos);
                        _serviceCount = _serviceCount - 1;
                        
                    } else {
                        if(_serviceTime - time < SERVICE_INTERVAL/2) then {
                            
                            _centerDistance = (_mPos vectorDistance _oPos);
                            
                            _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                            if(_mPos vectorDistance _centerLinePos > 1) then {
                                diag_log text "pop!!!!!!!!!";
                                _params set[2, time+SERVICE_INTERVAL];
                                
                                _centerDistance = (_mPos vectorDistance _oPos);
                                _centerLinePos = _oPos vectorAdd (_launcherVec vectorMultiply _centerDistance);
                                _vectorToCenter = _mPos vectorFromTo _centerLinePos;
                                
                                // TEST_PAIRS pushBack [_oPos, _centerLinePos, [0,1,1,1]];
                                
                                // TEST_PAIRS pushBack [_mPos, _centerLinePos, [1,0,0,1]];
                                
                                _vectorToPos = (_mPos vectorAdd (_launcherVec vectorMultiply (DRAGON_VELOCITY*SERVICE_INTERVAL))) vectorAdd (_vectorToCenter vectorMultiply CM);
                                
                                _vectorTo = _mPos vectorFromTo _vectorToPos;
                                
                                if((_vectorTo select 2) <= 0) then {
                                    player sideChat "PLIP";
                                    _vectorTo set[2, 0];
                                };
                                _velocity = (velocity _missile) vectorAdd (_vectorTo vectorMultiply CHARGE_VEL);
                                
                                // TEST_PAIRS pushBack [_mPos, _mPos vectorAdd _velocity, [0,1,0,1]];
                                
                                _missile setVelocity _velocity;
                                
                                "ace_m47_dragon_serviceCharge" createVehicle (ASLtoATL _mPos);
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