// CANNON
class SPE_CannonCore;
class SPE_TankCannon_base: SPE_CannonCore
{
    ace_overpressure_angle = 90;    // Cone in which the damage is applied (in degrees from the muzzle of the cannon)
    ace_overpressure_range = 50;    // Range in meters in which the damage is applied
    ace_overpressure_damage = 0.85; // Damage multiplier
};