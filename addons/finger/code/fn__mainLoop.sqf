#include "addon.hpp"
#include "main.hpp"

LOG("Starting");

//while {isNull (findDisplay 46)} do {sleep 1;};


GVAR(FP_keyComb) = FP_DEFAULT_KEYBIND;

GVAR(lastFPTime) = -FP_ACTION_TIMEOUT;
	
	
["ACE3 Common", 
	"point_finger_at", 
	[LOCALIZE(keyComb), LOCALIZE(keyComb)], 
	{
	
		PV(_rv) = false;
		if (alive player) then
		{	
			if (!(
					(player == vehicle player ||
					(vehicle player) isKindOf "StaticWeapon") &&
					cameraView in ["INTERNAL", "EXTERNAL"]
				)) exitWith {};
				
			_rv = true;
				
			if (diag_tickTime < GVAR(lastFPTime) + FP_ACTION_TIMEOUT) 
				exitWith {};
			
			
			PV(_pos_prec) = positionCameraToWorld [0, 0, FP_DISTANCE];
			PV(_pos) = positionCameraToWorld [
					random (2*FP_RANDOMIZATION_X) - FP_RANDOMIZATION_X,
					random (2*FP_RANDOMIZATION_Y) - FP_RANDOMIZATION_Y,
					FP_DISTANCE
				];
				
				
			PV(_dest_players) = [];
			
			PV(_pep) = eyePos player;
			{
				if (isPlayer _x && _x != player && alive _x &&
					{(_x == vehicle _x || (vehicle _x) isKindOf "StaticWeapon") && {
						((eyePos _x) vectorDistance _pep) < MAX_DIST_TO_OTHER_PLAYERS
					}}) then
				{
					_dest_players pushBack _x;
				};
			} forEach playableUnits;
			
			GVAR(pv_fpToServer)	= [player, _pos, _dest_players];
			
			LOGV(GVAR(pv_fpToServer));
			
			if (isServer) then
			{
				[0, GVAR(pv_fpToServer)] call GVAR(fnc_pv_fpToServer);
			}
			else
			{
				publicVariableServer 'GVAR(pv_fpToServer)';
			};
			
			
			if (GVAR(FP_indicator_for_self)) then
			{
				[0, [player, _pos_prec]] call GVAR(fnc_pv_fpToClient);
			};
			
			player playActionNow "GestureGo";
			GVAR(lastFPTime) = diag_tickTime;
			
			_rv = true;
		};
		
		_rv;
	},
	"", 
	[GVAR(FP_keyComb) select 0, 
	[GVAR(FP_keyComb) select 1, GVAR(FP_keyComb) select 2, GVAR(FP_keyComb) select 3]]
] call cba_fnc_addKeybind;	




LOG("Done");
