/*
	Name: AGM_Parachute_fnc_init
	
	Author: Garth de Wet (LH)
	
	Description:
		Auto called by Arma.
		Initialises the parachute system.
	
	Parameters: 
	
	Returns:
		Nothing
	
	Example:
		call AGM_Parachute_fnc_init;
*/
[] spawn {
	AGM_Parachuting_PFH = false;
	while {true} do {
		sleep 1;
		// I believe this doesn't work for Zeus.
		// vehicle _player
		if (!AGM_Parachuting_PFH && {(vehicle AGM_player) isKindOf "ParachuteBase"}) then {
			AGM_Parachuting_PFH = true;
			["AGM_ParachuteFix", "OnEachFrame", {call AGM_Parachute_fnc_onEachFrame;}] call BIS_fnc_addStackedEventHandler;
		};
	};
};

// don't show speed and height when in expert mode
["Parachute", {if (!cadetMode) then {_dlg = _this select 0; {(_dlg displayCtrl _x) ctrlShow false} forEach [121, 122, 1004, 1005, 1006, 1014];};}] call AGM_Core_fnc_addInfoDisplayEventHandler;
["Soldier", {if (!cadetMode) then {_dlg = _this select 0; {_ctrl = (_dlg displayCtrl _x); _ctrl ctrlSetPosition [0,0,0,0]; _ctrl ctrlCommit 0;} forEach [380, 382]};}] call AGM_Core_fnc_addInfoDisplayEventHandler;
