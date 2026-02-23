class CfgVehicles {
    class UserTexture1m_F;
    class GVAR(texture1m): UserTexture1m_F {
        scope = 1;
    };
    class ACE_Module;
    class ACE_ModuleTagging: ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Tagging);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        icon = QPATHTOF(UI\Icon_Module_Tagging_ca.paa);
        class Arguments {
            class quickTag {
                displayName = CSTRING(QuickTag);
                description = CSTRING(QuickTagDesc);
                typeName = "NUMBER";
                class values {
                    class disabled {
                        name = ECSTRING(Common,Disabled);
                        value = 0;
                    };
                    class lastUsed {
                        name = CSTRING(LastUsed);
                        value = 1;
                        default = 1;
                    };
                    class randomX {
                        name = CSTRING(RandomX);
                        value = 2;
                    };
                    class random {
                        name = CSTRING(Random);
                        value = 3;
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(ModuleDesc);
        };
    };


    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Tags {
                displayName = CSTRING(Tag);
                condition = QUOTE(_player call FUNC(checkTaggable));
                statement = QUOTE(_player call FUNC(quickTag));
                icon = QPATHTOF(UI\icons\iconTaggingBlack.paa);
                insertChildren = QUOTE(_player call FUNC(addTagActions));
            };
        };
    };

    class LandVehicle;
    class Car: LandVehicle {
        GVAR(canTag) = 1;
    };
    class Tank: LandVehicle {
        GVAR(canTag) = 1;
    };
    class Air;
    class Helicopter: Air {
        GVAR(canTag) = 1;
    };

    class Item_Base_F;
    class ACE_Item_SpraypaintBlack: Item_Base_F {
        author = "jokoho48";
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SpraypaintBlack);
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlack,1);
        };
    };
    class ACE_Item_SpraypaintRed: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintRed);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintRed,1);
        };
    };
    class ACE_Item_SpraypaintGreen: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintGreen);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintGreen,1);
        };
    };
    class ACE_Item_SpraypaintBlue: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintBlue);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlue,1);
        };
    };
    class ACE_Item_SpraypaintYellow: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintYellow);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintYellow,1);
        };
    };
    class ACE_Item_SpraypaintWhite: ACE_Item_SpraypaintBlack {
        displayName = CSTRING(SpraypaintWhite);
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintWhite,1);
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpraypaintBlack,5);
            MACRO_ADDITEM(ACE_SpraypaintRed,5);
            MACRO_ADDITEM(ACE_SpraypaintBlue,5);
            MACRO_ADDITEM(ACE_SpraypaintGreen,5);
            MACRO_ADDITEM(ACE_SpraypaintYellow,5);
            MACRO_ADDITEM(ACE_SpraypaintWhite,5);
        };
    };
};
