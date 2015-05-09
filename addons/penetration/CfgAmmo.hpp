class CfgAmmo {
    class BulletCore;
    class ShellCore;

    // By default, lets assume uranium shells
    class ShellBase: ShellCore {
    };
    
    class Sh_120mm_APFSDS: ShellBase {
        /*
        enum class PROJECTILE_TYPE {
            CYLINDER = 1,   // This also uses long rod calcs, but for a cylinder default. ignores frustrum lengths
            FRUSTUM = 2,    // This is long rod, but working length changes
            MISSILE = 3,    // These will most likely be a hybrid of rod projected kenetic rounds
            SHELL = 4,     // If L:D ratio is < 4, you need to use this math instead, long rods are best-estimate only for KE of a rod.
            FRAGMENT = 5    // Used for irregularly shaped model impacts, such as ace_frag
        };*/
        ACE_projectileType = 2;
        

        ACE_bulletLength = 0.0650;     // meter
        GVAR(length) = 0.0650;      // meter, used if defined  for penetrator, otherwise falls back on bulletLength

        ACE_caliber = 0.027;      // meter, fallback dimeter used by AB
        GVAR(diameter) = 0.027;     // meters, used if defined for penetrator, otherwise falls back on bulletDiameter 
        
        ACE_bulletMass = 4600;       // gram
        GVAR(mass) = 4600;          // grams, used if defined for penetrator, otherwise falls back on bulletMass

        ACE_materialType = 2;            // 0=tungsten,1=DU,2=hard steel alloy
        // Below densities are only used to override materialType, 
        // OPTIONALS
        ACE_materialDensity = 19100;    
        GVAR(density) = 19100;      // kg/m3  used if defined for penetrator, otherwise falls back on ACE_materialDensity
        
        // This is ony used if defined, otherwise it is assumed the round is a cylinder
        GVAR(frustumLength) = 0.05;     // meter
        GVAR(frustumDiameter) = 0.01;   // meter
    };
    
    class BulletBase: BulletCore {
        ACE_bulletDensity = 11300;  // 11.3g/cm3 or 11300kg/m3, this is the density of lead
    };

};