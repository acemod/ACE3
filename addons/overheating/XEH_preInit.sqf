#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isNil "CBA_fnc_getMagazineIndex") then {
    CBA_fnc_getMagazineIndex = {
        params [["_unit", objNull, [objNull]], ["_magazine", "", [""]]];

        private _displayName = getText (configFile >> "CfgMagazines" >> _magazine >> "displayName");

        if (_displayName isEqualTo "") exitWith {[]};

        (magazinesDetail _unit select {_x find _displayName == 0}) apply {_x = _x splitString "[:]"; _x select (count _x - 1)};
    };
};

ADDON = true;
