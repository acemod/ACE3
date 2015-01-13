/**
 * fn_healLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit", "_caller", "_wasUnconscious"];
_unit = _this select 0;
_caller = _this select 1;

if (alive _unit) then {
	_wasUnconscious = [_unit] call EFUNC(common,isUnconscious);
	[_unit,"treatment",format["%1 used a personal aid kit",[_caller] call EFUNC(common,getName)]] call FUNC(addActivityToLog_CMS);

	[_unit,QGVAR(openWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(bandagedWounds),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(fractures),[[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0],[0,0,0]]] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(airway),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(tourniquets),[0,0,0,0,0,0]] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(splints),0] call EFUNC(common,setDefinedVariable);

	//[QGVAR(activityLog),[]] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(triageLevel),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(triageCard),[]] call EFUNC(common,setDefinedVariable);

	// private variables
	[_unit,QGVAR(bloodVolume),100] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(bloodIVVolume),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(plasmaIVVolume),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(salineIVVolume),0] call EFUNC(common,setDefinedVariable);

	[_unit,QGVAR(amountOfPain),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(heartRate),80] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(andrenaline),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(bloodPressure),[80,120]] call EFUNC(common,setDefinedVariable);

	[_unit,QGVAR(givenMorphine),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(givenAtropine),0] call EFUNC(common,setDefinedVariable);
	[_unit,QGVAR(givenEpinephrine),0] call EFUNC(common,setDefinedVariable);

	[_unit,QGVAR(bodyPartStatus),[0,0,0,0,0,0]] call EFUNC(common,setDefinedVariable);
	[_unit,"CSE_ENABLE_REVIVE_SETDEAD_F", 0] call EFUNC(common,setDefinedVariable);
	[_unit,"CSE_ENABLE_REVIVE_COUNTER", 0] call EFUNC(common,setDefinedVariable);

	_unit setDamage 0;
	if (!CSE_ALLOW_INSTANT_DEAD_CMS) then {
		[_unit, QGVAR(noInstantDeath), false] call EFUNC(common,setDefinedVariable);
	};

	if (isPlayer _unit) then {
		[false] call EFUNC(common,effectBlackOut);
		[true] call EFUNC(common,setVolume_f);
		["unconscious", false] call EFUNC(common,disableUserInput_f);
	};
	if (_wasUnconscious) then {
		["waiting until no longer unconscious"] call EFUNC(common,debug);
		waituntil {!([_unit] call EFUNC(common,isUnconscious))};
		sleep 0.1;

		if (vehicle _unit == _unit) then {
			if (!([_unit] call EFUNC(common,beingCarried))) then {
				["Resetting animation"] call EFUNC(common,debug);
				[_unit,"",false] call EFUNC(common,broadcastAnim);
				[_unit,"amovppnemstpsnonwnondnon",false] call EFUNC(common,broadcastAnim);
			};
		};
	};
	["Completed healLocal"] call EFUNC(common,debug);
};
