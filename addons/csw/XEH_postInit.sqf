#include "script_component.hpp"

GVAR(vehicleMagCache) = createHashMap;

["CBA_settingsInitialized", {
    TRACE_3("settingsInit",GVAR(defaultAssemblyMode),GVAR(handleExtraMagazines),GVAR(ammoHandling));
    ["StaticWeapon", "Init", {
        // needs a small delay for network syncing, or we end up with duplicate mags with ammo handling
        [LINKFUNC(initVehicle), _this, 1] call CBA_fnc_waitAndExecute;
    }, true, [], true] call CBA_fnc_addClassEventHandler;

    private _vehicleClasses = [
        // AFRF
        "RHS_UAZ_DShKM_Base",
        "CUP_BTR40_MG_Base",
        "rhs_gaz66_zu23_base",
        "RHS_Ural_Zu23_Base",
        // "CUP_UAZ_METIS_Base",
        "CUP_UAZ_Base",
        "CUP_BMP2_Base",
        //"rhs_tigr_sts_vdv",

        // USAF
        "rhsusf_M1220_M2_usarmy_d",
        "rhsusf_M1230_M2_usarmy_d",
        "rhsusf_M1078A1P2_B_M2_fmtv_usarmy",
        "rhsusf_M1083A1P2_B_M2_fmtv_usarmy",
        "rhsusf_M977A4_BKIT_M2_usarmy_wd",
        "rhsusf_m1025_w_m2",
        "rhsusf_CGRCAT1A2_M2_usmc_d",
        "rhsusf_rg33_m2_d",
        "rhsusf_M1232_M2_usarmy_d",
        "rhsusf_M1237_M2_usarmy_d",
        "LOP_Offroad_M2_base",
        "LOP_M1025_M2_base",
        "rhsusf_M1084A1R_SOV_M2_D_fmtv_socom",
        "rhsusf_M1078A1R_SOV_M2_D_fmtv_socom",
        "CUP_HMMWV_SOV_Base",
        "CUP_HMMWV_SOV_M2_Base",
        "rhsusf_m966_w",
        "rhsusf_m1151_GPK_base",
        "rhsusf_MATV_OGPK_base",
        "CUP_M151_M2_Base",
        "WOG_M923a1om2",

        // BAF
        "UK3CB_BAF_LandRover_Base",
        "UK3CB_BAF_Jackal_Base",
        "UK3CB_BAF_FV432_Mk3_Base",
        "UK3CB_BAF_RHIB_Base",
        "UK3CB_BAF_Husky_Base",
        "UK3CB_BAF_Panther_Base",
        "rksla3_foxhound_lppv_base",
        
         // BW
        // "rnt_lkw_10t_mil_gl_kat_i_base",
        // "rnt_lkw_5t_mil_gl_kat_i_base",
        // "rnt_lkw_7t_mil_gl_kat_i_base",
        // "Redd_Tank_Fuchs_1A4_Base",
    
        
        //UK3CB Factions
        "UK3CB_Hilux_Base", 
        "UK3CB_Datsun_Base",
        "UK3CB_LandRover_Base",
        "UK3CB_MTLB_Zu23",
        "UK3CB_Fishing_Boat_ZU23",
        
        //Vanilla
        "Offroad_01_AT_base_F",
        "Offroad_01_armed_base_F",
        "Offroad_02_LMG_base_F",
        "Offroad_02_AT_base_F"
    ];

    {
        [_x, "init", {
            [LINKFUNC(vehiclesInit), _this, 1] call CBA_fnc_waitAndExecute;
        }, true, [], true] call CBA_fnc_addClassEventHandler;
    } forEach _vehicleClasses;
    
    GVAR(quickmountEnabled) = (
        missionNamespace getVariable [QEGVAR(quickmount,enabled), false] &&
        {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1,3]}
    );
}] call CBA_fnc_addEventHandler;

// Also triggered at mission start
["CBA_SettingChanged", {
    GVAR(quickmountEnabled) = (
        missionNamespace getVariable [QEGVAR(quickmount,enabled), false] &&
        {(missionNamespace getVariable [QEGVAR(quickmount,enableMenu), -1]) in [1,3]}
    );

    // Do not allow no ammo handling when advanced assembly is enabled
    // Reason: When using advanced assembly, the amount of ammo is not stored anywhere, so when you reassemble a static, it will spawn full ammo
    if (GVAR(defaultAssemblyMode) && GVAR(ammoHandling) == 0) then {
        if (isServer) then {
            [QGVAR(ammoHandling), 2, 2, "server"] call CBA_settings_fnc_set;
        };

        // Notify everyone about change
        [QEGVAR(common,displayTextStructured), [composeText [
            lineBreak,
            parseText format [
                "<t align='center'>%1</t>", format ["%1 requires %2 to be set higher than 0.", QGVAR(defaultAssemblyMode), QGVAR(ammoHandling)]
            ],
            lineBreak,
            parseText format ["<t align='center'>%1</t>", "No mission restart is required."]
        ], 4]] call CBA_fnc_localEvent;
    };
}] call CBA_fnc_addEventHandler;

// Event handlers:
[QGVAR(addTurretMag), LINKFUNC(reload_handleAddTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(removeTurretMag), LINKFUNC(reload_handleRemoveTurretMag)] call CBA_fnc_addEventHandler;
[QGVAR(returnAmmo), LINKFUNC(reload_handleReturnAmmo)] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
call compile preprocessFileLineNumbers QPATHTOF(dev\checkStaticWeapons.sqf);
#endif
