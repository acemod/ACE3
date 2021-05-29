class Items_base_F;
class EGVAR(Explosives,Place): Items_base_F {
    class ACE_Actions {
        class ACE_MainActions;
    };
};

// Claymore
class EXPLOSIVES_PLACE(m18): EGVAR(Explosives,Place) {
displayName = "$STR_VN_MINE_M18_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m18\vn_mine_m18";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.15]";
        };
    };
};

// Claymore x3
class EXPLOSIVES_PLACE(m18_x3): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_M18_X3_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m18\vn_mine_m18_x3";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.1]";
        };
    };
};
