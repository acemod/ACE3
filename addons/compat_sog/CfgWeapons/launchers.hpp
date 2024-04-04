class vn_Launcher_Base_F;
class vn_m127: vn_Launcher_Base_F {
    EGVAR(overpressure,damage) = 0;
};
class vn_rpg2: vn_Launcher_Base_F {
    EGVAR(reloadlaunchers,enabled) = 1;

    EGVAR(overpressure,angle) = 45;
    EGVAR(overpressure,offset) = 0.9;
};
class vn_rpg7: vn_Launcher_Base_F {
    EGVAR(reloadlaunchers,enabled) = 1;

    EGVAR(overpressure,angle) = 40;
    EGVAR(overpressure,offset) = 0.9;
};
class vn_sa7: vn_Launcher_Base_F {
    EGVAR(reloadlaunchers,enabled) = 1;

    EGVAR(overpressure,range) = 6;
    EGVAR(overpressure,angle) = 40;
    EGVAR(overpressure,damage) = 0.6;
    EGVAR(overpressure,offset) = 1.65;
};
