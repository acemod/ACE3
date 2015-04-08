class CfgAmmo {
    class BulletCore;
    
    class BulletBase: BulletCore {
        timeToLive = 15;        // Default: 6, doubleplusgood all munition range.
    };

    class B_20mm : BulletBase {
        timeToLive = 30;
    };
    class B_25mm : BulletBase {
        timeToLive = 30;
    };
    class B_35mm_AA : BulletBase {
        timeToLive = 30;
    };
    class B_30mm_AP : BulletBase {
        timeToLive = 30;
    };
};