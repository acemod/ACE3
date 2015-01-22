/**
 * fn_onInitForUnit.sqf
 * @Descr: Deprecated. Is no longer used, as we dropped init eventhandler methods.
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_handler"];
_unit = _this select 0;

if (!local _unit) exitwith {};
if !(_unit isKindOf "CAManBase") exitwith{};

_unit addEventhandler["handleDamage", {
    if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) >= 0) then {
        call FUNC(onDamage); // cache damage and pass it to handleDamage function
    };
}];

_unit addEventHandler["handleHeal", {
    if ((missionNamespace getvariable[QGVAR(setting_AdvancedLevel), 0]) >= 0) then {
        call FUNC(handleHeal)
    };
}];

["medical_onInitForUnit", [_unit]] call ace_common_fnc_localEvent;
