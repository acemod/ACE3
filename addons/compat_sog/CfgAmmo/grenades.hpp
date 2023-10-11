class vn_grenadehand;
class vn_molotov_grenade_ammo: vn_grenadehand {
    ACE_damageType = QGVAR(explosive_incendiary);
    EGVAR(frag,enabled) = 0;
};

class SmokeShell;
class vn_m14_grenade_ammo: SmokeShell {
    EGVAR(grenades,incendiary) = 1;
};
