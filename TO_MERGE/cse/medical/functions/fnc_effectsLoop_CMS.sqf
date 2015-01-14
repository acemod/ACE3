/**
 * fn_effectsLoop_CMS.sqf
 * @Descr: displays visual effects to user
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_bloodLoss","_bloodStatus","_painStatus"];
_unit = player;
if (!hasInterface || !isPlayer _unit || !local _unit) exitwith{};
45 cutRsc ["RscCSEScreenEffectsBlack","PLAIN"];
cseDisplayingBleedingEffect = false;
cseDisplayingPainEffect = false;
cseDisplayingUnconiciousEffect = false;

_hb_effect = {
	_heartRate = _this select 0;
	if (_heartRate < 0.1) exitwith {};
	_hbSoundsFast = ["ACE_heartbeat_fast_1", "ACE_heartbeat_fast_2", "ACE_heartbeat_fast_3", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
	_hbSoundsNorm = ["ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
	_hbSoundsSlow = ["ACE_heartbeat_slow_1", "ACE_heartbeat_slow_2", "ACE_heartbeat_norm_1", "ACE_heartbeat_norm_2"];
	if (isnil QGVAR(playingHeartBeatSound)) then {
		GVAR(playingHeartBeatSound) = false;
	};
	if (GVAR(playingHeartBeatSound)) exitwith {};
	GVAR(playingHeartBeatSound) = true;

	_sleep = 60 / _heartRate;
	if (_heartRate < 60) then {
		_sound = _hbSoundsSlow select (random((count _hbSoundsSlow) -1));
		playSound _sound;

		sleep _sleep;
	} else {
		if (_heartRate > 120) then {
			_sound = _hbSoundsFast select (random((count _hbSoundsFast) -1));
			playSound _sound;
			sleep _sleep;
		};
	};
	GVAR(playingHeartBeatSound) = false;
};

while {true} do {
	_unit = player;
	if ([_unit] call EFUNC(common,isAwake)) then {
		sleep 0.25;
		_bloodLoss = _unit call FUNC(getBloodLoss_CMS);
		_bloodStatus = [_unit,QGVAR(bloodVolume),100] call EFUNC(common,getDefinedVariable);
		_painStatus = [_unit,QGVAR(amountOfPain),0] call EFUNC(common,getDefinedVariable);

		if (_bloodLoss >0) then {
			//["cse_sys_medical_isBleeding", true, "cse\cse_sys_medical\data\icons\icon_bleeding.paa", [1,1,1,1]] call EFUNC(gui,displayIcon);
			[_bloodLoss] spawn FUNC(effectBleeding);
		} else {
			//["cse_sys_medical_isBleeding", false, "cse\cse_sys_medical\data\icons\icon_bleeding.paa", [1,1,1,1]] call EFUNC(gui,displayIcon);
		};
		sleep 0.25 +(random(2));
		if (_painStatus > 0) then {
			[_painStatus] spawn FUNC(effectPain);
		};
		sleep 0.25 +(random(1));
		_heartRate = [_unit,QGVAR(heartRate),70] call EFUNC(common,getDefinedVariable);
		[_heartRate] spawn _hb_effect;
	} else {
		cseDisplayingBleedingEffect = false;
	};
};

