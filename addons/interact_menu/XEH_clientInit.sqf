//XEH_clientInit.sqf
#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(blockDefaultActions) = [];

GVAR(cachedBuildingTypes) = [];
GVAR(cachedBuildingActionPairs) = [];

GVAR(ParsedTextCached) = [];

addMissionEventHandler ["Draw3D", FUNC(render)];

//Add Actions to Houses:
["ace_interactMenuOpened", FUNC(userActions_addHouseActions)] call CBA_fnc_addEventHandler;

["ACE3 Common", QGVAR(InteractKey), localize LSTRING(InteractKey), {
    // Statement
    [0] call FUNC(keyDown);
} , {
    [0,false] call FUNC(keyUp);
}, [219, [false, false, false]], false] call CBA_fnc_addKeybind;  //Left Windows Key

["ACE3 Common", QGVAR(SelfInteractKey), localize LSTRING(SelfInteractKey), {
    // Statement
    [1] call FUNC(keyDown);
} , {
    [1,false] call FUNC(keyUp);
}, [219, [false, true, false]], false] call CBA_fnc_addKeybind; //Left Windows Key + Ctrl/Strg

// Listens for the falling unconscious event, just in case the menu needs to be closed
["ace_unconscious", {
    // If no menu is open just quit
    if (GVAR(openedMenuType) < 0) exitWith {};

    params ["_unit", "_isUnconscious"];

    if (_unit != ACE_player || !_isUnconscious) exitWith {};

    GVAR(actionSelected) = false;
    [GVAR(openedMenuType), false] call FUNC(keyUp);
}] call CBA_fnc_addEventHandler;

// background options
["ace_interactMenuOpened", {
    if (GVAR(menuBackground)==1) then {[QGVAR(menuBackground), true] call EFUNC(common,blurScreen);};
    if (GVAR(menuBackground)==2) then {0 cutRsc[QGVAR(menuBackground), "PLAIN", 1, false];};
}] call CBA_fnc_addEventHandler;

["ace_interactMenuClosed", {
    if (GVAR(menuBackground)==1) then {[QGVAR(menuBackground), false] call EFUNC(common,blurScreen);};
    if (GVAR(menuBackground)==2) then {(uiNamespace getVariable [QGVAR(menuBackground), displayNull]) closeDisplay 0;};
}] call CBA_fnc_addEventHandler;
