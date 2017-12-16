#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// init marker types
if (isNil QGVAR(MarkersCache)) then {
    GVAR(MarkersCache) = [];

    private _config = configfile >> "CfgMarkers";

    for "_a" from 0 to (count _config - 1) do {
        private _marker = _config select _a;

        if (getNumber (_marker >> "scope") == 2) then {
            private _name = getText (_marker >> "name");
            private _icon = getText (_marker >> "icon");

            GVAR(MarkersCache) pushBack [_name, _a, _icon];
        };
    };
};

// init marker colors
if (isNil QGVAR(MarkerColorsCache)) then {
    GVAR(MarkerColorsCache) = [];

    private _config = configfile >> "CfgMarkerColors";

    for "_a" from 0 to (count _config - 1) do {
        private _marker = _config select _a;

        if (getNumber (_marker >> "scope") == 2) then {
            private _name = getText (_marker >> "name");
            private _rgba = getArray (_marker >> "color");

            {
                if !( _x isEqualType 0) then {
                    _rgba set [_forEachIndex, call compile _x];
                };
            } forEach _rgba;

            _rgba params ["_red", "_green", "_blue", "_alpha"];
            private _icon = format ["#(argb,8,8,3)color(%1,%2,%3,%4)", _red, _green, _blue, _alpha];

            GVAR(MarkerColorsCache) pushBack [_name, _a, _icon];
        };
    };
};

//Server Sync JIP markers:
[QGVAR(sendMarkersJIP), FUNC(sendMarkersJIP)] call CBA_fnc_addEventHandler;

/*
class ACE_Settings {
    class GVAR(movableMarkersEnabled) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "BOOL";
        displayName = CSTRING(MovableMarkers_DisplayName);
        description = CSTRING(MovableMarkers_Description);
    };
    class GVAR(moveRestriction) {
        category = CSTRING(Module_DisplayName);
        value = 0;
        typeName = "SCALAR";
        displayName = CSTRING(MoveRestriction_DisplayName);
        description = CSTRING(MoveRestriction_Description);
        values[] = {CSTRING(MoveRestriction_All), CSTRING(MoveRestriction_Admins), CSTRING(MoveRestriction_GroupLeaders), CSTRING(MoveRestriction_GroupLeadersAndAdmins)};
    };
};
ECSTRING(common,disabled)
*/

ADDON = true;
