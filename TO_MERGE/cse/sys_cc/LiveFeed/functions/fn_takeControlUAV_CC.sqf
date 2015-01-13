/**
 * fn_takeControlUAV_CC.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: [uav OBJECT (Of type UAV)]
 * @Return:
 * @PublicAPI: false
 */

private ["_uav", "_continue"];
_uav = _this select 0;
if (_uav in allUnitsUAV) then {
	if (isnil "CSE_CONTROL_UAV_RESTRICTED_CC") then {
		CSE_CONTROL_UAV_RESTRICTED_CC = false;
	};
	_continue = true;
	if (CSE_CONTROL_UAV_RESTRICTED_CC) then {
		_continue = player getvariable ["cse_canControlUAVs_CC", false];
	};

	if (!_continue) exitwith {}; // has no access to control the UAV.
	if (!("GUNNER" in uavControl _uav)) then {
		if (count (crew _uav) >= 2) then {
			player remoteControl ((crew _uav) select 1);
			 _uav switchCamera "Gunner";
			closeDialog 0;
		} else {
			if (!("DRIVER" in uavControl _uav)) then {
				if (count (crew _uav) >= 1) then {
					player remoteControl ((crew _uav) select 0);
					 _uav switchCamera "INTERNAL";
					closeDialog 0;
				};
			};
		};

	};
};