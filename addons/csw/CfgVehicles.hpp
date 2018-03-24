#define ENABLE_CSW_ATTRIBUTE class Attributes { \
    class GVAR(enableCSW) { \
        property = QGVAR(enableCSW); \
        control = "Checkbox"; \
        displayName = CSTRING(eden_enableCSW); \
        tooltip = CSTRING(eden_enableCSW_tooltip); \
        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(enableCSW), _value, true)];); \
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
                condition = QUOTE(_this call FUNC(canDeployTripod));
                statement = QUOTE([ARR_2({_this call FUNC(deployTripod)},_this)] call CBA_fnc_execNextFrame);
                exceptions[] = {};
            };
        };
    };
    
    class ThingX;
    class GVAR(baseTripod): ThingX {
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
                    selection = "";
                    distance = 2;
                    condition = QUOTE([ARR_2(_target,_this)] call FUNC(canPickupTripod));
                    statement = QUOTE([ARR_2(_target,_this)] call FUNC(pickupTripod));
                };
                
                class GVAR(cswMenu) {
                    displayName = CSTRING(MountWeapon_displayName);
                    distance = 2;
                    condition = QUOTE(_this call FUNC(canDeployWeapon));
                    statement = QUOTE([ARR_2({_this call FUNC(deployWeapon)},_this)] call CBA_fnc_execNextFrame);
                };
            };
        };
    };
    
    class GVAR(m3Tripod): GVAR(baseTripod) {
        class GVAR(options) { disassembleTo = QGVAR(m3CarryTripod); };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(Tripod_displayName);
            };
        };
        
        author = ECSTRING(common, ACETeam);
        scope = 2;
        side = 3;
        model = QPATHTOF(data\ACE_CSW_Tripod.p3d);
        displayName = CSTRING(Tripod_displayName);
        typicalCargo[] = {};
        armor = 500000;
        mapSize = 0.4;
        nameSound = "Bunker";
        accuracy = 1000;
        destrType = "DestructDefault";
    };
    
    // Custom config entries
    // Static Weapons
    
    // Custom Mortar entry to fix issue with disabling the "Dismantle" and "Assemble" command
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions;
        class ACE_Actions {
            class ACE_MainActions {
                class EGVAR(reload,CheckAmmo) {
                    condition = "false";
                };

                class GVAR(getIn) {
                    displayName = CSTRING(GetIn_displayName);
                    selection = "";
                    distance = 5;
                    condition = QUOTE([_target] call FUNC(canGetIn));
                    statement = QUOTE([ARR_2({_this call FUNC(getIn)},[ARR_2(_this,_target)])] call CBA_fnc_execNextFrame);
                };
                
                class GVAR(options) {
                    displayName = CSTRING(displayName);
                    selection = "";
                    distance = 2;
                    condition = QUOTE([ARR_1(_target)] call FUNC(canInteract));
                    
                    class GVAR(checkAmmo) {
                        displayName = ECSTRING(reload,checkAmmo);
                        distance = 2.0;
                        condition = QUOTE([ARR_2(_player, _target)] call EFUNC(reload,canCheckAmmo));
                        statement = QUOTE([ARR_2(_player, _target)] call EFUNC(reload,checkAmmo));
                    };
                    
                    class GVAR(disassemble) {
                        displayName = CSTRING(DisassembleCSW_displayName);
                        selection = "";
                        distance = 2;
                        condition = QUOTE([ARR_2(_target,_this)] call FUNC(canDismountWeapon));
                        statement = QUOTE([ARR_2({_this call FUNC(dismountWeapon)},[ARR_2(_target,_this)])] call CBA_fnc_execNextFrame);
                    };
                    class GVAR(loadAmmo) {
                        displayName = CSTRING(AmmoHandling_displayName);
                        distance = 2;
                        insertChildren = QUOTE((_this call FUNC(actionsLoad)) + (_this call FUNC(actionsUnload)));
                    };
                };
            };
        };
    };
    class StaticMortar: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
    };
    class Mortar_01_base_F: StaticMortar {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticMortarCarry);
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {};
        };
    };
    
    // Rest of the static weapons

    class StaticMGWeapon: StaticWeapon {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions;
        };
        class ACE_SelfActions: ACE_SelfActions {};
    };
    class AT_01_base_F: StaticMGWeapon {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticATWeapon_displayName);
                distance = 5;
            };
        };
    };
    
    class AA_01_base_F: StaticMGWeapon {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticAAWeapon_displayName);
                distance = 5;
            };
        };
    };

    class HMG_01_base_F: StaticMGWeapon {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticHMGWeapon_displayName);
                distance = 5;
            };
        };
    };

    class HMG_01_A_base_F: HMG_01_base_F {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticHMGWeapon_displayName);
                distance = 5;
            };
        };
    };
    
    class HMG_01_high_base_F: HMG_01_base_F {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticHMGWeapon_displayName);
                distance = 5;
            };
        };
    };

    class GMG_01_base_F: StaticMGWeapon {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticGMGWeapon_displayName);
                distance = 5;
            };
        };
    };
    
    class GMG_01_high_base_F: GMG_01_base_F {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticGMGWeapon_displayName);
                distance = 5;
            };
        };
    };
    
    class GMG_01_A_base_F: GMG_01_base_F {
        class Turrets {
            class MainTurret;
        };
        class ACE_SelfActions: ACE_SelfActions {};
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                displayName = CSTRING(StaticGMGWeapon_displayName);
                distance = 5;
            };
        };
    };
    
    // Define all of the default static weapons so no compatability is lost
    class B_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) { 
            enabled = 0;
            disassembleTo = QGVAR(staticATCarry);
        };
        scope = 1;
    };
    class I_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) { 
            enabled = 0;
            disassembleTo = QGVAR(staticATCarry);
        };
        scope = 1;
    };
    class O_static_AT_F: AT_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticATCarry);
        };
        scope = 1;
    };
    
    class B_static_AA_F: AA_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAACarry);
        };
        scope = 1;
    };
    class I_static_AA_F: AA_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAACarry);
        };
        scope = 1;
    };
    class O_static_AA_F: AA_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAACarry);
        };
        scope = 1;
    };
    
    class B_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGCarry);
        };
        scope = 1;
    };
    class I_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGCarry);
        };
        scope = 1;
    };
    class O_HMG_01_F: HMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGCarry);
        };
        scope = 1;
    };
    
    class B_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGTallCarry);
        };
        scope = 1;
    };
    class I_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGTallCarry);
        };
        scope = 1;
    };
    class O_HMG_01_high_F: HMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticHMGTallCarry);
        };
        scope = 1;
    };
    
    class B_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAutoHMGCarry);
        };
        scope = 1;
    };
    class I_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo =  QGVAR(staticAutoHMGCarry);
        };
        scope = 1;
    };
    class O_HMG_01_A_F: HMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo =  QGVAR(staticAutoHMGCarry);
        };
        scope = 1;
    };
    
    class B_GMG_01_F: GMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGCarry);
        };
        scope = 1;
    };
    class I_GMG_01_F: GMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGCarry);
        };
        scope = 1;
    };
    class O_GMG_01_F: GMG_01_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGCarry);
        };
        scope = 1;
    };
    
    class B_GMG_01_high_F: GMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGTallCarry);
        };
        scope = 1;
    };
    class I_GMG_01_high_F: GMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGTallCarry);
        };
        scope = 1;
    };
    class O_GMG_01_high_F: GMG_01_high_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticGMGTallCarry);
        };
        scope = 1;
    };
    
    class B_GMG_01_A_F: GMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAutoGMGCarry);
        };
        scope = 1;
    };
    class I_GMG_01_A_F: GMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAutoGMGCarry);
        };
        scope = 1;
    };
    class O_GMG_01_A_F: GMG_01_A_base_F {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class GVAR(options) {
            enabled = 0;
            disassembleTo = QGVAR(staticAutoGMGCarry);
        };
        scope = 1;
    };
    
    // Exploiting the fact that all vanilla static weapons are the same model
    class GVAR(staticATWeapon): B_static_AT_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticATCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(missiles_titan_static_AT) };
                magazines[] = { QGVAR(TitanAT_Dummy_Missile) };
            };
        };
        
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticATWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticATWeapon): GVAR(staticATWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticATWeapon): GVAR(staticATWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticATWeapon): GVAR(staticATWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticAAWeapon): B_static_AA_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticAACarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(missiles_titan_static_AA) };
                magazines[] = { QGVAR(TitanAA_Dummy_Missile) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticAAWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticAAWeapon): GVAR(staticAAWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticAAWeapon): GVAR(staticAAWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticAAWeapon): GVAR(staticAAWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticHMGWeapon): B_HMG_01_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticHMGCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(HMG_Static) };
                magazines[] = { QGVAR(HMG_Dummy_200Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticHMGWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticHMGWeapon): GVAR(staticHMGWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticHMGWeapon): GVAR(staticHMGWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticHMGWeapon): GVAR(staticHMGWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticAutoHMGWeapon): B_HMG_01_A_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticAutoHMGCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(HMG_Static) };
                magazines[] = { QGVAR(HMG_Dummy_200Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticAutoHMGWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticAutoHMGWeapon): GVAR(staticAutoHMGWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticAutoHMGWeapon): GVAR(staticAutoHMGWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticAutoHMGWeapon): GVAR(staticAutoHMGWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticHMGTallWeapon): B_HMG_01_high_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticHMGTallCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(HMG_Static) };
                magazines[] = { QGVAR(HMG_Dummy_200Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticHMGTallWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticHMGTallWeapon): GVAR(staticHMGTallWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticHMGTallWeapon): GVAR(staticHMGTallWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticHMGTallWeapon): GVAR(staticHMGTallWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticGMGWeapon): B_GMG_01_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticGMGCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(GMG_20mm) };
                magazines[] = { QGVAR(GMG_Dummy_120Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticGMGWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticGMGWeapon): GVAR(staticGMGWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticGMGWeapon): GVAR(staticGMGWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticGMGWeapon): GVAR(staticGMGWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticAutoGMGWeapon): B_GMG_01_A_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticAutoGMGCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(GMG_20mm) };
                magazines[] = { QGVAR(GMG_Dummy_120Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 1;
        side = 3;
        displayName = CSTRING(StaticAutoGMGWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticAutoGMGWeapon): GVAR(staticAutoGMGWeapon) { side = 1; scope = 2; };
    class GVAR(I_staticAutoGMGWeapon): GVAR(staticAutoGMGWeapon) { side = 2; scope = 2; };
    class GVAR(O_staticAutoGMGWeapon): GVAR(staticAutoGMGWeapon) { side = 0; scope = 2; };
    
    class GVAR(staticGMGTallWeapon): B_GMG_01_high_F {
        class GVAR(options) {
            enabled = 1;
            disassembleTo = QGVAR(staticGMGTallCarry);
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = { QGVAR(GMG_20mm) };
                magazines[] = { QGVAR(GMG_Dummy_120Rnd_mag) };
            };
        };
        author = ECSTRING(common, ACETeam);
        scope = 2;
        side = 3;
        displayName = CSTRING(StaticGMGTallWeapon_displayName);
        ENABLE_CSW_ATTRIBUTE;
    };
    class GVAR(B_staticGMGTallWeapon): GVAR(staticGMGTallWeapon) { side = 1; };
    class GVAR(I_staticGMGTallWeapon): GVAR(staticGMGTallWeapon) { side = 2; };
    class GVAR(O_staticGMGTallWeapon): GVAR(staticGMGTallWeapon) { side = 0; };
    
    // Backpacks
    class Weapon_Bag_Base;
    
    // Defaults (Disabling Scope)
    class B_AT_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticATWeapon); };
        scope = 1;
    };
    class I_AT_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticATWeapon); };
        scope = 1;
    };
    class O_AT_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticATWeapon); };
        scope = 1;
    };
    
    class B_AA_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAAWeapon); };
        scope = 1;
    };
    class I_AA_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAAWeapon); };
        scope = 1;
    };
    class O_AA_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAAWeapon); };
        scope = 1;
    };
    
    class B_HMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGWeapon); };
        scope = 1;
    };
    class I_HMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGWeapon); };
        scope = 1;
    };
    class O_HMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGWeapon); };
        scope = 1;
    };
    
    class B_HMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoHMGWeapon); };
        scope = 1;
    };
    class I_HMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoHMGWeapon); };
        scope = 1;
    };
    class O_HMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoHMGWeapon); };
        scope = 1;
    };
    
    class B_HMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGTallWeapon); };
        scope = 1;
    };
    class I_HMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGTallWeapon); };
        scope = 1;
    };
    class O_HMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticHMGTallWeapon); };
        scope = 1;
    };
    
    class B_GMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGWeapon); };
        scope = 1;
    };
    class I_GMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGWeapon); };
        scope = 1;
    };
    class O_GMG_01_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGWeapon); };
        scope = 1;
    };
    
    class B_GMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoGMGWeapon); };
        scope = 1;
    };
    class I_GMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoGMGWeapon); };
        scope = 1;
    };
    class O_GMG_01_A_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticAutoGMGWeapon); };
        scope = 1;
    };
    
    class B_GMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGTallWeapon); };
        scope = 1;
    };
    class I_GMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGTallWeapon); };
        scope = 1;
    };
    class O_GMG_01_high_weapon_F: Weapon_Bag_Base {
        class GVAR(options) { ace_csw_assembleTo = QGVAR(staticGMGTallWeapon); };
        scope = 1;
    };
};

