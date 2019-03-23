
// weapon config changes, by commy2

/* documentation:
aiRateOfFire = 5.0              Delay between shots at given aiRateOfFireDistance.
aiRateOfFireDistance = 500      At shorter distance delay (aiRateOfFire) goes linearly to zero.
*/

class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {

    // rifles
    class Rifle_Base_F;
    class Rifle_Short_Base_F;
    class Rifle_Long_Base_F;

    // MX
    class arifle_MX_Base_F: Rifle_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.5;
            midRange = 300;       // 200;
            midRangeProbab = 0.5; // 0.7;
        };

        class FullAuto;
        class fullauto_medium: FullAuto {
            minRange = 20;        // 2;
            burst = "3 + round random 5"; //3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: Single {
            aiRateOfFireDistance = 700; // 600;
            minRange = 120;             // 2;
            maxRange = 700;             // 600;
        };

        class single_far_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 900; // 700;
            minRange = 200;             // 100;
            maxRange = 900;             // 700;
        };
    };

    // MX carbine
    class arifle_MXC_F: arifle_MX_Base_F {

        class Single: Single {
            minRange = 120;       // 2;
            minRangeProbab = 0.5; // 0.3;
            midRange = 250;       // 150;
            midRangeProbab = 0.3; // 0.5;
        };

        class FullAuto;
        class fullauto_medium: fullauto_medium {
            minRange = 20;       // 2;
            burst = "3 + round random 5"; //3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 400;
            minRange = 300;
            minRangeProbab = 0.1;
            midRange = 400;
            midRangeProbab = 0.2;
            maxRange = 500;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: single_medium_optics1 {
            aiRateOfFireDistance = 600; // 500;
            minRange = 120;             // 2;
            maxRange = 600;             // 500;
        };

        class single_far_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 800; // 700;
            minRange = 200;             // 100;
            maxRange = 800;             // 700;
        };
    };

    //class arifle_MX_F: arifle_MX_Base_F {};
    //class arifle_MX_GL_F: arifle_MX_Base_F {};

    // MX sniper rifle
    class arifle_MXM_F: arifle_MX_Base_F {
        class Single: Single {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.5;
            midRange = 350;       // 250;
            midRangeProbab = 0.5; // 0.7;
        };

        class fullauto_medium: fullauto_medium {
            minRange = 20;        // 2;
            burst = "3 + round random 5"; //3;
        };

        class single_medium_optics1: single_medium_optics1 {
            aiRateOfFireDistance = 700; // 600;
            minRange = 120;             // 2;
            maxRange = 750;             // 650;
        };

        class single_far_optics2: single_far_optics2 {
            aiRateOfFireDistance = 900; // 800;
            minRange = 200;             // 100;
            maxRange = 900;             // 800;
        };
    };

    // MX machine gun
    class arifle_MX_SW_F: arifle_MX_Base_F {
        // Shit is still broken
        //modes[] += {"ACE_Burst_far"};
        modes[] = {"Single","manual","close","short","medium","far_optic1","far_optic2","ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;             // 2;
        };

        class close;
        class medium;
        class ACE_Burst_far: medium {
            aiRateOfFire = 6.0;
            aiRateOfFireDistance = 900;
            minRange = 500;
            minRangeProbab = 0.1;
            midRange = 700;
            midRangeProbab = 0.2;
            maxRange = 900;
            maxRangeProbab = 0.2;
            burst = "3 + round random 5";
        };

        class far_optic1: close {
            aiRateOfFireDistance = 750; // 650;
            maxRange = 750;             // 650;
        };

        class far_optic2: far_optic1 {
            maxRange = 1100;            // 900;
            aiRateOfFireDistance = 1100;// 900;
        };
    };

    // Katiba
    class arifle_Katiba_Base_F: Rifle_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.5;
            midRange = 300;       // 200;
            midRangeProbab = 0.5; // 0.7;
        };

        class FullAuto;
        class fullauto_medium: FullAuto {
            minRange = 20;       // 2;
            burst = "3 + round random 5"; //3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: Single {
            aiRateOfFireDistance = 700; // 600;
            minRange = 120;             // 2;
            maxRange = 700;             // 600;
        };

        class single_far_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 900; // 800;
            minRange = 200;             // 100;
            maxRange = 900;             // 800;
        };
    };

    // Katiba carbine
    class arifle_Katiba_C_F: arifle_Katiba_Base_F {

        class Single: Single {
            minRange = 120;       // 2;
            minRangeProbab = 0.5; // 0.3;
            midRange = 250;       // 150;
            midRangeProbab = 0.3; // 0.7;
        };

        //class FullAuto: FullAuto {};

        class fullauto_medium: fullauto_medium {
            minRange = 20;       // 2;
            maxRange = 150;      //100;
            burst = "3 + round random 5"; //3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 400;
            minRange = 300;
            minRangeProbab = 0.1;
            midRange = 400;
            midRangeProbab = 0.2;
            maxRange = 500;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: single_medium_optics1 {
            minRange = 120;     // 2;
            maxRange = 600;     // 500;
        };

        class single_medium_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 800; // 700;
            minRange = 200;             // 100;
            maxRange = 800;             // 700;
        };
    };

    // F2002
    class mk20_base_F: Rifle_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.5;
            midRange = 250;       // 150;
            midRangeProbab = 0.5; // 0.7;
        };

        class FullAuto: Mode_FullAuto {
            minRange = 0; //2;
        };

        class fullauto_medium: FullAuto {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: Single {
            aiRateOfFireDistance = 600; // 500;
            minRange = 120;             // 5;
            maxRange = 600;             // 500;
        };

        class single_far_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 800; // 700;
            minRange = 200;             // 100;
            maxRange = 800;             // 700;
        };
    };

    // F2002 carbine
    class arifle_Mk20C_F: mk20_base_F {

        class Single: Single {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.5;
            midRange = 250;       // 150;
            midRangeProbab = 0.5; // 0.7;
            maxRange = 350;       // 250;
        };

        class FullAuto: FullAuto {
            minRange = 0; //2;
        };

        class single_medium_optics1: single_medium_optics1 {
            aiRateOfFireDistance = 600; // 500;
            minRange = 120;             // 5;
            maxRange = 550;             // 450;
        };

        //class single_medium_optics2: single_medium_optics1 {};
        class fullauto_medium: fullauto_medium {
            minRange = 20;                //2;
            burst = "3 + round random 5"; //3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 400;
            minRange = 300;
            minRangeProbab = 0.1;
            midRange = 400;
            midRangeProbab = 0.2;
            maxRange = 500;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };
    };

    // TAR-20
    class Tavor_base_F: Rifle_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       //2;
            minRangeProbab = 0.7; //0.5;
            midRange = 250;       //150;
            midRangeProbab = 0.5; //0.7;
            maxRange = 350;       //250;
        };

        class FullAuto: Mode_FullAuto {
            minRange = 0; //2;
        };

        class fullauto_medium: FullAuto {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 400;
            minRange = 300;
            minRangeProbab = 0.1;
            midRange = 400;
            midRangeProbab = 0.2;
            maxRange = 500;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: Single {
            aiRateOfFireDistance = 600; // 500;
            minRange = 120;             // 5;
            maxRange = 550;             // 450;
        };

        class single_medium_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 700; // 600;
            minRange = 200;             // 100;
            maxRange = 700;             // 600;
        };
    };

    // TAR-21
    class arifle_TRG21_F: Tavor_base_F {

        class Single: Single {
            minRange = 120;        // 2;
            minRangeProbab = 0.7;  // 0.3;
            midRange = 300;        // 200;
            midRangeProbab = 0.5;  // 0.7;
            maxRange = 400;        // 300;
        };

        class FullAuto: FullAuto {
            minRange = 0; //2;
        };

        class fullauto_medium: fullauto_medium {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 400;
            minRange = 300;
            minRangeProbab = 0.1;
            midRange = 400;
            midRangeProbab = 0.2;
            maxRange = 500;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };

        class single_medium_optics1: single_medium_optics1 {
            aiRateOfFireDistance = 700; // 600;
            minRange = 120;             // 2;
            maxRange = 600;             // 500;
        };

        class single_medium_optics2: single_medium_optics1 {
            aiRateOfFireDistance = 800; // 700;
            minRange = 200;             // 100;
            maxRange = 800;             // 700;
        };
    };

    // sub machine guns

    // SDAR
    class SDAR_base_F: Rifle_Base_F {

        class Single: Mode_SemiAuto {
            minRange = 10;  //2;
        };

        class Burst: Mode_Burst {
            minRange = 5;   //1;
        };
    };

    // PD2000
    class pdw2000_base_F: Rifle_Short_Base_F {

        class Single: Mode_SemiAuto {
            minRange = 100; //2;
        };

        class Burst: Mode_Burst {
            minRange = 50;  //1;
        };
    };

    // Vector
    class SMG_01_Base: Rifle_Short_Base_F {

        class Single: Mode_SemiAuto {
            minRange = 50;  //2;
        };

        class Burst: Mode_Burst {
            minRange = 25;  //2;
        };
    };

    // Scorpion EVO
    class SMG_02_base_F: Rifle_Short_Base_F  {

        class Single: Mode_SemiAuto {
            minRange = 50;  //2;
        };

        class Burst: Mode_Burst {
            minRange = 25;  //2;
        };
    };

    // machine guns

    // Stoner
    class LMG_Mk200_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class medium;
        class ACE_Burst_far: medium {
            aiRateOfFire = 6.0;
            aiRateOfFireDistance = 900;
            minRange = 500;
            minRangeProbab = 0.1;
            midRange = 700;
            midRangeProbab = 0.2;
            maxRange = 900;
            maxRangeProbab = 0.2;
            burst = "3 + round random 5";
        };

        class far_optic1: medium {
            maxRange = 750;             // 650;
        };

        class far_optic2: far_optic1 {
            maxRange = 1100;            // 900;
            aiRateOfFireDistance = 1100;// 900;
        };
    };

    // Negev
    class LMG_Zafir_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;        // 2;
        };

        class close;
        class medium;
        class ACE_Burst_far: medium {
            aiRateOfFire = 6.0;
            aiRateOfFireDistance = 900;
            minRange = 500;
            minRangeProbab = 0.1;
            midRange = 700;
            midRangeProbab = 0.2;
            maxRange = 900;
            maxRangeProbab = 0.2;
            burst = "3 + round random 5";
        };

        class far_optic1: close {
            maxRange = 800;  //700;
        };

        class far_optic2: far_optic1 {
            maxRange = 1200; //1000;
        };
    };

    // marksmen marksmen
    class DMR_03_base_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.3;
            midRangeProbab = 0.3; // 0.7;
        };

        class FullAuto;

        class single_close_optics1: Single {
            minRange = 120;        // 2;
            minRangeProbab = 0.8;  // 0.05;
            midRangeProbab = 0.05; // 0.8;
        };

        class single_medium_optics1: single_close_optics1 {
            minRangeProbab = 0.7;  // 0.05;
            midRangeProbab = 0.05; // 0.7;
        };

        class single_far_optics1: single_medium_optics1 {
            minRange = 400;        // 300;
            minRangeProbab = 0.5;  // 0.05;
            midRangeProbab = 0.05; // 0.5;
        };

        class fullauto_medium: FullAuto {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };
    };

    class DMR_05_base_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.3;
            midRangeProbab = 0.3; // 0.7;
        };

        class FullAuto;

        class single_close_optics1: Single {
            minRange = 120;        // 2;
            minRangeProbab = 0.8;  // 0.05;
            midRangeProbab = 0.05; // 0.8;
        };

        class single_medium_optics1: single_close_optics1 {
            minRangeProbab = 0.7;  // 0.05;
            midRangeProbab = 0.05; // 0.7;
        };

        class single_far_optics1: single_medium_optics1 {
            minRange = 400;        // 300;
            minRangeProbab = 0.5;  // 0.05;
            midRangeProbab = 0.05; // 0.5;
        };

        class fullauto_medium: FullAuto {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };
    };

    class DMR_06_base_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class Single: Mode_SemiAuto {
            minRange = 120;       // 2;
            minRangeProbab = 0.7; // 0.3;
            midRangeProbab = 0.3; // 0.7;
        };

        class FullAuto;

        class single_close_optics1: Single {
            minRange = 120;        // 2;
            minRangeProbab = 0.8;  // 0.05;
            midRangeProbab = 0.05; // 0.8;
        };

        class single_medium_optics1: single_close_optics1 {
            minRangeProbab = 0.7;  // 0.05;
            midRangeProbab = 0.05; // 0.7;
        };

        class single_far_optics1: single_medium_optics1 {
            minRange = 400;        // 300;
            minRangeProbab = 0.5;  // 0.05;
            midRangeProbab = 0.05; // 0.5;
        };

        class fullauto_medium: FullAuto {
            minRange = 20;                // 2;
            maxRange = 150;               // 100;
            burst = "3 + round random 5"; // 3;
        };

        class ACE_Burst_far: fullauto_medium {
            aiRateOfFire = 2.0;
            aiRateOfFireDistance = 500;
            minRange = 400;
            minRangeProbab = 0.1;
            midRange = 500;
            midRangeProbab = 0.2;
            maxRange = 600;
            maxRangeProbab = 0.2;
            burst = "2 + round random 3";
        };
    };

    // marksmen medium mg
    class MMG_01_base_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class manual;
        class burst;
        class close;
        class short;
        class medium;
        class ACE_Burst_far: medium {
            aiRateOfFire = 6.0;
            aiRateOfFireDistance = 900;
            minRange = 700;
            minRangeProbab = 0.1;
            midRange = 900;
            midRangeProbab = 0.2;
            maxRange = 1100;
            maxRangeProbab = 0.2;
            burst = "3 + round random 5";
        };

        class far_optic1;
        class far_optic2;
    };

    class MMG_02_base_F: Rifle_Long_Base_F {
        modes[] += {"ACE_Burst_far"};

        class manual;
        class close;
        class short;
        class medium;
        class ACE_Burst_far: medium {
            aiRateOfFire = 6.0;
            aiRateOfFireDistance = 900;
            minRange = 700;
            minRangeProbab = 0.1;
            midRange = 900;
            midRangeProbab = 0.2;
            maxRange = 1100;
            maxRangeProbab = 0.2;
            burst = "3 + round random 5";
        };

        class far_optic1;
        class far_optic2;
    };
};
