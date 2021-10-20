
class vn_rifle;
class vn_lmg: vn_rifle {
    EGVAR(overheating,closedBolt) = 0;
};
class vn_m63a_lmg: vn_rifle {
    EGVAR(overheating,closedBolt) = 0;
};
class vn_smg: vn_rifle {
    EGVAR(overheating,closedBolt) = 0;
};
class vn_vz61: vn_smg {
    EGVAR(overheating,closedBolt) = 1;
};

class vn_mk1_udg: vn_smg {
    EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
};
class vn_m79: vn_rifle {
    EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
};
class vn_shotgun;
class vn_izh54: vn_shotgun {
    EGVAR(overheating,jamTypesAllowed)[] = {"Fire", "Dud"};
};
