#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(lastFPTime) = -1;
GVAR(fingersHash) = HASH_CREATE;
GVAR(pfeh_id) = -1;

["SettingsInitialized", {
    //If not enabled, dont't bother adding keybind or eventhandler
    if (!GVAR(enabled)) exitWith {};

    [QGVAR(fingered), {_this call FUNC(incomingFinger)}] call EFUNC(common,addEventHandler);

    [localize ELSTRING(common,ACEConfigCategoryCommon),
    QGVAR(finger),
    [(localize LSTRING(keyComb)), (localize LSTRING(keyComb_description))],
    {
        _this call FUNC(keyPress);
    },
    {false},
    [41, [true, false, false]], true] call cba_fnc_addKeybind; // Shift + Tilda (hold)
}] call EFUNC(common,addEventHandler);
