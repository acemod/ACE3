if (!isnil "CSE_LAST_TRACKER_THORBEEP_MOMENT") exitwith {};

CSE_PLAY_THOR_III_SOUND_IEDS = false;
CSE_THOR_III_PACK_ENABLED_IEDS = true;
player setvariable ["CSE_THOR_III_PACK_ENABLED_IEDS",true,true];
CSE_LAST_TRACKER_THORBEEP_MOMENT = time;
_code = {
	if ((backpack player) == "cse_thorIII_backpack" && {(player getvariable ["CSE_THOR_III_PACK_ENABLED_IEDS", false])}) then {
		_foundIEDS = nearestObjects [player, ["cseModule_spawnIEDs", "cse_playerSpawnedIED"], 50];
		{
			_distanceToIED = player distance _x;
			if (_distanceToIED < 50) exitwith {
				if (_X getvariable ["iedActivationType",0] == 1) exitwith {
					_timeDifference = (_distanceToIED/50) * 10 * MODIFIER_LOOP_DELAY;
					if (time - CSE_LAST_TRACKER_THORBEEP_MOMENT >= (_timeDifference*accTime)) then {
						CSE_LAST_TRACKER_THORBEEP_MOMENT = time;
						playSound3D ["cse\cse_sys_ieds\sounds\beeps\03_Dull_Short_Mid.wav", player,  false, getPos player, 35, 1, 10];
					};
				};
			};
			CSE_LAST_TRACKER_THORBEEP_MOMENT = time;
		}count _foundIEDS;
	};
};

["cse_thor3TrackerBeeping", [], _code] call cse_fnc_addTaskToPool_f;

true;