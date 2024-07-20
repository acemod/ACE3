private _categoryArray = [ELSTRING(medical,Category), "STR_TEAM_SWITCH_AI"];

[
    QGVAR(enabledFor), "LIST",
    [LLSTRING(enableFor_title), LLSTRING(enableFor_desc)],
    _categoryArray,
    [
        [0, 1, 2],
        [LELSTRING(Common,Disabled), LLSTRING(enabledFor_OnlyServerAndHC), LELSTRING(Common,Enabled)],
        2
    ],
    true, // isGlobal
    {[QGVAR(enabledFor), _this] call EFUNC(common,cbaSettings_settingChanged)},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(requireItems), "LIST",
    [LSTRING(requireItems_title), LSTRING(requireItems_desc)],
    _categoryArray,
    [
        [0, 1, 2],
        [LELSTRING(Common,Disabled), LELSTRING(Common,Enabled), format ["%1 - %2", LELSTRING(Common,Enabled), LLSTRING(requireItems_autoReplaceItems)]],
        0
    ],
    true, // isGlobal
    {
        if (GVAR(requireItems) != 2) exitWith {};
        ["CAManBase", "initPost", {
            [{
                params ["_unit"];
                if ((!local _unit) || {!alive _unit} || {isPlayer _unit}) exitWith {};
                TRACE_2("replacing medical items on AI",_unit,typeOf _unit);
                [_unit] call EFUNC(common,replaceRegisteredItems);
            }, _this] call CBA_fnc_execNextFrame; // need to delay a frame before modifying items in a backpack 
        }, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;
    },
    true // Needs mission restart
] call CBA_fnc_addSetting;
