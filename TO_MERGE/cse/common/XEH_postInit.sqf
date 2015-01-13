/**
 * XEH_postInit.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

[QGVAR(ENABLE_REVIVE_COUNTER), 0, false, QGVAR(variables)] call FUNC(defineVariable);
[QGVAR(inReviveState), false, true, QGVAR(variables)] call FUNC(defineVariable);
[QGVAR(isDead),false,true,"cse"] call FUNC(defineVariable);
[QGVAR(isDeadPlayer), false, true, "cse"] call FUNC(defineVariable);
[QGVAR(StateArrested),false,true,"cse"] call FUNC(defineVariable);
[QGVAR(StateUnconscious),false,true,"cse"] call FUNC(defineVariable);
[QGVAR(ENABLE_REVIVE_SETDEAD_F),0,false,"cse"] call FUNC(defineVariable);
[QGVAR(carriedBy),objNull,false,"cse"] call FUNC(defineVariable);

if (isNil QGVAR(ENABLE_REVIVE_F)) then {
	GVAR(ENABLE_REVIVE_F) = 0;
};

if (hasInterface) then{
	[] spawn {
		sleep 1;
		waitUntil {!isNull player && !(isNull (findDisplay 46))};
		player setvariable [QGVAR(name), name player, true];
		player addEventHandler ["respawn", {_this call FUNC(resetAllDefaults_F);}];

		// For the icons functions top right
		//11401 cutRsc ["cse_gui_iconsDisplay","PLAIN"];
		45 cutRsc ["RscCSEScreenEffectsBlack","PLAIN"];
	};
};

if (isServer) then {
	GVAR(LOGIC_OBJECT) = (createGroup sideLogic) createUnit ["logic", [1,1,1], [], 0, "FORM"];
	publicVariable QGVAR(LOGIC_OBJECT);
};
