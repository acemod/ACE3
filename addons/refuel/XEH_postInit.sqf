#include "script_component.hpp"

["ace_unconscious", {_this call FUNC(handleUnconscious)}] call CBA_fnc_addEventHandler;
["weapon", FUNC(handlePlayerWeaponChanged)] call CBA_fnc_addPlayerEventHandler;

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect", {_this call FUNC(handleDisconnect)}];
};

[QGVAR(resetLocal), {
    _this call FUNC(resetLocal);
}] call CBA_fnc_addEventHandler;

// workaround for static fuel stations
if (hasInterface) then {
    {
        if (
            configName _x isKindOf "Building" &&
            {isClass (_x >> "ACE_Actions" >> "ACE_MainActions" >> QGVAR(Refuel))} &&
            {getNumber (_x >> "scope") == 2}
        ) then {
            TRACE_1("Compiling menu",configName _x);
            [configName _x] call EFUNC(interact_menu,compileMenu);
        };
    } count ('true' configClasses (configFile >> "CfgVehicles"));
};


#ifdef DRAW_HOOKS_POS
addMissionEventHandler ["Draw3D", {
    private _target = cursorObject;
    private _cfgPos = getArray (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(hooks));
    private _dynPos = _target getVariable [QGVAR(dev_hooks), []];
    {
        drawIcon3D ["\a3\ui_f\data\gui\cfg\hints\icon_text\group_1_ca.paa", [1,1,1,1], _target modelToWorldVisual _x, 1, 1, 0, format ["Hook %1", _forEachIndex]];
    } forEach ([_dynPos, _cfgPos] select (_dynPos isEqualTo []));
}];
#endif
