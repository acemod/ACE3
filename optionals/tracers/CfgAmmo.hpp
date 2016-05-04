
class CfgAmmo {
    class BulletBase;
    class ShellBase;
    class SubmunitionBullet;

    //No idea
    class B_56x15_dual: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white

    //Pistol
    class B_9x21_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white
    class B_9x21_Ball_Tracer_Green: B_9x21_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    class B_45ACP_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_45ACP_Ball_Green: B_45ACP_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_45ACP_Ball_Yellow: B_45ACP_Ball {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    //Assault rifle
    class B_556x45_Ball: BulletBase {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow
    class B_556x45_Ball_Tracer_Red: B_556x45_Ball {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_556x45_Ball_Tracer_Green: B_556x45_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_556x45_Ball_Tracer_Yellow: B_556x45_Ball {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_65x39_Caseless: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_65x39_Caseless_green: B_65x39_Caseless {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_65x39_Caseless_yellow: B_65x39_Caseless {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_65x39_Case;
    class B_65x39_Case_green: B_65x39_Case {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_65x39_Case_yellow: B_65x39_Case {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_65x39_Minigun_Caseless: SubmunitionBullet {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_65x39_Minigun_Caseless_Red_splash;
    class B_65x39_Minigun_Caseless_Yellow_splash: B_65x39_Minigun_Caseless_Red_splash {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow
    class B_65x39_Minigun_Caseless_Green_splash: B_65x39_Minigun_Caseless_Red_splash {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    //Battle rifle
    class B_762x51_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white
    class B_762x51_Tracer_Red: B_762x51_Ball {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_762x51_Tracer_Green: B_762x51_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_762x51_Tracer_Yellow: B_762x51_Ball {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_762x51_Minigun_Tracer_Red: SubmunitionBullet {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_762x51_Minigun_Tracer_Red_splash: B_762x51_Ball {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red

    class B_762x51_Minigun_Tracer_Yellow: B_762x51_Minigun_Tracer_Red {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow
    class B_762x51_Minigun_Tracer_Yellow_splash: B_762x51_Minigun_Tracer_Red_splash {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_762x54_Ball;
    class B_762x54_Tracer_Red: B_762x54_Ball {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_762x54_Tracer_Green: B_762x54_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_762x54_Tracer_Yellow: B_762x54_Ball {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    //Sniper rifle
    class B_127x99_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white
    class B_127x99_Ball_Tracer_Red: B_127x99_Ball {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_127x99_Ball_Tracer_Green: B_127x99_Ball {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_127x99_Ball_Tracer_Yellow: B_127x99_Ball {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_127x99_SLAP;
    class B_127x99_SLAP_Tracer_Red: B_127x99_SLAP {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_127x99_SLAP_Tracer_Green: B_127x99_SLAP {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_127x99_SLAP_Tracer_Yellow: B_127x99_SLAP {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_408_Ball: BulletBase {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_127x33_Ball: BulletBase {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    class B_127x108_Ball: BulletBase {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    class B_338_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red

    class B_338_NM_Ball: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red

    class B_127x54_Ball: BulletBase {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    class B_93x64_Ball: BulletBase {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green

    //Autocannon
    class B_19mm_HE: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white

    class B_30mm_HE;
    class B_30mm_HE_Tracer_Red: B_30mm_HE {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_30mm_HE_Tracer_Green: B_30mm_HE {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_30mm_HE_Tracer_Yellow: B_30mm_HE {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_30mm_MP;
    class B_30mm_MP_Tracer_Red: B_30mm_MP {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_30mm_MP_Tracer_Green: B_30mm_MP {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_30mm_MP_Tracer_Yellow: B_30mm_MP {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_40mm_GPR;
    class B_40mm_GPR_Tracer_Red: B_40mm_GPR {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_40mm_GPR_Tracer_Green: B_40mm_GPR {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_40mm_GPR_Tracer_Yellow: B_40mm_GPR {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_20mm: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_20mm_Tracer_Red: B_20mm {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red

    class B_25mm: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white

    class B_30mm_AP: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white
    class B_30mm_AP_Tracer_Red: B_30mm_AP {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_30mm_AP_Tracer_Green: B_30mm_AP {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_30mm_AP_Tracer_Yellow: B_30mm_AP {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_30mm_APFSDS;
    class B_30mm_APFSDS_Tracer_Red: B_30mm_APFSDS {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_30mm_APFSDS_Tracer_Green: B_30mm_APFSDS {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_30mm_APFSDS_Tracer_Yellow: B_30mm_APFSDS {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_40mm_APFSDS;
    class B_40mm_APFSDS_Tracer_Red: B_40mm_APFSDS {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_40mm_APFSDS_Tracer_Green: B_40mm_APFSDS {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_40mm_APFSDS_Tracer_Yellow: B_40mm_APFSDS {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class B_35mm_AA: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_white
    class B_35mm_AA_Tracer_Red: B_35mm_AA {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red
    class B_35mm_AA_Tracer_Green: B_35mm_AA {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green
    class B_35mm_AA_Tracer_Yellow: B_35mm_AA {model = PATHTOF(ace_TracerYellow2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_yellow

    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {model = PATHTOF(ace_TracerRed2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_red.p3d
    class Cannon_30mm_HE_Plane_CAS_02_F: Gatling_30mm_HE_Plane_CAS_01_F {model = PATHTOF(ace_TracerGreen2.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\tracer_green.p3d

    //Cannon
    class Sh_120mm_HE: ShellBase {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_white
    class Sh_120mm_HE_Tracer_Red: Sh_120mm_HE {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_120mm_HE_Tracer_Green: Sh_120mm_HE {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_120mm_HE_Tracer_Yellow: Sh_120mm_HE {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_120mm_APFSDS: ShellBase {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_white
    class Sh_120mm_APFSDS_Tracer_Red: Sh_120mm_APFSDS {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_120mm_APFSDS_Tracer_Green: Sh_120mm_APFSDS {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_120mm_APFSDS_Tracer_Yellow: Sh_120mm_APFSDS {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_125mm_APFSDS;
    class Sh_125mm_APFSDS_T_Red: Sh_125mm_APFSDS {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_125mm_APFSDS_T_Green: Sh_125mm_APFSDS {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_125mm_APFSDS_T_Yellow: Sh_125mm_APFSDS {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_125mm_HE;
    class Sh_125mm_HE_T_Red: Sh_125mm_HE {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_125mm_HE_T_Green: Sh_125mm_HE {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_125mm_HE_T_Yellow: Sh_125mm_HE {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_125mm_HEAT;
    class Sh_125mm_HEAT_T_Red: Sh_125mm_HEAT {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_125mm_HEAT_T_Green: Sh_125mm_HEAT {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_125mm_HEAT_T_Yellow: Sh_125mm_HEAT {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_105mm_APFSDS;
    class Sh_105mm_APFSDS_T_Red: Sh_105mm_APFSDS {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_105mm_APFSDS_T_Green: Sh_105mm_APFSDS {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_105mm_APFSDS_T_Yellow: Sh_105mm_APFSDS {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow

    class Sh_105mm_HEAT_MP;
    class Sh_105mm_HEAT_MP_T_Red: Sh_105mm_HEAT_MP {model = PATHTOF(ace_shell_tracer_red.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_red
    class Sh_105mm_HEAT_MP_T_Green: Sh_105mm_HEAT_MP {model = PATHTOF(ace_shell_tracer_green.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_green
    class Sh_105mm_HEAT_MP_T_Yellow: Sh_105mm_HEAT_MP {model = PATHTOF(ace_shell_tracer_yellow.p3d);}; //Replaces \A3\Weapons_f\Data\bullettracer\shell_tracer_yellow
};