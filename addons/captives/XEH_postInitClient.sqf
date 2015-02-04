#include "script_component.hpp"

[missionNamespace, "playerChanged", {_this call ACE_Captives_fnc_handlePlayerChanged}] call ACE_Core_fnc_addCustomEventhandler;



["MoveInCaptive", {_this call FUNC(vehicleCaptiveMoveIn)}] call EFUNC(common,addEventHandler);
["MoveOutCaptive", {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);
["SetCaptive", {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);

//TODO: Medical Integration Events???

// [_unit, "knockedOut", {
    // if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleKnockedOut};
// }] call ACE_Core_fnc_addCustomEventhandler;

// [_unit, "wokeUp", {
    // if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleWokeUp};
// }] call ACE_Core_fnc_addCustomEventhandler;
