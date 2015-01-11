//#include "\x\addons\balca\defs.hpp"

private ["_pos", "_role", "_block_input","_veh","_turret","_use_sim",
"_mag","_shell","_displayName","_typicalSpeed","_friction","_timeToLive","_initSpeed","_minElev","_maxElev","_currentWeaponMode",//ammo info
"_scale","_gravity",//const
"_tpos","_cpos","_ppos","_ndist","_ndir","_altitude_impact",//target info
"_i","_step","_simstep","_adjust","_celev","_table","_tab","_calculating",//variables for calculating
"_low_solution","_flytime_low","_high_solution","_flytime_high","_balca_target"];//result

_ownPos = _this select 0;
_targetPos = _this select 1;
_vehicle = _this select 2;
_weapon = _this select 3;
_magazine = _this select 4;
_charge = _this select 5;

//_starttime = time;
_scale = 100; //scale of moving markers on balca display (meters)
_veh = vehicle player;
//_pos = _this select 0;
_pos = _targetPos;
_use_sim = true;
_tpos = _pos;
_gravity = 9.80665;
//_ppos = [((positioncameratoworld [0,0,0]) select 0),((positioncameratoworld [0,0,0]) select 1),((getposASL _veh) select 2)-((getposATL _veh) select 2)+((positioncameratoworld [0,0,0]) select 2)];
_ppos = _ownPos;

//getting ammo cfg
//_weap = currentWeapon _veh;
_weap = _weapon;
//_mag = currentMagazine _veh;
_mag = _magazine;
_displayName = getText (configFile >> "CfgMagazines" >> _mag >> "displayName");
_initSpeed = getnumber(configFile >> "cfgMagazines" >> _mag >> "initSpeed");
//if (GET_IS_OA) then {
	_currentWeaponMode = _charge;
	_artilleryCharge = getnumber(configFile >> "cfgWeapons" >> _weap >> _currentWeaponMode >> "artilleryCharge");
	if (_artilleryCharge > 0) then {_initSpeed = _initSpeed*_artilleryCharge};
	//hint format ["Get solution %1",[_currentWeaponMode,_mag]];
//};
//hint format ["%1",[_weap,_currentWeaponMode,_initSpeed,_artilleryCharge]];
_shell = gettext(configFile >> "cfgMagazines" >> _mag >> "ammo");
_typicalSpeed = getnumber(configFile >> "cfgAmmo" >> _shell >> "typicalSpeed");
//_thrustTime = getnumber(configFile >> "cfgAmmo" >> _shell >> "thrustTime");
_thrust = getnumber(configFile >> "cfgAmmo" >> _shell >> "thrust");
//_maxSpeed = getnumber(configFile >> "cfgAmmo" >> _shell >> "maxSpeed");
//_sideAirFriction = getnumber(configFile >> "cfgAmmo" >> _shell >> "sideAirFriction");
_friction = -(getnumber(configFile >> "cfgAmmo" >> _shell >> "airFriction"));
_timeToLive = getnumber(configFile >> "cfgAmmo" >> _shell >> "timeToLive");

//getting turret cfg
_minElev = -90;
_maxElev = 90;
if !(_vehicle isKindOf "CAManBase") then {
	_role = assignedVehicleRole player;
	if ((_role select 0 == "Turret") && !(_vehicle isKindOf "ParachuteBase")) then {
		_turret = _role select 1;
	};
	_path = configFile >> "CfgVehicles" >> _vehicle;
	{
		_path = _path >> "Turrets";
		_path = _path select _x;
		if (isClass _path) then {
			_weapons = getArray (_path >> "weapons");
			{
				if (_x == _weap) then 
				{
					_minElev = getnumber (_path >> "minElev");
					_maxElev = getnumber (_path >> "maxElev");
				}
			} foreach _weapons;
		};
	} foreach _turret;
};
//diag_log format ["elev %1 %2",_minElev,_maxElev];

//relative target coordinates
_vecToTarget = [(_tpos select 0) - (_ppos select 0), (_tpos select 1) - (_ppos select 1), (_tpos select 2) - (_ppos select 2)];
_altitude_impact = (_vectotarget select 2);
_ndir = (( _vecToTarget select 0) atan2 (_vecToTarget select 1));
_npitch = atan((_vecToTarget select 2)/(_vecToTarget call ACE_fnc_magnitude));
if (_ndir < 0) then {_ndir = _ndir+360;};

_ndist = _ppos distance _tpos;

_dirmult = atan(_scale/_ndist);

//current shell have thruster and ballistics cannot be calculated
if ((_thrust > 0)&& {((_shell isKindOf "MissileCore")||(_shell isKindOf "RocketCore"))}) exitWith {
	_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[(round(_npitch*1000)/1000),1,0],[(round(_npitch*1000)/1000),1,0]];
	balca_target = _balca_target;
};
_balca_target = [1,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[0,1,0],[0,1,0]];

if (_friction == 0) then {
	if (_ndist>.7071067810*(.7071067810*_initSpeed+(.5*_initSpeed^2-2*_gravity*_altitude_impact)^(1/2))*_initSpeed/_gravity) then {
		_balca_target = [0,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[0,1,0],[0,1,0]];
	}else{
		_low_solution = atan((_altitude_impact*(_initSpeed^2-_altitude_impact*_gravity+(_initSpeed^4-2*_initSpeed^2*_altitude_impact*_gravity-_gravity^2*_ndist^2)^(1/2))/(_altitude_impact^2+_ndist^2)+_gravity)/(_initSpeed^2-_altitude_impact*_gravity+(_initSpeed^4-2*_initSpeed^2*_altitude_impact*_gravity-_gravity^2*_ndist^2)^(1/2))*(_altitude_impact^2+_ndist^2)/_ndist);
		_flytime_low = _ndist/(_initSpeed*cos(_low_solution));
		_ls_mult = atan((_altitude_impact*(_initSpeed^2-_altitude_impact*_gravity+(_initSpeed^4-2*_initSpeed^2*_altitude_impact*_gravity-_gravity^2*(_ndist + _scale)^2)^(1/2))/(_altitude_impact^2+(_ndist + _scale)^2)+_gravity)/(_initSpeed^2-_altitude_impact*_gravity+(_initSpeed^4-2*_initSpeed^2*_altitude_impact*_gravity-_gravity^2*(_ndist + _scale)^2)^(1/2))*(_altitude_impact^2+(_ndist + _scale)^2)/(_ndist + _scale))-_low_solution;

		_high_solution = -atan(2*(_gravity-1/2*_altitude_impact*(-2*_initSpeed^2+2*_gravity*_altitude_impact+2*(_initSpeed^4-2*_initSpeed^2*_gravity*_altitude_impact-_gravity^2*_ndist^2)^(1/2))/(_altitude_impact^2+_ndist^2))/(-2*_initSpeed^2+2*_gravity*_altitude_impact+2*(_initSpeed^4-2*_initSpeed^2*_gravity*_altitude_impact-_gravity^2*_ndist^2)^(1/2))*(_altitude_impact^2+_ndist^2)/_ndist);
		_flytime_high = _ndist/(_initSpeed*cos(_high_solution));
		_hs_mult = _high_solution + atan(2*(_gravity-1/2*_altitude_impact*(-2*_initSpeed^2+2*_gravity*_altitude_impact+2*(_initSpeed^4-2*_initSpeed^2*_gravity*_altitude_impact-_gravity^2*(_ndist+_scale)^2)^(1/2))/(_altitude_impact^2+(_ndist+_scale)^2))/(-2*_initSpeed^2+2*_gravity*_altitude_impact+2*(_initSpeed^4-2*_initSpeed^2*_gravity*_altitude_impact-_gravity^2*(_ndist+_scale)^2)^(1/2))*(_altitude_impact^2+(_ndist+_scale)^2)/(_ndist+_scale));

		//_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_high_solution,_hs_mult,str(round(_flytime_high*100)/100)+" / "+str(_timeToLive)]];
	  _balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_high_solution,_hs_mult,str(round(_flytime_high*100)/100)]];
	};

}else{
//trying to obtain solution through formula (fast)
_low_solution = [_ndist,_initSpeed,_friction,_altitude_impact] call bArty_fnc_solution;
if (!(_low_solution > -200)or(([30,_altitude_impact,_initspeed,_friction,0.5,1.028] call bArty_fnc_sim) select 1 < _ndist)) then //formula returns complex value when target not reachable
		{_balca_target = [0,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[0,1,0],[0,1,0]];} //target not reachable with current shell
	else {//calculating
		balca_target = _balca_target;
		if (_vehicle isKindOf "StaticMortar") then {_minElev = 40};
		_balca_target = [1,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[0,1,0],[0,1,0]];
		//calculation of low solution
		if ((_low_solution > 12)and(_minElev<40)and(_friction>0.0001)and(_use_sim)) then //solution not preciese, need to use simulation
			{
				_table = [([10,_altitude_impact,_initspeed,_friction,0.5,1.028] call bArty_fnc_sim)];
				_step = 5;
				_simstep = 0.5;
				_adjust = 1.004;
				_calculating = true;
				for [{_i = 10}, {((_i < 40)and(_calculating))}, {_i = _i+_step}] do
				{
					_tab = [_i,_altitude_impact,_initspeed,_friction,_simstep,_adjust] call bArty_fnc_sim;
					_table set [count _table,_tab];
					if ((count _table)>=2) then {
						if ((_step==1)and(((_table select ((count _table) - 1)) select 1 > _ndist)and((_table select ((count _table) - 2)) select 1 < _ndist))) then
						{
							_calculating = false;
						};
						if ((_step==5)and(((_table select ((count _table) - 1)) select 1 > _ndist)and((_table select ((count _table) - 2)) select 1 < _ndist))) then
						{
							_step = 1;
							_celev = [_ndist,(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp;
							_i = floor(_celev - 2);
							_simstep = 0.1;
							_adjust = 1.004;
							_table = [([_i,_altitude_impact,_initspeed,_friction,_simstep,_adjust] call bArty_fnc_sim)];
						};
					};
				};
				/*diag_log format ["ls %1 %2",
					(_table select ((count _table) - 1)),
					(_table select ((count _table) - 2))];*/
				if ((_table select ((count _table) - 1)) select 1 > _ndist) then 
					{
						_low_solution = [_ndist,(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp;
						_ls_mult = ([(_ndist+_scale),(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp)-_low_solution;
						_flytime_low = (_table select ((count _table) - 1)) select 2;
						//_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)]];
						_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)]];
					} else	{
						_balca_target = [0,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[0,1,0],[0,1,0]];
					};
			}
				else //solution preciese, just need to calculate flytime
			{
				_flytime_low = -ln((-_ndist*_friction+_initspeed*cos(_low_solution))/_initspeed/cos(_low_solution))/_friction;
				_ls_mult = ([(_ndist+_scale),_initSpeed,_friction,_altitude_impact] call bArty_fnc_lowSolution)-_low_solution;
				//_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)]];
				_balca_target = [2,[_displayName,_mag,_currentWeaponMode],[(round(_ndist)),_tpos],[(round(_ndir*1000)/1000),_dirmult,(round(_npitch*1000)/1000)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)+" / "+str(_timeToLive)],[_low_solution,_ls_mult,str(round(_flytime_low*100)/100)]];
			};
		//calculation of high solution
		if (((_balca_target select 0) == 2)and(_use_sim)) then 
			{
				_table = [];
				if (_vehicle isKindOf "StaticMortar") then {_maxElev = 90;_tab = [90,0]}else{;
				_tab = [_maxElev,_altitude_impact,_initspeed,_friction,0.5,1] call bArty_fnc_sim;};//0.1,1.0062   0.5,1.0165
				if (_tab select 1 < _ndist) then //turret's max_elev enough to reach target
				{
					_table = [_tab];
					_step = -5;
					_simstep = 0.5;
					_adjust = 1.028;
					_calculating = true;
					for [{_i = (_maxElev-5)}, {((_i > 40)and(_calculating))}, {_i = _i+_step}] do
					{
						_tab = [_i,_altitude_impact,_initspeed,_friction,_simstep,_adjust] call bArty_fnc_sim;
						_table set [count _table,_tab];
						if ((count _table)>=2) then {
							if ((_step==-1)and(((_table select ((count _table) - 1)) select 1 > _ndist)and((_table select ((count _table) - 2)) select 1 < _ndist))) then
							{
								_calculating = false;
							};
							if ((_step==-5)and(((_table select ((count _table) - 1)) select 1 > _ndist)and((_table select ((count _table) - 2)) select 1 < _ndist))) then
							{
								_step = -1;
								_celev = [_ndist,(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp;
								_i = floor(_celev + 3);
								if (_i>90) then {_i=90};
								_simstep = 0.1;
								_adjust = 1.0062;
								_table = [([_i,_altitude_impact,_initspeed,_friction,_simstep,_adjust] call bArty_fnc_sim)];
							};
						};
					};
					/*diag_log format ["hs %1 %2",
						(_table select ((count _table) - 1)),
						(_table select ((count _table) - 2))];*/
					if ((_table select ((count _table) - 1)) select 1 > _ndist) then
						{
							_high_solution = [_ndist,(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp;
							_hs_mult = _high_solution-([(_ndist+_scale),(_table select ((count _table) - 1)),(_table select ((count _table) - 2))] call bArty_fnc_interp);
							_flytime_high = ((_table select ((count _table) - 1)) select 2);
							//_balca_target set[5,[_high_solution,_hs_mult,str(round(_flytime_high*100)/100)+" / "+str(_timeToLive)]];
							_balca_target set[5,[_high_solution,_hs_mult,str(round(_flytime_high*100)/100)]];
						};
				};
			};
	};//end calculating
};
//player globalChat format ["%1", _balca_target];

_azimuth = round((_balca_target select 3) select 0);
_elevation = round(((_balca_target select 5) select 0)*17.78);  //1 degree ~= 17.78 mils
_flightTime = (_balca_target select 5) select 2;

_return = [_azimuth, _elevation, _flightTime, _balca_target];

_return