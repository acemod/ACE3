#include "..\script_component.hpp"
/*
 * Author: Jonpas, LinkIsGrim
 * Returns base attachment for CBA scripted attachment
 *
 * Arguments:
 * 0: Attachment <STRING>
 *
 * Return Value:
 * Base attachment <STRING>
 *
 * Example:
 * "CUP_optic_Elcan_SpecterDR_black_PIP" call ace_arsenal_fnc_baseAttachment
 *
 * Public: Yes
 */

params [["_item", "", [""]]];

private _nextCfg = configFile >> "CfgWeapons" >> _item;
private _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select (isText (_nextCfg >> "MRT_SwitchItemNextClass"));

while {getNumber (_nextCfg >> "scope") < 2} do {
    _nextCfg = configFile >> "CfgWeapons" >> (getText (_nextCfg >> _switchEntry));

    _switchEntry = ["MRT_SwitchItemPrevClass", "MRT_SwitchItemNextClass"] select (isText (_nextCfg >> "MRT_SwitchItemNextClass"));
};

TRACE_2("Found class",_item,configName _nextCfg);
if (getNumber (_nextCfg >> "scope") == 2) then {
    _item = configName _nextCfg;
};

_item
