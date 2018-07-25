#define ENABLE_CSW_ATTRIBUTE class Attributes { \
        class GVAR(enableCSW) { \
            property = QGVAR(enableCSW); \
            control = "Checkbox"; \
            displayName = CSTRING(eden_enableCSW); \
            tooltip = CSTRING(eden_enableCSW_tooltip); \
            expression = QUOTE(_this setVariable[ARR_3(QQGVAR(enableCSW), _value, true)];); \
            typeName = "BOOL"; \
            condition = "objectVehicle"; \
            defaultValue = true; \
        }; \
    }


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

        ace_dragging_canDrag = 1;
        ace_dragging_dragPosition[] = {0, 2, 0};
        ace_dragging_canCarry = 1;
        ace_dragging_carryPosition[] = {0, 2, 0};

        class ACE_Actions {
            class ACE_MainActions {
                displayName = CSTRING(Tripod_displayName);
                selection = "";
                distance = 2;
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
                };
            };
        };
    };
    class GVAR(m3Tripod): GVAR(baseTripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_m3_tripod.p3d);
        displayName = CSTRING(Tripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(m3CarryTripod);
        };
    };
    class GVAR(m3TripodLow): GVAR(m3Tripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_m3_tripod.p3d);
        displayName = CSTRING(Tripod_displayName);
        class ADDON {
            disassembleTo = QGVAR(m3CarryTripodLow);
        };
    };
    class GVAR(mortarBaseplate): GVAR(m3Tripod) {
        author = ECSTRING(common,ACETeam);
        scope = 2;
        model = QPATHTOEF(apl,ACE_CSW_mortarBaseplate.p3d);
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
                class EGVAR(reload,CheckAmmo) {
                    condition = "false";
                };
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
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticHMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3TripodLow); // turret [CfgVehicles]
            desiredAmmo = 100;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class HMG_01_high_base_F: HMG_01_base_F {
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticHMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 100;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class HMG_01_A_base_F: HMG_01_base_F {
        class ADDON {
            enabled = 0;
        };
    };


    class GMG_TriPod;
    class GMG_01_base_F: GMG_TriPod {
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticGMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3TripodLow); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class GMG_01_high_base_F: GMG_01_base_F {
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticGMGCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class GMG_01_A_base_F: GMG_01_base_F {
        class ADDON {
            enabled = 0;
        };
    };


    class AT_01_base_F: StaticMGWeapon {
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticATCarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };

    class AA_01_base_F: StaticMGWeapon {
        class ADDON {
            enabled = 1;
            magazineLocation = "_target selectionPosition 'magazine'";
            disassembleWeapon = QGVAR(staticAACarry); // carry weapon [CfgWeapons]
            disassembleTurret = QGVAR(m3Tripod); // turret [CfgVehicles]
            desiredAmmo = 40;
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
        };
    };


    class StaticMortar: StaticWeapon {};
    class Mortar_01_base_F: StaticMortar {
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

