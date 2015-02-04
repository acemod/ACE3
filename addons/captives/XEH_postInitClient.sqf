// by commy2

[missionNamespace, "playerChanged", {_this call ACE_Captives_fnc_handlePlayerChanged}] call ACE_Core_fnc_addCustomEventhandler;



[QGVAR(MoveIn), {_this call FUNC(vehicleCaptiveMoveIn)}] call EFUNC(common,addEventHandler);
[QGVAR(MoveOut), {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);
[QGVAR(SetCaptive), {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);
