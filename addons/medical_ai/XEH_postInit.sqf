#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_2("settingsInitialized",GVAR(enabledFor),GETEGVAR(medical,enabled,false));

    if (GVAR(enabledFor) == 0 || {!(GETEGVAR(medical,enabled,false))}) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    // default time values for AI being ready to heal, used in fnc_isSafe
    if (isNil QGVAR(timeSafe_shoot)) then { GVAR(timeSafe_shoot) = 30; };
    if (isNil QGVAR(timeSafe_hit)) then { GVAR(timeSafe_hit) = 30; };
    if (isNil QGVAR(timeSafe_suppressed)) then { GVAR(timeSafe_suppressed) = 30; };

    GVAR(itemHash) = uiNamespace getVariable QGVAR(itemHash);

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    ["CAManBase", "Hit", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastHit), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    ["CAManBase", "Suppressed", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastSuppressed), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    // Add command actions to command AI medics to treat other units
    call FUNC(addHealingCommandActions);

    if (GVAR(requireItems) == 2) then {
        ["CAManBase", "InitPost", {
            [{
                params ["_unit"];
                if ((!local _unit) || {!alive _unit} || {isPlayer _unit}) exitWith {};
                TRACE_2("replacing medical items on AI",_unit,typeOf _unit);
                [_unit] call EFUNC(common,replaceRegisteredItems);
            }, _this] call CBA_fnc_execNextFrame; // need to delay a frame before modifying items in a backpack
        }, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;
    };

    #include "stateMachine.inc.sqf"
}] call CBA_fnc_addEventHandler;
