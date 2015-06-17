#include "script_component.hpp"

if (!hasInterface) exitWith {};

["SettingsInitialized", {
    //call something
}] call EFUNC(common,addEventHandler);
