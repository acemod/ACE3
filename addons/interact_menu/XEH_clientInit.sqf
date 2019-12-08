#include "script_component.hpp"

if (!hasInterface) exitWith {};

// Wait until player controls (man,vehicle or uav) a thing before compiling the menu
GVAR(controllableSelfActionsAdded) = [] call CBA_fnc_createNamespace;
DFUNC(newControllableObject) = {
    params ["_object"];
    private _type = typeOf _object;
    TRACE_2("newControllableObject",_object,_type);
    if (_type == "") exitWith {};

    if (!(GVAR(controllableSelfActionsAdded) getVariable [_type, false])) then {
        [_type] call FUNC(compileMenuSelfAction);
        GVAR(controllableSelfActionsAdded) setVariable [_type, true];
        [{
            TRACE_1("sending newControllableObject event",_this);
            // event for other systems to add self actions, running addActionToClass before this will cause compiling
            [QGVAR(newControllableObject), _this] call CBA_fnc_localEvent;
        }, [_type]] call CBA_fnc_execNextFrame; // delay event a frame to ensure postInit has run for all addons
    };
};
["unit", {[_this select 0] call FUNC(newControllableObject)}, true] call CBA_fnc_addPlayerEventHandler;
["vehicle", {[_this select 1] call FUNC(newControllableObject)}, true] call CBA_fnc_addPlayerEventHandler;
["ACE_controlledUAV", {[_this select 0] call FUNC(newControllableObject)}] call CBA_fnc_addEventHandler;


GVAR(blockDefaultActions) = [];

GVAR(cachedBuildingTypes) = [];
GVAR(cachedBuildingActionPairs) = [];

GVAR(ParsedTextCached) = [];

["ace_settingsInitialized", {
    // Setup text/shadow/size/color settings matrix
    [] call FUNC(setupTextColors);
    // Setting changed added here so color setup happens once at init
    ["ace_settingChanged", {
        params ["_name"];
        if (_name in [QGVAR(colorTextMax), QGVAR(colorTextMin), QGVAR(colorShadowMax), QGVAR(colorShadowMin), QGVAR(textSize), QGVAR(shadowSetting)]) then {
            [] call FUNC(setupTextColors);
        };
    }] call CBA_fnc_addEventHandler;
    // Install the render EH on the main display
    addMissionEventHandler ["Draw3D", {call FUNC(render)}];
}] call CBA_fnc_addEventHandler;

//Add Actions to Houses:
["ace_interactMenuOpened", {_this call FUNC(userActions_addHouseActions)}] call CBA_fnc_addEventHandler;

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


["ACE3 Common", QGVAR(InteractKey_Toggle),
format ["%1 (%2)", (localize LSTRING(InteractKey)), localize ELSTRING(common,KeybindToggle)],
{
    if (GVAR(openedMenuType) != 0) then {
        [0] call FUNC(keyDown)
    } else {
        [0,false] call FUNC(keyUp)
    };
}, {}, [-1, [false, false, false]], false] call CBA_fnc_addKeybind; // UNBOUND

["ACE3 Common", QGVAR(SelfInteractKey_Toggle),
format ["%1 (%2)", (localize LSTRING(SelfInteractKey)), localize ELSTRING(common,KeybindToggle)],
{
    if (GVAR(openedMenuType) != 1) then {
        [1] call FUNC(keyDown)
    } else {
        [1, false] call FUNC(keyUp)
    };
}, {}, [-1, [false, false, false]], false] call CBA_fnc_addKeybind; // UNBOUND


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
    params ["_menuType"];
    private _menuBackgroundSetting = [GVAR(menuBackground), GVAR(menuBackgroundSelf)] select _menuType;
    if (_menuBackgroundSetting == 1) exitWith {[QGVAR(menuBackground), true] call EFUNC(common,blurScreen);};
    if (_menuBackgroundSetting == 2) exitWith {0 cutRsc [QGVAR(menuBackground), "PLAIN", 1, false];};
}] call CBA_fnc_addEventHandler;
["ace_interactMenuClosed", {
    params ["_menuType"];
    private _menuBackgroundSetting = [GVAR(menuBackground), GVAR(menuBackgroundSelf)] select _menuType;
    if (_menuBackgroundSetting == 1) exitWith {[QGVAR(menuBackground), false] call EFUNC(common,blurScreen);};
    if (_menuBackgroundSetting == 2) exitWith {(uiNamespace getVariable [QGVAR(menuBackground), displayNull]) closeDisplay 0;};
}] call CBA_fnc_addEventHandler;
