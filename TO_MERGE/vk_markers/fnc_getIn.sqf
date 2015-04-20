// #define DEBUG_MODE_FULL
#include "script_component.hpp"
PARAMS_3(_vehicle,_pos,_unit);
private ["_i","_playerCargo","_vehicleBFT","_commanderBFT","_gunnerBFT","_driverBFT","_cargoBFT","_slCargoOnly","_crew"];

// if (!GVAR(postInit)) then {
	// if (isNull player) then {
		// waitUntil {!isNull player};
	// };
// };
if (_unit == player) then {
	_vehicleBFT = _vehicle getVariable QGVAR(BFT);
	TRACE_1("",_vehicleBFT);
	ISNILS(_vehicleBFT, false);
	
	if (IS_ARRAY(_vehicleBFT)) then {
		EXPLODE_5(_vehicleBFT,_commanderBFT,_gunnerBFT,_driverBFT,_cargoBFT,_slCargoOnly);
		TRACE_5("",_commanderBFT,_gunnerBFT,_driverBFT,_cargoBFT,_slCargoOnly);
	
		// switch (_pos) do {
			// case "commander": {
				// if (_commanderBFT) then {
					// GVAR(playerBFT) = true;
				// };
			// };
			// case "gunner": {
				// if (_gunnerBFT) then {
					// GVAR(playerBFT) = true;
				// };
			// };
			// case "driver": {
				// if (_driverBFT) then {
					// GVAR(playerBFT) = true;
				// };
			// };
			// case "cargo": {
				// if (_cargoBFT) then {
					// if (_slCargoOnly) then {
						// if (leader group player == player) then {
							// GVAR(playerBFT) = true;
						// };
					// } else {
						// GVAR(playerBFT) = true;
					// };
				// };
			// };
		// };
		
		GVAR(getInLoop) = [_vehicle,_vehicleBFT] spawn {
			private ["_vehicle","_commanderBFT","_gunnerBFT","_driverBFT","_cargoBFT","_slCargoOnly"];
			_vehicle = _this select 0;
			EXPLODE_5(_this select 1,_commanderBFT,_gunnerBFT,_driverBFT,_cargoBFT,_slCargoOnly);
			
			while {count (assignedVehicleRole player) > 0} do {
				switch (assignedVehicleRole player select 0) do {
					case "Driver": {
						if (_driverBFT) then {
							GVAR(playerBFT) = true;
						} else {
							GVAR(playerBFT) = false;
						};
					};
					case "Cargo": {
						if (_cargoBFT) then {
							if (_slCargoOnly) then {
								if (leader group player == player) then {
									GVAR(playerBFT) = true;
								} else {
									GVAR(playerBFT) = false;
								};
							} else {
								GVAR(playerBFT) = true;
							};
						} else {
							GVAR(playerBFT) = false;
						};
					};
					case "Turret": {
						if (player == commander _vehicle) then {
							if (_commanderBFT) then {
								GVAR(playerBFT) = true;
							} else {
								GVAR(playerBFT) = false;
							};
						} else {
							if (player == gunner _vehicle) then {
								if (_gunnerBFT) then {
									GVAR(playerBFT) = true;
								} else {
									GVAR(playerBFT) = false;
								};
							};
						};
					};
				};
			};
		};
		
	} else {
		// LOG("BOOL");
		if (_vehicleBFT) then {
			GVAR(playerBFT) = true;
		};
	};
};