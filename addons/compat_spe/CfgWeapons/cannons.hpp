// CANNON
class SPE_CannonCore;
class SPE_TankCannon_base: SPE_CannonCore {
    EGVAR(overpressure,angle) = 90;    // Cone in which the damage is applied (in degrees from the muzzle of the cannon)
    EGVAR(overpressure,range) = 50;    // Range in meters in which the damage is applied
    EGVAR(overpressure,damage) = 0.85; // Damage multiplier
    EGVAR(overpressure,priority) = 1;
};
