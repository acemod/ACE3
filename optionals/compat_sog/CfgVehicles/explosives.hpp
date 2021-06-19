class Items_base_F;
class EGVAR(explosives,Place): Items_base_F {
    class ACE_Actions {
        class ACE_MainActions;
    };
};

// Claymore
class EXPLOSIVES_PLACE(m18): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M18_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m18\vn_mine_m18";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.15]";
        };
    };
};

// Claymore x3
class EXPLOSIVES_PLACE(m18_x3): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M18_X3_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m18\vn_mine_m18_x3";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.1]";
        };
    };
};

// Toe-Popper
class EXPLOSIVES_PLACE(m14): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M14_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m14\vn_mine_m14_mag";
};

// Bounding Mine
class EXPLOSIVES_PLACE(m16): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M16_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_m16_mag";
};

// Bounding Mine (Trip Wire 2m)
class EXPLOSIVES_PLACE(m16_tripwire_2m): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_M16_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_tripwire_m16_02";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0.0093, 0.088]";
        };
    };
};
// Bounding Mine (Trip Wire 4m)
class EXPLOSIVES_PLACE(m16_tripwire_4m): EXPLOSIVES_PLACE(m16_tripwire_2m) {
    displayName = "$STR_VN_MINE_TRIPWIRE_M16_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m16\vn_mine_tripwire_m16_04";
};

// F1 (Trip Wire 2m)
class EXPLOSIVES_PLACE(f1_tripwire_2m): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_F1_02_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\tripwire_f1\vn_mine_tripwire_f1_02";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0.011, 0.18]";
        };
    };
};
// F1 (Trip Wire 4m)
class EXPLOSIVES_PLACE(f1_tripwire_4m): EXPLOSIVES_PLACE(f1_tripwire_2m) {
    displayName = "$STR_VN_MINE_TRIPWIRE_F1_04_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\tripwire_f1\vn_mine_tripwire_f1_04";
};

// Arty Shell (Trip Wire 4m)
class EXPLOSIVES_PLACE(arty_tripwire_4m): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_ARTY_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\tripwire_arty\vn_mine_tripwire_arty";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0.01, 0.126]";
        };
    };
};

// Satchel Charge
class EXPLOSIVES_PLACE(satchel_remote_02): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_SATCHEL_REMOTE_02_MAG_DN";
    model = "\vn\characters_f_vietnam\OPFOR\vests\items\vn_mine_satchel_02.p3d";
};

// TM57 Anti-Tank Mine
class EXPLOSIVES_PLACE(tm57): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_TM57_MAG_DN";
    model = "vn\weapons_f_vietnam\mines\tm57\vn_mine_tm57_mag";
};

// M15 Anti-Tank Mine
class EXPLOSIVES_PLACE(m15): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M15_MAG_DN";
    model = "vn\weapons_f_vietnam\mines\m15\vn_mine_m15_mag";
};

// M112 Breaching charge
class EXPLOSIVES_PLACE(m112): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_M112_REMOTE_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\m112\vn_mine_m112_mag";
};

// Punji large
class EXPLOSIVES_PLACE(punji_01): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_PUNJI_01_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\punji\vn_mine_punji_01_mag";
};

// Punji small
class EXPLOSIVES_PLACE(punji_02): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_PUNJI_01_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\punji\vn_mine_punji_02_mag";
};

// Punji whip
class EXPLOSIVES_PLACE(punji_03): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_PUNJI_01_MAG_DN";
    model = "\vn\weapons_f_vietnam\mines\punji\vn_mine_punji_03_mag";
};
