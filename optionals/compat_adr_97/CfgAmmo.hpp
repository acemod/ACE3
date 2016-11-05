class CfgAmmo {
    class BulletBase;
    class B_570x28_Ball: BulletBase {
        ACE_caliber = 5.7;
        ACE_bulletLength = 21.6; // http://blog.thejustnation.org/2011/04/5-7x28mm-ammo-review/
        ACE_bulletMass = 2; // based on the SS190
        ACE_ballisticCoefficients[] = {0.177}; //http://m.delphiforums.com/autogun/messages/5267/7
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM"; // 50/50 chance to get it right
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {716,776};
        ACE_barrelLengths[] = {264,407};
    };
};
