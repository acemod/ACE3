class CfgPatches {
  class AGM_AI {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "commy2"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

/*
 * Documentation:
 * https://community.bistudio.com/wiki/AI_Sub-skills
 *
 * The idea here is to reduce the AI's godlike aiming
 * capabilties while retaining it's high intelligence.
 * The AI should be smart enough to move through a town,
 * but also be 'human' in their reaction time and aim.
 *
 * Note: All these values can still be adjusted via
 *       scripts, these arrays just change what 0 & 1
 *       are for setSkill.
 */

class CfgAISkill {
  aimingAccuracy[] = {0,0, 1,0.8};  // {0,0,1,1};   v1.26 defaults
  aimingShake[]    = {0,0, 1,0.6};  // {0,0,1,1};
  aimingSpeed[]    = {0,0, 1,0.7};  // {0,0.5,1,1};
  commanding[]     = {0,0, 1,0.8};  // {0,0,1,1};
  courage[]        = {0,0, 1,0.7};  // {0,0,1,1};
  endurance[]      = {0,0, 1,0.7};  // {0,0,1,1};
  general[]        = {0,0, 1,0.9};  // {0,0,1,1};
  reloadSpeed[]    = {0,0, 1,0.8};  // {0,0,1,1};
  spotDistance[]   = {0,0, 1,0.9};  // {0,0.2,1,0.4};
  spotTime[]       = {0,0, 1,0.7};  // {0,0,1,0.7};
};

// weapon config changes, by commy2

/* documentation:
aiDispersionCoefX = 1.0         Dispersion multiplier for AI units (axis X - left to right).
aiDispersionCoefY = 1.0         Dispersion multiplier for AI units (axis Y - top-down).
aiRateOfFire = 5.0              Delay between shots at given aiRateOfFireDistance.
aiRateOfFireDistance = 500      At shorter distance delay (aiRateOfFire) goes linearly to zero.
*/

class Mode_SemiAuto;
class Mode_Burst;
class Mode_FullAuto;

class CfgWeapons {

  // rifles
  class RifleCore;
  class Rifle: RifleCore {
    aiDispersionCoefX = 6;
    aiDispersionCoefY = 6;
  };
  class Rifle_Base_F: Rifle {};
  class Rifle_Long_Base_F: Rifle_Base_F {};

  class arifle_MX_Base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    modes[] = {"Single","FullAuto","fullauto_medium","single_medium_optics1","single_far_optics2","AGM_Burst_far"};
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
    class AGM_Burst_far: fullauto_medium {
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

  class arifle_MXC_F: arifle_MX_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
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
    class AGM_Burst_far: fullauto_medium {
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

  class arifle_MX_SW_F: arifle_MX_Base_F {
    aiDispersionCoefY = 24.0;
    aiDispersionCoefX = 21.0;
    modes[] = {"Single","manual","close","short","medium","far_optic1","far_optic2","AGM_Burst_far"};
    class Single: Mode_SemiAuto {
      minRange = 120;             // 2;
    };
    class close;
    class medium;
    class AGM_Burst_far: medium {
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

  class arifle_Katiba_Base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    modes[] = {"Single","FullAuto","single_medium_optics1","single_far_optics2","fullauto_medium","AGM_Burst_far"};
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
    class AGM_Burst_far: fullauto_medium {
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
  class arifle_Katiba_C_F: arifle_Katiba_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
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
    class AGM_Burst_far: fullauto_medium {
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

  class mk20_base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    modes[] = {"Single","FullAuto","fullauto_medium","single_medium_optics1","single_far_optics2","AGM_Burst_far"};
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
    class AGM_Burst_far: fullauto_medium {
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
  class arifle_Mk20C_F: mk20_base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
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
    class AGM_Burst_far: fullauto_medium {
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

  class Tavor_base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;

    modes[] = {"Single","FullAuto","single_medium_optics1","single_medium_optics2","fullauto_medium","AGM_Burst_far"};
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
    class AGM_Burst_far: fullauto_medium {
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
  class arifle_TRG21_F: Tavor_base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
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
    class AGM_Burst_far: fullauto_medium {
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

  // sub machine guns
  class SDAR_base_F: Rifle_Base_F {
    aiDispersionCoefY = 28.0;
    aiDispersionCoefX = 20.0;
    class Single: Mode_SemiAuto {
      minRange = 10;  //2;
    };
    class Burst: Mode_Burst {
      minRange = 5;   //1;
    };
  };

  class pdw2000_base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    class Single: Mode_SemiAuto {
      minRange = 100; //2;
    };
    class Burst: Mode_Burst {
      minRange = 50;  //1;
    };
  };

  class SMG_01_Base: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    class Single: Mode_SemiAuto {
      minRange = 50;  //2;
    };
    class Burst: Mode_Burst {
      minRange = 25;  //2;
    };
  };

  class SMG_02_base_F: Rifle_Base_F {
    aiDispersionCoefY = 18.0;
    aiDispersionCoefX = 12.0;
    class Single: Mode_SemiAuto {
      minRange = 50;  //2;
    };
    class Burst: Mode_Burst {
      minRange = 25;  //2;
    };
  };

  // machine guns
  class LMG_Mk200_F: Rifle_Long_Base_F {
    aiDispersionCoefY = 24.0;
    aiDispersionCoefX = 21.0;
    modes[] = {"manual","close","short","medium","far_optic1","far_optic2","AGM_Burst_far"};
    class medium;
    class AGM_Burst_far: medium {
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

  class LMG_Zafir_F: Rifle_Long_Base_F {
    aiDispersionCoefY = 23.0;
    aiDispersionCoefX = 19.0;
    modes[] = {"Single","FullAuto","close","short","medium","far_optic1","far_optic2","AGM_Burst_far"};
    class Single: Mode_SemiAuto {
      minRange = 120;        // 2;
    };
    class close;
    class medium;
    class AGM_Burst_far: medium {
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
};
