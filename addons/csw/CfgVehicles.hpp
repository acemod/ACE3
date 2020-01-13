class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(deploy) {
                displayName = CSTRING(PlaceTripod_displayName);
                condition = QUOTE(call FUNC(assemble_canDeployTripod));
                statement = QUOTE(call FUNC(assemble_deployTripod));
                exceptions[] = {};
            };
        };
    };


    // Tripods:
    class ThingX;
    class GVAR(baseTripod): ThingX {
        side = 3;
        typicalCargo[] = {};
        armor = 500000;
        mapSize = 0.4;
        nameSound = "Bunker";
        accuracy = 1000;
        destrType = "DestructDefault";

        EGVAR(dragging,canDrag) = 1;
        EGVAR(dragging,dragPosition)[] = {0, 2, 0};
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 2, 0};

        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(genericTripod_displayName);
                selection = "";
                distance = 2.5;
                condition = "true";
                class GVAR(pickUp) {
                    displayName = CSTRING(Pickup_displayName);
                    condition = QUOTE(call FUNC(assemble_canPickupTripod));
                    statement = QUOTE(call FUNC(assemble_pickupTripod));
                };
                class GVAR(mountWeapon) {
                    displayName = CSTRING(MountWeapon_displayName);
                    condition = QUOTE(call FUNC(assemble_canDeployWeapon));
                    statement = QUOTE(call FUNC(assemble_deployWeapon));
                    modifierFunction = QUOTE(call FUNC(assemble_deployWeaponModifier));
                };
            };
        };
    };
    class GVAR(m3Tripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_m3_tripod.p3d);
        editorPreview = QPATHTOF(data\ace_csw_m3Tripod.jpg);
        displayName = CSTRING(m3Tripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(m3CarryTripod);
        };
    };
    class GVAR(m3TripodLow): GVAR(m3Tripod) {
        class ADDON {
            disassembleTo = QGVAR(m3CarryTripodLow);
        };
    };
    class GVAR(kordTripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ace_csw_tripod_kord.p3d);
        editorPreview = QPATHTOF(data\ace_csw_kordTripod.jpg);
        displayName = CSTRING(kordTripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(kordCarryTripod);
        };
    };
    class GVAR(kordTripodLow): GVAR(kordTripod) {
        class ADDON {
            disassembleTo = QGVAR(kordCarryTripodLow);
        };
    };
    class GVAR(sag30Tripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ace_csw_tripod_ags30.p3d);
        editorPreview = QPATHTOF(data\ace_csw_sag30Tripod.jpg);
        displayName = CSTRING(sag30Tripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(sag30CarryTripod);
        };
    };
    class GVAR(m220Tripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ace_csw_tripod_m220.p3d);
        editorPreview = QPATHTOF(data\ace_csw_m220Tripod.jpg);
        displayName = CSTRING(m220Tripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(m220CarryTripod);
        };
    };
    class GVAR(spg9Tripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ace_csw_tripod_spg9.p3d);
        editorPreview = QPATHTOF(data\ace_csw_spg9Tripod.jpg);
        displayName = CSTRING(spg9_Tripod);
        class ADDON {
            disassembleTo = QGVAR(spg9CarryTripod);
        };
    };
    class GVAR(mortarBaseplate): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_mortarBaseplate.p3d);
        editorPreview = QPATHTOF(data\ace_csw_mortarBaseplate.jpg);
        displayName = CSTRING(mortarBaseplate_displayName);
        class ADDON {
            disassembleTo = QGVAR(carryMortarBaseplate);
        };
    };


    // Static Weapons:
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(getIn) {
                    displayName = CSTRING(GetIn_displayName);
                    condition = QUOTE(call FUNC(canGetIn));
                    statement = QUOTE(call FUNC(getIn));
                };
            };
        };
    };

    class StaticMGWeapon: StaticWeapon {};

    class HMG_01_base_F: StaticMGWeapon {
        // ENABLE_CSW_ATTRIBUTE;
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(HMG_Static);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticHMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3TripodLow); // turret [CfgVehicles]
            desiredAmmo = 100;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class HMG_01_high_base_F: HMG_01_base_F {
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(HMG_Static);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticHMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 100;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class HMG_01_A_base_F: HMG_01_base_F {
        class ADDON {
            enabled = 0;
        };
    };


    class GMG_TriPod;
    class GMG_01_base_F: GMG_TriPod {
        // ENABLE_CSW_ATTRIBUTE;
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(GMG_20mm); // Weapon Proxy (Shorter Reload Time) [CfgWeapons]
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticGMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3TripodLow); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class GMG_01_high_base_F: GMG_01_base_F {
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(GMG_20mm); // Weapon Proxy (Shorter Reload Time) [CfgWeapons]
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticGMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
        };
    };

    class GMG_01_A_base_F: GMG_01_base_F {
        class ADDON {
            enabled = 0;
        };
    };


    class AT_01_base_F: StaticMGWeapon {
        // ENABLE_CSW_ATTRIBUTE;
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(Titan_AT_Static);
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticATCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 15; // 4 rounds per minute
            ammoUnloadTime = 10;
        };
    };

    class AA_01_base_F: StaticMGWeapon {
        // ENABLE_CSW_ATTRIBUTE;
        class ADDON {
            enabled = 1;
            proxyWeapon = QGVAR(Titan_AA_Static); // Weapon Proxy (Shorter Reload Time) [CfgWeapons]
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticAACarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 15; // 4 rounds per minute
            ammoUnloadTime = 10;
        };
    };


    class StaticMortar: StaticWeapon {};
    class Mortar_01_base_F: StaticMortar {
        // ENABLE_CSW_ATTRIBUTE;
        class ADDON {
            enabled = 1;
            magazineLocation = "";
            disassembleWeapon = QGVAR(staticMortarCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(mortarBaseplate); // turret [CfgVehicles]
            desiredAmmo = 1;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };
};

