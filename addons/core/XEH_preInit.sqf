// by commy2

AGM_player = player;

if (hasInterface) then {
	["AGM_CheckForPlayerChange", "onEachFrame", {
		if !(AGM_player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
		//if (AGM_player != missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player]) then {
			_this = AGM_player;

			AGM_player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
			uiNamespace setVariable ["AGM_player", AGM_player];

			[missionNamespace, "playerChanged", [AGM_player, _this]] call FUNC(callCustomEventHandlers);
		};
	}] call BIS_fnc_addStackedEventHandler;
};

// remove this for the release
/*if (isNil "AGM_Debug") then {
	AGM_Debug = ["remote"];
};*/
