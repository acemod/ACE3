class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportWeapons {
            MACRO_ADDWEAPON(ACE_VMM3,4);
            MACRO_ADDWEAPON(ACE_VMH3,4);
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(metalDetector) {
                    displayName = CSTRING(MetalDetector);
                    condition = QUOTE(_player call FUNC(hasDetector));
                    statement = "";
                    icon = QPATHTOF(ui\icon_mineDetector.paa);
                    exceptions[] = {};
                    class GVAR(activate) {
                        displayName = CSTRING(ActivateDetector);
                        condition = QUOTE(_player call FUNC(canActivateDetector));
                        statement = QUOTE(_player call FUNC(activateDetector));
                        icon = QPATHTOF(ui\icon_mineDetectorOn.paa);
                        exceptions[] = {};
                    };
                    class GVAR(deactivate) {
                        displayName = CSTRING(DeactivateDetector);
                        condition = QUOTE(_player call FUNC(canDeactivateDetector));
                        statement = QUOTE(_player call FUNC(deactivateDetector));
                        icon = QPATHTOF(ui\icon_mineDetectorOff.paa);
                        exceptions[] = {};
                    };
                    class GVAR(connectHeadphones) {
                        displayName = CSTRING(ConnectHeadphones);
                        condition = QUOTE(_player call FUNC(canConnectHeadphones));
                        statement = QUOTE([ARR_2(_player,true)] call FUNC(connectHeadphones));
                        icon = ""; //TODO
                        exceptions[] = {};
                    };
                    class GVAR(disconnectHeadphones) {
                        displayName = CSTRING(DisconnectHeadphones);
                        condition = QUOTE(_player call FUNC(canDisconnectHeadphones));
                        statement = QUOTE([ARR_2(_player,false)] call FUNC(connectHeadphones));
                        icon = ""; //TODO
                        exceptions[] = {};
                    };
                };
            };
        };
    };

    class Items_base_F;
    class ACE_Explosives_Place: Items_base_F {
        GVAR(detectable) = 1;
    };

    // Editor placed mines
    class Static;
    class MineGeneric: Static {
        GVAR(detectable) = 1;
    };

    // Zeus placed mines
    class ModuleEmpty_F;
    class ModuleMine_F: ModuleEmpty_F {
        GVAR(detectable) = 1;
    };
};
