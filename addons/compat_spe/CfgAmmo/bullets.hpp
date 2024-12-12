class SPE_Bullet_Vehicle_base;

class SPE_B_127x99_Mixed: SubmunitionBase {
    ACE_caliber = 12.954;
};

class SPE_B_127x99_Ball: SPE_Bullet_Vehicle_base {
    ACE_caliber = 12.954;
};
class SPE_B_127x99_API: SPE_B_127x99_Ball {
    EGVAR(vehicle_damage,incendiary) = 1;
};
