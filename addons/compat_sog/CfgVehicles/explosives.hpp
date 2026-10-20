class Items_base_F;
class EGVAR(explosives,Place): Items_base_F {
    class ACE_Actions {
        class ACE_MainActions;
    };
    class EventHandlers;
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

// WP Claymore
class EXPLOSIVES_PLACE(m18_wp): EXPLOSIVES_PLACE(m18) {
    displayName = "$STR_VN_MINE_M18_WP_MAG_DN";
    model = "vn\weapons_f_vietnam_04\mines\m18\vn_mine_m18_wp";
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

// Spiked ammo box
class EXPLOSIVES_PLACE(ammobox_range): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_AMMOBOX_RANGE_MAG_DN";
    model = "\vn\objects_f_vietnam\supply\a2_ammo\pavn\vn_pavn_ammo";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.3]";
        };
    };
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
    model = "\vn\weapons_f_vietnam\mines\punji\vn_mine_punji_03";

    class EventHandlers: EventHandlers {
        class ADDON {
            init = QUOTE(call FUNC(handlePunjiTrapPlace));
        };
    };
};

// Punji door-way
class EXPLOSIVES_PLACE(punji_04): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_PUNJI_04_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\punji_02\vn_mine_punji_04_mag";
};

// Punji side whip
class EXPLOSIVES_PLACE(punji_05): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_PUNJI_05_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\punji_02\vn_mine_punji_05_mag";
};

// Bike mine
class EXPLOSIVES_PLACE(bike): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_BIKE_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\bike\vn_mine_bike_mag";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0.085, 0.185, 0.54]";
        };
    };

    class EventHandlers: EventHandlers {
        class ADDON {
            init = QUOTE(call FUNC(handleBikeMinePlace));
        };
    };
};

// Cartridge mine
class EXPLOSIVES_PLACE(cartridge): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_CARTRIDGE_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\cartridge\vn_mine_cartridge_mag";
};

// Lighter mine
class EXPLOSIVES_PLACE(lighter): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_LIGHTER_MAG_DN";
    model = "\vn\characters_f_vietnam\BLUFOR\headgear\items\vn_b_item_lighter_01";
};

// Pot mine
class EXPLOSIVES_PLACE(pot): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_POT_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\pot\vn_mine_pot_mag";
};

// Jerrycan mine
class EXPLOSIVES_PLACE(jerrycan): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_JERRYCAN_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\jerrycan\vn_mine_jerrycan_mag";

    class ACE_Actions: ACE_Actions {
        class ACE_MainActions: ACE_MainActions {
            position = "[0, 0, 0.15]";
        };
    };
};

// Mortar shell on a stick
class EXPLOSIVES_PLACE(mortar_range): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_MORTAR_RANGE_MAG_DN";
    model = "vn\static_f_vietnam\mortar_type53\vn_shell_82mm_o832d_he_mag";
};

// Limpet mine USA
class EXPLOSIVES_PLACE(limpet_01): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_LIMPET_01_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\limpet_01\vn_mine_limpet_01_mag";
};

// Limpet mine RUS
class EXPLOSIVES_PLACE(limpet_02): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_LIMPET_02_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\limpet_02\vn_mine_limpet_02_mag";
};

// Chicom NO8 mine
class EXPLOSIVES_PLACE(chicom_no8): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_CHICOM_NO8_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\no8\vn_mine_chicom_no8_mag";
};

// Dh10 mine
class EXPLOSIVES_PLACE(dh10): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_DH10_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\dh10\vn_mine_dh10_mag";
};

// Grenade board mine
class EXPLOSIVES_PLACE(gboard): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_TRIPWIRE_RGD5_04_DN";
    model = "vn\weapons_f_vietnam_03\mines\gboard\vn_mine_gboard_range_mag";
};

// Satchel charge
class EXPLOSIVES_PLACE(satchelcharge_02): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_SATCHELCHARGE_02_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\satchelcharge_02\vn_mine_satchelcharge_02_mag";
};

// Bangalore mine
class EXPLOSIVES_PLACE(bangalore): EGVAR(explosives,Place) {
    displayName = "$STR_VN_MINE_BANGALORE_MAG_DN";
    model = "vn\weapons_f_vietnam_03\mines\bangalore\vn_mine_bangalore_mag";
};
