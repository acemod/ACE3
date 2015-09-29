#include "script_component.hpp"

// Exit on Headless
if (!hasInterface) exitWith {};

// Add interaction menu exception
["isNotSitting", {!((_this select 0) getVariable [QGVAR(isSitting), false])}] call EFUNC(common,addCanInteractWithCondition);

// Handle interruptions
["medical_onUnconscious", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
["SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
