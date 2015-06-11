#include "script_component.hpp"

// Add interaction menu exception
["isNotSitting", {!((_this select 0) getVariable [QGVAR(isSitting), false])}] call EFUNC(common,addCanInteractWithCondition);

// Handle interruptions
["medical_onUnconscious", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
["SetHandcuffed", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
["SetSurrendered", {_this call DFUNC(handleInterrupt)}] call EFUNC(common,addEventhandler);
