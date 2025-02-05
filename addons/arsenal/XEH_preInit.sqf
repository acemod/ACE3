#include "script_component.hpp"
#include "defines.hpp"

#define TOOLS_TAB_ICON "\A3\ui_f\data\igui\cfg\actions\repair_ca.paa"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Arsenal events
[QGVAR(statsChangePage), LINKFUNC(buttonStatsPage)] call CBA_fnc_addEventHandler;
[QGVAR(displayStats), LINKFUNC(handleStats)] call CBA_fnc_addEventHandler;
[QGVAR(actionsChangePage), LINKFUNC(buttonActionsPage)] call CBA_fnc_addEventHandler;
[QGVAR(displayActions), LINKFUNC(handleActions)] call CBA_fnc_addEventHandler;

call FUNC(compileActions);
call FUNC(compileSorts);
call FUNC(compileStats);

[QUOTE(ADDON), {!isNil QGVAR(camera)}] call CBA_fnc_registerFeatureCamera;

// Compatibility with CBA scripted optics and disposable framework
[QGVAR(displayOpened), {
    "CBA_optics_arsenalOpened" call CBA_fnc_localEvent;
    "CBA_disposable_arsenalOpened" call CBA_fnc_localEvent;
    EGVAR(common,blockItemReplacement) = true;
}] call CBA_fnc_addEventHandler;

[QGVAR(displayClosed), {
    "CBA_optics_arsenalClosed" call CBA_fnc_localEvent;
    "CBA_disposable_arsenalClosed" call CBA_fnc_localEvent;
    EGVAR(common,blockItemReplacement) = false;
}] call CBA_fnc_addEventHandler;

[QGVAR(cargoChanged), {
    params ["_display"];
    // Only update actions if necessary, this can get performance-intensive using the arrow keys
    if (!GVAR(updateActionsOnCargoChange)) exitWith {};
    private _actionInfo = [_display];
    _actionInfo append GVAR(actionInfo);
    [QGVAR(displayActions), _actionInfo] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

// Setup Tools tab
[keys (uiNamespace getVariable [QGVAR(configItemsTools), createHashMap]), LLSTRING(toolsTab), TOOLS_TAB_ICON, -1, true] call FUNC(addRightPanelButton);

// TODO: make IDCs able to match IDX with simple math?
GVAR(idxMap) = createHashMapFromArray [
    [IDC_buttonPrimaryWeapon, IDX_VIRT_PRIMARY_WEAPONS],
    [IDC_buttonHandgun, IDX_VIRT_HANDGUN_WEAPONS],
    [IDC_buttonSecondaryWeapon, IDX_VIRT_SECONDARY_WEAPONS],
    [IDC_buttonHeadgear, IDX_VIRT_HEADGEAR],
    [IDC_buttonUniform, IDX_VIRT_UNIFORM],
    [IDC_buttonVest, IDX_VIRT_VEST],
    [IDC_buttonBackpack, IDX_VIRT_BACKPACK],
    [IDC_buttonGoggles, IDX_VIRT_GOGGLES],
    [IDC_buttonNVG, IDX_VIRT_NVG],
    [IDC_buttonBinoculars, IDX_VIRT_BINO],
    [IDC_buttonMap, IDX_VIRT_MAP],
    [IDC_buttonGPS, IDX_VIRT_COMMS],
    [IDC_buttonRadio, IDX_VIRT_RADIO],
    [IDC_buttonCompass, IDX_VIRT_COMPASS],
    [IDC_buttonWatch, IDX_VIRT_WATCH]
];

// Make new hashmaps for face/voice/insignia so mission makers can disable them
// Copies of hashmaps aren't final
GVAR(faceCache) = +(uiNamespace getVariable QGVAR(faceCache));
GVAR(voiceCache) = +(uiNamespace getVariable QGVAR(voiceCache));
GVAR(insigniaCache) = +(uiNamespace getVariable QGVAR(insigniaCache));

// Get mission/campaign insignias
// BIS_fnc_setUnitInsignia will look in mission config, then campaign, then global config last, so overwrite accordingly
private _insigniaCondition = toString {
    if (isNumber (_x >> "scope")) then {
        getNumber (_x >> "scope") == 2
    } else {
        true
    };
};

// Ref fnc_addListBoxItem, 0/nil = configFile, 1 = campaignConfigFile, 2 = missionConfigFile
{
    GVAR(insigniaCache) set [configName _x, 1];
} forEach (_insigniaCondition configClasses (campaignConfigFile >> "CfgUnitInsignia"));
{
    GVAR(insigniaCache) set [configName _x, 2];
} forEach (_insigniaCondition configClasses (missionConfigFile >> "CfgUnitInsignia"));

ADDON = true;
