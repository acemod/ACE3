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
#include "variable_defines.sqf"


GVAR(task_pool_lastTime) = time;
GVAR(injuredUnitCollection) = [];

FUNC(taskLoopCode) = {
	if ((time - GVAR(task_pool_lastTime)) >= 1 || true) then {
		GVAR(task_pool_lastTime) = time;
		{
			if (!alive _x || !local _x) then {
				GVAR(injuredUnitCollection) set [ _forEachIndex, ObjNull];
			} else {
				[_x] call FUNC(updateVitals_CMS);
				_pain = _X getvariable [QGVAR(amountOfPain), 0];
				if (_pain > 5 && (random(1) > 0.5)) then {
					_x setvariable [QGVAR(amountOfPain), _pain + 0.002];
				};
				if (_pain > 45) then {
					if (random(1) > 0.6) then {
						[_X] call EFUNC(common,setUnconsciousState);
					};
					//[_X] call FUNC(playInjuredSound_CMS);
				};
			};
		}foreach GVAR(injuredUnitCollection);
		GVAR(injuredUnitCollection) = GVAR(injuredUnitCollection) - [ObjNull];
	};
 false; };

GVAR(cms_taskLoop_trigger) = createTrigger["EmptyDetector", [0,0,0]];
GVAR(cms_taskLoop_trigger) setTriggerActivation ["NONE", "PRESENT", true];
GVAR(cms_taskLoop_trigger) setTriggerStatements[QUOTE(call FUNC(taskLoopCode)), "", ""];

[
	{(([_this select 0,QGVAR(bloodVolume)] call EFUNC(common,getDefinedVariable)) < 65)},
	{(([_this select 0,QGVAR(amountOfPain)] call EFUNC(common,getDefinedVariable)) > 48)}
] call EFUNC(common,registerUnconsciousCondition);

call FUNC(effectsLoop_CMS);