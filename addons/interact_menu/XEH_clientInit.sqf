//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(cachedBuildingTypes) = [];
GVAR(cachedBuildingActionPairs) = [];

GVAR(ParsedTextCached) = [];

["SettingChanged", {
    params ["_name"];
    if (({_x == _name} count [QGVAR(colorTextMax), QGVAR(colorTextMin), QGVAR(colorShadowMax), QGVAR(colorShadowMin), QGVAR(textSize), QGVAR(shadowSetting)]) == 1) then {
        [] call FUNC(setupTextColors);
    };
}] call CFUNC(addEventhandler);

["SettingsInitialized", {
    //Setup text/shadow/size/color settings matrix
    [] call FUNC(setupTextColors);
    // Install the render EH on the main display
    addMissionEventHandler ["Draw3D", DFUNC(render)];
}] call CFUNC(addEventHandler);

//Add Actions to Houses:
["interactMenuOpened", {_this call FUNC(userActions_addHouseActions)}] call CFUNC(addEventHandler);

["ACE3 Common", QGVAR(InteractKey), (localize LSTRING(InteractKey)),
{
    // Statement
    [0] call FUNC(keyDown)
},{[0,false] call FUNC(keyUp)},
[219, [false, false, false]], false] call CBA_fnc_addKeybind;  //Left Windows Key

["ACE3 Common", QGVAR(SelfInteractKey), (localize LSTRING(SelfInteractKey)),
{
    // Statement
    [1] call FUNC(keyDown)
},{[1,false] call FUNC(keyUp)},
[219, [false, true, false]], false] call CBA_fnc_addKeybind; //Left Windows Key + Ctrl/Strg


// Listens for the falling unconscious event, just in case the menu needs to be closed
["medical_onUnconscious", {
    // If no menu is open just quit
    if (GVAR(openedMenuType) < 0) exitWith {};

    params ["_unit", "_isUnconscious"];

    if (_unit != ACE_player || !_isUnconscious) exitWith {};

    GVAR(actionSelected) = false;
    [GVAR(openedMenuType), false] call FUNC(keyUp);
}] call CFUNC(addEventhandler);

// disable firing while the interact menu is is is opened
["playerChanged", {_this call FUNC(handlePlayerChanged)}] call CFUNC(addEventHandler);

// background options
["interactMenuOpened", {
    if (GVAR(menuBackground)==1) then {[QGVAR(menuBackground), true] call CFUNC(blurScreen);};
    if (GVAR(menuBackground)==2) then {0 cutRsc[QGVAR(menuBackground), "PLAIN", 1, false];};
}] call CFUNC(addEventHandler);
["interactMenuClosed", {
    if (GVAR(menuBackground)==1) then {[QGVAR(menuBackground), false] call CFUNC(blurScreen);};
    if (GVAR(menuBackground)==2) then {(uiNamespace getVariable [QGVAR(menuBackground), displayNull]) closeDisplay 0;};
}] call CFUNC(addEventHandler);
