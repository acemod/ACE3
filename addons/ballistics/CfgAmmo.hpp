
class CfgAmmo {

    /* 6.5x39mm Grendel */

    class BulletBase;
    class B_65x39_Caseless: BulletBase {
        typicalSpeed = 724;
        airFriction = -0.000915;
    };


    /* 5.56x45mm NATO */

    class B_556x45_Ball: BulletBase {
        typicalSpeed = 911;
        airFriction = -0.001335;
    };


    /* 7.62x51mm NATO */

    class B_762x51_Ball: BulletBase {
        typicalSpeed = 853;
        //airfriction =
    };


    /* Other */

    class B_9x21_Ball;
    class B_9x19_Ball: B_9x21_Ball {
        typicalSpeed = 381;
        airfriction = -0.00213;
    };

    class B_45ACP_Ball: BulletBase {
        typicalSpeed = 250;
        airfriction = -0.0009;
    };
};
