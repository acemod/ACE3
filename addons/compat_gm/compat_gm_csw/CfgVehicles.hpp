class CfgVehicles {
    class gm_staticATGM_base;
    //// MILAN
    class gm_milan_launcher_tripod_base: gm_staticATGM_base {
        class ACE_Actions;
        class Turrets;
    };
    class gm_ge_army_milan_launcher_tripod_base: gm_milan_launcher_tripod_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
        class AnimationSources;
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class gm_ge_army_milan_launcher_tripod: gm_ge_army_milan_launcher_tripod_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "mainturret_elev";
            };
        };
        class AnimationSources: AnimationSources {
            class MainTurret_realodMagazine_source;
            class MainTurret_revolving_source;
        };
        class assembleInfo;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
            };
        };
    };
    class gm_ge_army_milan_launcher_tripod_csw: gm_ge_army_milan_launcher_tripod {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class ACE_csw_pickUp {
                    displayName = ECSTRING(csw,DisassembleCSW_displayName);
                    condition = QUOTE(call EFUNC(csw,canPickupTripod));
                    statement = QUOTE(call EFUNC(csw,assemble_pickupTripod));
                };
            };
        };
        class ace_csw {
            enabled = 1; // Enables ACE CSW for this weaponmmo handling interaction point location (custom pos)
            ammoLoadTime = 4;   // How long it takes to load rounds
            proxyWeapon = ""; // The proxy weapon created above. This can also be a function name that returns a proxy weapon - passed [_vehicle, _turret, _currentWeapon, _needed, _emptyWeapon]
            disassembleWeapon = "";  // Carryable weapon created above
            disassembleTurret = ""; // Which static tripod will appear when weapon is disassembled
            disassembleTo = QGVAR(milan_backpack); // Abuse the tripods
            magazineLocation = "[0.204429,0.696469,-0.680236]"; // Location to load magazines
            ammoUnloadTime = 6; // How long it takes in seconds to unload ammo from the weapon
            desiredAmmo = 1;  // When the weapon is reloaded it will try and reload to this ammo capacity
        };
        class AnimationSources: AnimationSources {
            class MainTurret_realodMagazine_source: MainTurret_realodMagazine_source {
                source = "reloadmagazine";
                weapon = QGVAR(milan_launcher_proxy);
            };
            class MainTurret_revolving_source: MainTurret_revolving_source {
                source = "revolving";
                weapon = QGVAR(milan_launcher_proxy);
            };
        };
        class assembleInfo: assembleInfo {
            dissasembleTo[] = {};
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {QGVAR(milan_launcher_proxy)};
                magazines[] = {};
            };
        };
        displayName = SUBCSTRING(MilanWeapon_displayName);
        displayNameShort = SUBCSTRING(MilanWeapon_displayNameShort);
    };

    //// Fagot
    class gm_fagot_launcher_tripod_base: gm_staticATGM_base {
        class ACE_Actions;
        class Turrets;
    };
    class gm_gc_army_fagot_launcher_tripod_base: gm_fagot_launcher_tripod_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
        class AnimationSources;
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    class gm_gc_army_fagot_launcher_tripod: gm_gc_army_fagot_launcher_tripod_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "mainturret_elev";
            };
        };
        class AnimationSources: AnimationSources {
            class MainTurret_realodMagazine_source;
            class MainTurret_revolving_source;
        };
        class assembleInfo;
        class Turrets: Turrets {
            class MainTurret: MainTurret {
            };
        };
    };
    class gm_gc_army_fagot_launcher_tripod_csw: gm_gc_army_fagot_launcher_tripod {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class ACE_csw_pickUp {
                    displayName = ECSTRING(csw,DisassembleCSW_displayName);
                    condition = QUOTE(call EFUNC(csw,canPickupTripod));
                    statement = QUOTE(call EFUNC(csw,assemble_pickupTripod));
                };
            };
        };
        class ACE_CSW {
            enabled = 1; // Enables ACE CSW for this weaponmmo handling interaction point location (custom pos)
            ammoLoadTime = 10;   // How long it takes in seconds
            proxyWeapon = ""; // The proxy weapon created above. This can also be a function name that returns a proxy weapon - passed [_vehicle, _turret, _currentWeapon, _needed, _emptyWeapon]
            disassembleWeapon = "";  // Carryable weapon created above
            disassembleTurret = ""; // Which static tripod will appear when weapon is disassembled
            disassembleTo = QGVAR(9k111_backpack); // Abuse the tripods
            magazineLocation = "[0,0.4,-0.7]"; // Location to load magazines
            ammoUnloadTime = 10; // How long it takes in seconds to unload ammo from the weapon
            desiredAmmo = 1;  // When the weapon is reloaded it will try and reload to this ammo capacity
        };
        class AnimationSources: AnimationSources {
            class MainTurret_realodMagazine_source: MainTurret_realodMagazine_source {
                source = "reloadmagazine";
                weapon = QGVAR(9k111_launcher_proxy);
            };
            class MainTurret_revolving_source: MainTurret_revolving_source {
                source = "revolving";
                weapon = QGVAR(9k111_launcher_proxy);
            };
        };
        class assembleInfo: assembleInfo {
            dissasembleTo[] = {};
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {QGVAR(9k111_launcher_proxy)};
                magazines[] = {};
            };
        };
        displayName = SUBCSTRING(9K111Weapon_displayName);
        displayNameShort = SUBCSTRING(9K111Weapon_displayNameShort);
    };

    // MG3 Tripod
    class StaticWeapon;
    class gm_staticWeapon_base: StaticWeapon {
        class ACE_Actions;
    };
    class gm_staticMG_base: gm_staticWeapon_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class gm_mg3_aatripod_base: gm_staticMG_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "machinegunturret_01_elev";
            };
        };
    };
    class gm_ge_army_mg3_aatripod_base: gm_mg3_aatripod_base {
        class ACE_Actions: ACE_Actions {};
    };
    class gm_ge_army_mg3_aatripod: gm_ge_army_mg3_aatripod_base {
        class ACE_Actions: ACE_Actions {};
    };
    class gm_ge_army_mg3_aatripod_csw: gm_ge_army_mg3_aatripod {
        class ACE_Actions: ACE_Actions {};
        class ACE_CSW {
            enabled = 1; // Enables ACE CSW for this weaponmmo handling interaction point location (custom pos)
            ammoLoadTime = 0.1;   // How long it takes in seconds
            proxyWeapon = ""; // The proxy weapon created above. This can also be a function name that returns a proxy weapon - passed [_vehicle, _turret, _currentWeapon, _needed, _emptyWeapon]
            disassembleWeapon = "gm_mg3_blk";  // Carryable weapon created above
            disassembleTurret = QGVAR(MG3Tripod); // Which static tripod will appear when weapon is disassembled
            magazineLocation = "_target selectionPosition 'machinegunturret_01_magazine'"; // Location to load magazines
            ammoUnloadTime = 5; // How long it takes in seconds to unload ammo from the weapon
            desiredAmmo = 120;  // When the weapon is reloaded it will try and reload to this ammo capacity
        };
        displayName = SUBCSTRING(MG3Weapon_displayName);
    };

    // MG3 Tripod
    class ThingX;
    class ace_csw_baseTripod: ThingX {
        class ACE_Actions;
    };
    class ace_csw_m3Tripod: ace_csw_baseTripod {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class GVAR(MG3Tripod): ace_csw_m3Tripod {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                selection = "machinegunturret_01_mounthide";
            };
        };
        class ACE_CSW {
            disassembleTo = QGVAR(MG3TripodCarry);
        };
        displayName = SUBCSTRING(MG3Weapon_displayName);
        editorPreview = "gm\gm_weapons\gm_machineguns\gm_mg3\data\ui\preview_gm_mg3_aatripod_base.jpg";
        icon = "\gm\gm_weapons\gm_machineguns\gm_mg3\data\ui\map_gm_mg3_aatripod_ca";
        model = "\gm\gm_weapons\gm_machineguns\gm_mg3\gm_mg3_aatripod";
        picture = "\gm\gm_weapons\gm_machineguns\gm_mg3\data\ui\picture_gm_mg3_aatripod_ca";
    };

    // Mortar
    class gm_staticMortar_base;
    class gm_m120_base: gm_staticMortar_base {
        class ace_csw {
            enabled = 1;
            magazineLocation = "";
            proxyWeapon = QGVAR(120mm_m120_proxy);
            desiredAmmo = 1;
            ammoLoadTime = 1;
            ammoUnloadTime = 3;
            allowFireOnLoad = 2;
        };
    };
    class gm_2b11_base: gm_staticMortar_base {
        class ace_csw {
            enabled = 1;
            magazineLocation = "";
            proxyWeapon = QGVAR(120mm_2b11_proxy);
            desiredAmmo = 1;
            ammoLoadTime = 1;
            ammoUnloadTime = 3;
        };
    };
};
