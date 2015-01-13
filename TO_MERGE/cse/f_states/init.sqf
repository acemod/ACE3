/*

*/

	call compileFinal preprocessFile "cse\cse_f_states\functions.sqf";

	if (!isDedicated) then {
		45 cutRsc ["RscCSEScreenEffectsBlack","PLAIN"];
	};

	if (isServer) then {
		CSE_LOGIC_OBJECT = (createGroup sideLogic) createUnit ["logic", [1,1,1], [], 0, "FORM"];
		publicVariable "CSE_LOGIC_OBJECT";
	};


	["cse_isDead",false,true,"cse"] call cse_fnc_defineVariable;
	["cse_isDeadPlayer", false, true, "cse"] call cse_fnc_defineVariable;
	["cse_state_arrested",false,true,"cse"] call cse_fnc_defineVariable;
	["cse_state_unconscious",false,true,"cse"] call cse_fnc_defineVariable;
	["CSE_ENABLE_REVIVE_SETDEAD_F",0,false,"cse"] call cse_fnc_defineVariable;
	["cse_carriedBy",objNull,false,"cse"] call cse_fnc_defineVariable;

	if (isnil "CSE_MARKED_FOR_GABAGE_COLLECTION") then {
		CSE_MARKED_FOR_GABAGE_COLLECTION = [];
	};

	[] spawn {
		waituntil {
			{
				deleteVehicle _x;
				false;
			}count CSE_MARKED_FOR_GABAGE_COLLECTION;
			CSE_MARKED_FOR_GABAGE_COLLECTION = CSE_MARKED_FOR_GABAGE_COLLECTION - [objNull];
			false;
		};
	};