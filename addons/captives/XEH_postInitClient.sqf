#include "script_component.hpp"

["playerChanged", {_this call FUNC(handlePlayerChanged)}] call EFUNC(common,addEventhandler);
["MoveInCaptive", {_this call FUNC(vehicleCaptiveMoveIn)}] call EFUNC(common,addEventHandler);
["MoveOutCaptive", {_this call FUNC(vehicleCaptiveMoveOut)}] call EFUNC(common,addEventHandler);
["SetHandcuffed", {_this call FUNC(setHandcuffed)}] call EFUNC(common,addEventHandler);

//TODO: Medical Integration Events???

// [_unit, "knockedOut", {
    // if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleKnockedOut};
// }] call ACE_Core_fnc_addCustomEventhandler;

// [_unit, "wokeUp", {
    // if (local (_this select 0)) then {_this call ACE_Captives_fnc_handleWokeUp};
// }] call ACE_Core_fnc_addCustomEventhandler;
