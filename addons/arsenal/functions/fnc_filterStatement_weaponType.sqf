#include "..\script_component.hpp"
/*
 * Author: AmsteadRayle
 * Statement to filter weapons by their type, using `cursor` config value.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 * 1: Type <STRING>
 *
 * Return Value:
 * Passed filter <BOOL>
 *
 * Public: No
*/

params ["_config", "_targetType"];

private _definedTypes = ["hgun", "arifle", "srifle", "mg", "missile", "rocket"];
// "smg" and "sgun" also exist in vanilla weapons, but only a handful and are likely unused by mods

private _type = getText (_config >> "cursor");

#ifdef DEBUG_MODE_FULL
private _name = getText (_config >> "displayName");
#endif

private _return = false;
switch (true) do {
    case (_type == _targetType): {
        _return = true;
    };
    case (_targetType == "other" && {!(_type in _definedTypes)}): {
        TRACE_2("Caught by other:", _name, _type);
        _return = true;
    };
    default {
        _return = false;
    };
};
TRACE_4("Weapon filter", _name, _type, _targetType, _return);


_return
