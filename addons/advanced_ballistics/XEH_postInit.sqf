#include "script_component.hpp"

GVAR(currentbulletID) = -1;

GVAR(Protractor) = false;
GVAR(ProtractorStart) = CBA_missionTime;
GVAR(allBullets) = [];
GVAR(currentGrid) = 0;

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

["CBA_settingsInitialized", {
    //If not enabled, dont't add PFEH
    if (!GVAR(enabled)) exitWith {};

    //Run the terrain processor
    [] call FUNC(initializeTerrainExtension);

    // Register fire event handler
    ["ace_firedPlayer", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;
    ["ace_firedPlayerNonLocal", LINKFUNC(handleFired)] call CBA_fnc_addEventHandler;

    // Register Perframe Handler
    [LINKFUNC(handleFirePFH), GVAR(simulationInterval)] call CBA_fnc_addPerFrameHandler;

    //Add warnings for missing compat PBOs (only if AB is on)
    {
        _x params ["_modPBO", "_compatPBO"];
        if ([_modPBO] call EFUNC(common,isModLoaded) && {!([_compatPBO] call EFUNC(common,isModLoaded))}) then {
            WARNING_2("Weapon Mod [%1] missing ace compat pbo [%2] (from @ace\optionals)",_modPBO,_compatPBO);
        };
    } forEach [
        ["RH_acc","ace_compat_rh_acc"],
        ["RH_de_cfg","ace_compat_rh_de"],
        ["RH_m4_cfg","ace_compat_rh_m4"],
        ["RH_PDW","ace_compat_rh_pdw"],
        ["RKSL_PMII","ace_compat_rksl_pm_ii"],
        ["iansky_opt","ace_compat_sma3_iansky"],
        ["R3F_Armes","ace_compat_r3f"]
    ];
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
    call FUNC(diagnoseWeapons);
#endif
