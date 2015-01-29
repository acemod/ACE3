#include "script_component.hpp"

ADDON = false;
LOG(MSG_INIT);

PREP(addAction);

[QGVAR(wh), {player reveal _this}] call CBA_fnc_addEventHandler;
[QGVAR(action), {_this call FUNC(addaction)}] call CBA_fnc_addEventhandler;

[["LandVehicle","Air","Boat","Thing","StaticWeapon","Reammobox"], [ace_sys_interaction_key], 6, [QPATHTO_F(fnc_menuDef), "main"]] call CBA_ui_fnc_add;

ADDON = true;
