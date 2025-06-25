class vn_grenadehand;
class vn_molotov_grenade_ammo: vn_grenadehand {
    ACE_damageType = QGVAR(explosive_incendiary);
    EGVAR(frag,enabled) = 0;
    EGVAR(hearing,hearingDamageFactor) = 0;
};

class vn_t67_grenade_ammo: vn_grenadehand {
    EGVAR(grenades,rollVectorDirAndUp)[] = {{-1, 0, 0}, {0, 0, 1}};
};
class vn_chicom_grenade_ammo: vn_grenadehand {
    EGVAR(grenades,rollVectorDirAndUp)[] = {{1, 0, 0}, {0, 0, 1}};
};

class SmokeShell;
class vn_m14_grenade_ammo: SmokeShell {
    EGVAR(grenades,incendiary) = 1;
};

// 40 mm
class GrenadeBase;
class vn_40mm_he_v_ammo: GrenadeBase {
    EGVAR(rearm,caliber) = 40;
};
