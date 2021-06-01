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

// Toe-Popper
class EXPLOSIVES_PLACE(m14): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_M14_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m14\vn_mine_m14_mag";
};

// Bounding Mine
class EXPLOSIVES_PLACE(m16): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_M16_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_m16_mag";
};

// Bounding Mine (Trip Wire 2m)
class EXPLOSIVES_PLACE(m16_tripwire_2m): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_M16_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_tripwire_m16_02";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0.0093, 0.088]";
        };
    };
};

// Bounding Mine (Trip Wire 4m)
class EXPLOSIVES_PLACE(m16_tripwire_4m): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_M16_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_tripwire_m16_04";
};

// F1 (Trip Wire 2m)
class EXPLOSIVES_PLACE(f1_tripwire_2m): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_F1_02_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\tripwire_f1\vn_mine_tripwire_f1_02";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0.011, 0.18]";
        };
    };
};

// F1 (Trip Wire 4m)
class EXPLOSIVES_PLACE(f1_tripwire_4m): EGVAR(Explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_F1_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\tripwire_f1\vn_mine_tripwire_f1_04";
};
