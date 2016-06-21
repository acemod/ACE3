class CfgVehicles {
    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_VMM3,4);
            MACRO_ADDITEM(ACE_VMH3,4);
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(activate) {
                    displayName = CSTRING(ActivateDetector);
                    condition = QUOTE(call FUNC(canActivateDetector));
                    statement = QUOTE(call FUNC(activateDetector));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QPATHTOF(ui\icon_mineDetectorOn.paa);
                    exceptions[] = {};
                };
                class GVAR(deactivate) {
                    displayName = CSTRING(DeactivateDetector);
                    condition = QUOTE(call FUNC(canDeactivateDetector));
                    statement = QUOTE(call FUNC(deactivateDetector));
                    showDisabled = 0;
                    priority = 0.1;
                    icon = QPATHTOF(ui\icon_mineDetectorOff.paa);
                    exceptions[] = {};
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
