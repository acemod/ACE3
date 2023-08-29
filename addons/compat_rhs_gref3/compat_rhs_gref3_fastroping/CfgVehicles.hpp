class CfgVehicles {
    class Helicopter_Base_H;
    class rhs_uh1h_base: Helicopter_Base_H {
        EGVAR(fastroping,enabled) = 2;
        EGVAR(fastroping,friesType) = "ACE_friesAnchorBar";
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.95, -0.26};
        EGVAR(fastroping,onCut) = QEFUNC(compat_rhs_gref3,onCut);
        EGVAR(fastroping,onPrepare) = QEFUNC(compat_rhs_gref3,onPrepare);
        EGVAR(fastroping,ropeOrigins)[] = {"ropeOriginLeft", "ropeOriginRight"};
    };

    class rhs_uh1h_hidf: rhs_uh1h_base {
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };

    class rhs_uh1h_hidf_unarmed: rhs_uh1h_hidf {
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.8, -0.27};
        class UserActions {
            class Open_Side_Doors;

            class Close_Side_Doors: Open_Side_Doors {
                condition = QUOTE([ARR_2(this,'close_cargo_doors')] call EFUNC(compat_rhs_gref3,canCloseDoor));
            };
        };

        class Attributes: Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };

    class rhs_uh1h_idap: rhs_uh1h_base {
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.8, -0.27};
        class UserActions {
            class Open_Side_Doors;

            class Close_Side_Doors: Open_Side_Doors {
                condition = QUOTE([ARR_2(this,'close_cargo_doors')] call EFUNC(compat_rhs_gref3,canCloseDoor));
            };
        };
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };

    class rhs_uh1h_un: rhs_uh1h_base {
        EGVAR(fastroping,friesAttachmentPoint)[] = {0, 1.8, -0.27};
        class UserActions {
            class Open_Side_Doors;
            class Close_Side_Doors: Open_Side_Doors {
                condition = QUOTE([ARR_2(this,'close_cargo_doors')] call EFUNC(compat_rhs_gref3,canCloseDoor));
            };
        };
        class Attributes {
            EQUIP_FRIES_ATTRIBUTE;
        };
    };
};
