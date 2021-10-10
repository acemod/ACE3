#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets a non-ambigious display name for a magazine using displayNameShort (AP/HE)
 *
 * Arguments:
 * 0: Magazine Classname <STRING>
 *
 * Return Value:
 * Display Name <STRING>
 *
 * Example:
 * ["B_20mm_AP"] call ace_rearm_fnc_getMagazineName
 *
 * Public: No
 */

params ["_className"];
TRACE_1("getMagazineName",_className);

private _magName = GVAR(magazineNameCache) getVariable _className;
if (isNil "_magName") then {
    private _displayName = getText(configFile >> "CfgMagazines" >> _className >> "displayName");
    if (_displayName == "") then {
        _displayName = _className;
        WARNING_1("Magazine is missing display name [%1]",_className);
    };

    if ((_displayName select [0,6]) == "[CSW] ") then { _displayName = _displayName select [6]; };

    GVAR(magazineNameCache) setVariable [_className, _displayName];
    GVAR(originalMagazineNames) pushBack _displayName;
    TRACE_2("Adding to cache",_className,_displayName);

    // go through all existing cache entries and update if there now are duplicates
    {
        private _xMagName = GVAR(magazineNameCache) getVariable _x;
        if ((_xMagName == _displayName) && {({_xMagName == _x} count GVAR(originalMagazineNames)) > 1}) then {
            private _xMagName = format ["%1: %2", _displayName, getText(configFile >> "CfgMagazines" >> _x >> "displayNameShort")];
            GVAR(magazineNameCache) setVariable [_x, _xMagName];
            TRACE_2("Using unique name",_x,_xMagName);
        };
    } forEach (allVariables GVAR(magazineNameCache));

    _magName = GVAR(magazineNameCache) getVariable _className;
};

_magName
