// by esteldunedain
#include "script_component.hpp"

if (!hasInterface) exitWith {};
GVAR(isSpeedLimiter) = false;

// Add keybinds
["ACE3 Vehicles", QGVAR(speedLimiter), localize LSTRING(SpeedLimiter), {
    false call FUNC(toggleSpeedControl)
}, {false}, [DIK_DELETE, [false, false, false]], false] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(cruiseControl), localize LSTRING(CruiseControl), {
    true call FUNC(toggleSpeedControl)
}, {false}, [DIK_INSERT, [false, false, false]], false] call CBA_fnc_addKeybind;

["ACE3 Vehicles", QGVAR(scrollUp), localize LSTRING(IncreaseSpeedLimit), {
    if (GVAR(isSpeedLimiter)) then {
        GVAR(speedLimit) = round (GVAR(speedLimit) + GVAR(speedLimiterStep)) max (5 max GVAR(speedLimiterStep));
        GVAR(speedLimit) = 5 max GVAR(speedLimiterStep) * floor (GVAR(speedLimit) / GVAR(speedLimiterStep));
        [["%1: %2", LSTRING(SpeedLimit), GVAR(speedLimit)]] call EFUNC(common,displayTextStructured);
        true
    } else {
        !isNil QGVAR(speedLimit)
        && {[GVAR(isCruiseControl), true] call FUNC(toggleSpeedControl)} // RESUME
    };
}, {false}, [MOUSE_SCROLL_UP, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + Mouse Wheel Scroll Up

["ACE3 Vehicles", QGVAR(scrollDown), localize LSTRING(DecreaseSpeedLimit), {
    if (GVAR(isSpeedLimiter)) then {
        GVAR(speedLimit) = round (GVAR(speedLimit) - GVAR(speedLimiterStep)) max (5 max GVAR(speedLimiterStep));
        GVAR(speedLimit) = 5 max GVAR(speedLimiterStep) * ceil (GVAR(speedLimit) / GVAR(speedLimiterStep));
        [["%1: %2", LSTRING(SpeedLimit), GVAR(speedLimit)]] call EFUNC(common,displayTextStructured);
        true
    } else {
        !isNil QGVAR(isCruiseControl)
        && {GVAR(isCruiseControl) call FUNC(toggleSpeedControl)} // SET
    };
}, {false}, [MOUSE_SCROLL_DOWN, [false, true, false]], false] call CBA_fnc_addKeybind; // Ctrl + Mouse Wheel Scroll Down
