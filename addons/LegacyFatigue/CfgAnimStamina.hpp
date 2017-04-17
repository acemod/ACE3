class CfgMovesFatigu {
    staminaDuration			= 180;	//total amount of stamina
    staminaCooldown			= 30;	//when you run out of stamina the sprinting is disabled for this duration
    staminaRestoration		= 90;	//time required for your current stamina pool (total stamina - inventory load) to restore
    aimPrecisionSpeedCoef	= 0;	//aimPrecision adjusting rate coefficient
    terrainDrainSprint		= 0;	//when terrain gradient disable sprint, this stamina value is added to every animation state
    terrainDrainRun			= 0;	//when terrain gradient enable force walk, this stamina value is added to every animation state
    terrainSpeedCoef		= 1;	//when terrain gradient disable sprint, animation speed is multiplied by this value
};

class CfgInGameUI {
    class CfgStaminaBar {
        textureEncumbranceBar = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\encumbrance_bar_ca.paa";
        textureStaminaBar = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\stamina_ca.paa";
        textureArrowLeft = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_left_ca.paa";
        textureArrowRight = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\arrow_right_ca.paa";
        textureIconTerrain = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\icon_terrain_ca.paa";
        textureIconInjury  = "\A3\Ui_f\data\IGUI\RscIngameUI\RscUnitInfo\icon_cross_ca.paa";
        warningRate = -100; //to turn off the exhaustion rate based color change
    };
};

class CfgMovesBasic {// Import needed references
    class Actions;
    class Default;
    class HealBase;
    class HealBaseRfl;
    class DefaultDie;
    class StandBase;
    class AgonyBase;
    class AgonyBaseRfl;
    class InjuredMovedBase;
};

// Define the stamina value for the move states
class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class DeadState: Default {
            stamina=0.5;
        };
        class Unconscious: Default {
            stamina=0.5;
        };
        class Incapacitated: Unconscious {
            stamina=0.5;
        };
        class IncapacitatedRifle: Unconscious {
            stamina=0.5;
        };
        class IncapacitatedPistol: Unconscious {
            stamina=0.5;
        };
        class AinvPknlMstpSnonWnonDnon_medic: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp: AinvPknlMstpSnonWnonDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicEnd: AinvPknlMstpSnonWnonDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicEnd: HealBaseRfl {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic0S: AinvPknlMstpSnonWnonDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp0S: AinvPknlMstpSnonWnonDnon_medicUp {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic0: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic1: AinvPknlMstpSnonWnonDnon_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic2: AinvPknlMstpSnonWnonDnon_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic3: AinvPknlMstpSnonWnonDnon_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic3: AinvPknlMstpSnonWnonDnon_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic4: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic5: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic4: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medic5: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic0S: AinvPknlMstpSnonWnonDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic0: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic1: AinvPknlMstpSnonWnonDr_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medic2: AinvPknlMstpSnonWnonDr_medic0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp0: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp1: AinvPknlMstpSnonWnonDnon_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp2: AinvPknlMstpSnonWnonDnon_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp3: AinvPknlMstpSnonWnonDnon_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp3: AinvPknlMstpSnonWnonDnon_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp4: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp5: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp4: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_medicUp5: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp0S: AinvPknlMstpSnonWnonDnon_medicUp {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp0: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp1: AinvPknlMstpSnonWnonDr_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDr_medicUp2: AinvPknlMstpSnonWnonDr_medicUp0 {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_medic: HealBase {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic: HealBaseRfl {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic_Launcher: AinvPknlMstpSnonWrflDnon_AinvPknlMstpSnonWrflDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic: HealBaseRfl {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp: AinvPknlMstpSnonWrflDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic0S: AinvPknlMstpSnonWrflDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic0_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic1_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic2_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic3_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic4_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDr_medic5_old: AinvPknlMstpSnonWrflDr_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic0S: AinvPknlMstpSnonWrflDnon_medic {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp0S: AinvPknlMstpSnonWrflDnon_medicUp {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic0: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic1: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic2: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic3: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic4: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medic5: AinvPknlMstpSnonWrflDnon_medic0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp0: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp1: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp2: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp3: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp4: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class AinvPknlMstpSnonWrflDnon_medicUp5: AinvPknlMstpSnonWrflDnon_medicUp0S {
            stamina=-0.2;
        };
        class Crew: Default {
            stamina=0.5;
        };
        class BasicDriver: Default {
            stamina=0.5;
        };
        class BasicDriverDying: DefaultDie {
            stamina=0.5;
        };
        class BasicDriverDead: BasicDriverDying {
            stamina=0.5;
        };
        class BasicDriverOut: Default {
            stamina=0.5;
        };
        class BasicDriverOutDying: DefaultDie {
            stamina=0.5;
        };
        class BasicDriverOutDead: BasicDriverOutDying {
            stamina=0.5;
        };
        class BasicSittingGunner_Dead: DefaultDie {
            stamina=0.5;
        };
        class BasicSittingGunner: Crew {
            stamina=0.5;
        };
        class SprintBaseDf: StandBase {
            stamina=-0.5;
        };
        class SprintBaseDfl: SprintBaseDf {
            stamina=-0.5;
        };
        class SprintBaseDfr: SprintBaseDf {
            stamina=-0.5;
        };
        class SprintCivilBaseDf: SprintBaseDf {
            stamina=-0.5;
        };
        class SprintCivilBaseDfl: SprintCivilBaseDf {
            stamina=-0.5;
        };
        class SprintCivilBaseDfr: SprintCivilBaseDf {
            stamina=-0.5;
        };
        class AmovPercMstpSlowWrflDnon: StandBase {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G0S: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_AI: AidlPercMstpSlowWrflDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G01: AidlPercMstpSlowWrflDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G02: AidlPercMstpSlowWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G03: AidlPercMstpSlowWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G04: AidlPercMstpSlowWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G05: AidlPercMstpSlowWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G01_combat: AidlPercMstpSlowWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G02_combat: AidlPercMstpSlowWrflDnon_G02 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G03_combat: AidlPercMstpSlowWrflDnon_G03 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G04_combat: AidlPercMstpSlowWrflDnon_G04 {
            stamina=0.4;
        };
        class AidlPercMstpSlowWrflDnon_G05_combat: AidlPercMstpSlowWrflDnon_G05 {
            stamina=0.4;
        };
        class AovrPercMstpSlowWrflDf: AmovPercMstpSlowWrflDnon {
            stamina=-1;
        };
        class AmovPercMstpSlowWrflDnon_turnL: AidlPercMstpSlowWrflDnon_G0S {
            stamina=0.2;
        };
        class AmovPercMstpSlowWrflDnon_turnR: AidlPercMstpSlowWrflDnon_G0S {
            stamina=0.2;
        };
        class AmovPercMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G0S: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_AI: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G01: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G02: AidlPercMstpSrasWrflDnon_G01 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G03: AidlPercMstpSrasWrflDnon_G01 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G04: AidlPercMstpSrasWrflDnon_G01 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G01_player: AidlPercMstpSrasWrflDnon_G04 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G02_player: AidlPercMstpSrasWrflDnon_G04 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G03_player: AidlPercMstpSrasWrflDnon_G04 {
            stamina=0.3;
        };
        class AidlPercMstpSrasWrflDnon_G04_player: AidlPercMstpSrasWrflDnon_G04 {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_turnL: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0;
        };
        class AmovPercMstpSrasWrflDnon_turnR: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0;
        };
        class AidlPercMstpSrasWrflDnon_turnR: AmovPercMstpSrasWrflDnon_turnR {
            stamina=0;
        };
        class AidlPercMstpSrasWrflDnon_turnL: AmovPercMstpSrasWrflDnon_turnL {
            stamina=0;
        };
        class AmovPercMstpSrasWrflDnon_falling: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDup: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDdown: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDleft: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_AadjPercMstpSrasWrflDright: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDup: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDup_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDdown: AadjPercMstpSrasWrflDup {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDDown_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDleft: AadjPercMstpSrasWrflDup {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDright: AadjPercMstpSrasWrflDup {
            stamina=0.3;
        };
        class AadjPercMstpSrasWrflDright_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AovrPercMstpSrasWrflDf: AmovPercMstpSrasWrflDnon {
            stamina=-1;
        };
        class AovrPercMrunSrasWrflDf: AovrPercMstpSrasWrflDf {
            stamina=-10;
        };
        class AmovPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_relax: AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G0S: AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_AI: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G01: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G02: AidlPknlMstpSlowWrflDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G03: AidlPknlMstpSlowWrflDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G01_combat: AidlPknlMstpSlowWrflDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G02_combat: AidlPknlMstpSlowWrflDnon_G02 {
            stamina=0.6;
        };
        class AidlPknlMstpSlowWrflDnon_G03_combat: AidlPknlMstpSlowWrflDnon_G03 {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_gear: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_explo: AmovPknlMstpSlowWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_diary: AmovPknlMstpSlowWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWrflDnon_gear_AmovPknlMstpSrasWrflDnon: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon_gear: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWrflDnon_gear: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWrflDnon_explo: AmovPknlMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWrflDnon_diary: AmovPknlMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_gear_AmovPercMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon_gear: AmovPknlMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_gear: AmovPknlMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_diary: AmovPercMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSlowWrflDnon_gear: AmovPercMstpSrasWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPercMstpSlowWrflDnon_diary: AmovPercMstpSlowWrflDnon_gear {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_turnL: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.4;
        };
        class AmovPknlMstpSlowWrflDnon_turnR: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon: AmovPknlMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_G0S: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_AI: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_G01: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_G02: AidlPknlMstpSrasWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_G01_player: AidlPknlMstpSrasWrflDnon_G01 {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWrflDnon_G02_player: AidlPknlMstpSrasWrflDnon_G02 {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPknlMstpSrasWrflDup: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPknlMstpSrasWrflDdown: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPknlMstpSrasWrflDleft: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPknlMstpSrasWrflDright: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDup: AidlPknlMstpSrasWrflDnon_G0S {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDup_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDdown: AadjPknlMstpSrasWrflDup {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDDown_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDleft: AadjPknlMstpSrasWrflDup {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDleft_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDright: AadjPknlMstpSrasWrflDup {
            stamina=0.4;
        };
        class AadjPknlMstpSrasWrflDright_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMrunSlowWrflDf: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_turnL: AmovPknlMstpSrasWrflDnon {
            stamina=0.2;
        };
        class AmovPknlMstpSrasWrflDnon_turnR: AmovPknlMstpSrasWrflDnon {
            stamina=0.2;
        };
        class AmovPpneMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G0S: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_AI: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G01: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G02: AidlPpneMstpSrasWrflDnon_G01 {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G03: AidlPpneMstpSrasWrflDnon_G01 {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G01_player: AidlPpneMstpSrasWrflDnon_G01 {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G02_player: AidlPpneMstpSrasWrflDnon_G02 {
            stamina=0.8;
        };
        class AidlPpneMstpSrasWrflDnon_G03_player: AidlPpneMstpSrasWrflDnon_G03 {
            stamina=0.8;
        };
        class IncapacitatedRifle_AmovPpneMstpSrasWrflDnon: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDup: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDdown: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDup: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDup_turnL: AadjPpneMstpSrasWrflDup {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDup_turnR: AadjPpneMstpSrasWrflDup {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDup_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDdown: AadjPpneMstpSrasWrflDup {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDdown_turnL: AadjPpneMstpSrasWrflDdown {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDdown_turnR: AadjPpneMstpSrasWrflDdown {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDleft: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDright: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright: AadjPpneMstpSrasWrflDright {
            stamina=0.8;
        };
        class AmovPercMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft: AadjPpneMstpSrasWrflDleft {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright: AadjPpneMstpSrasWrflDright {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft: AadjPpneMstpSrasWrflDleft {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDDown_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDright: AadjPpneMstpSrasWrflDright {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_AadjPpneMstpSrasWrflDleft: AadjPpneMstpSrasWrflDleft {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDleft_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AadjPpneMstpSrasWrflDright_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AadjPpneMstpSrasWrflDleft_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AadjPpneMstpSrasWrflDright_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AadjPpneMstpSrasWrflDleft_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AadjPpneMstpSrasWrflDright_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_relax: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_injured: AgonyBaseRfl {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWrflDnon_injuredHealed: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_turnL: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPpneMstpSrasWrflDnon_turnR: AidlPpneMstpSrasWrflDnon_G0S {
            stamina=0.6;
        };
        class AmovPercMstpSrasWpstDnon: StandBase {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G0S: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_AI: AidlPercMstpSrasWpstDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G01: AidlPercMstpSrasWpstDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G02: AidlPercMstpSrasWpstDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G03: AidlPercMstpSrasWpstDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G01_player: AidlPercMstpSrasWpstDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G02_player: AidlPercMstpSrasWpstDnon_G01 {
            stamina=0.4;
        };
        class AidlPercMstpSrasWpstDnon_G03_player: AidlPercMstpSrasWpstDnon_G01 {
            stamina=0.4;
        };
        class AovrPercMstpSrasWpstDf: AidlPercMstpSrasWpstDnon_G0S {
            stamina=-1;
        };
        class AmovPercMstpSrasWpstDnon_falling: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDup: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDdown: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDleft: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_AadjPercMstpSrasWpstDright: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDup: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDup_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDdown: AadjPercMstpSrasWpstDup {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDDown_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDleft: AadjPercMstpSrasWpstDup {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDleft_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDright: AadjPercMstpSrasWpstDup {
            stamina=0.4;
        };
        class AadjPercMstpSrasWpstDright_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSlowWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AidlPercMstpSlowWpstDnon_G0S: AmovPercMstpSlowWpstDnon {
            stamina=0.6;
        };
        class AidlPercMstpSlowWpstDnon_AI: AidlPercMstpSlowWpstDnon_G0S {
            stamina=0.6;
        };
        class AmovPercMstpSlowWpstDnon_turnL: AidlPercMstpSlowWpstDnon_G0S {
            stamina=0.4;
        };
        class AmovPercMstpSlowWpstDnon_turnR: AidlPercMstpSlowWpstDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSlowWpstDnon_G01: AidlPercMstpSlowWpstDnon_G0S {
            stamina=0.6;
        };
        class AidlPercMstpSlowWpstDnon_G02: AidlPercMstpSlowWpstDnon_G01 {
            stamina=0.6;
        };
        class AidlPercMstpSlowWpstDnon_G03: AidlPercMstpSlowWpstDnon_G01 {
            stamina=0.6;
        };
        class AovrPercMstpSlowWpstDf: AovrPercMstpSrasWpstDf {
            stamina=-1;
        };
        class AmovPercMstpSrasWpstDnon_AidlPercMstpSlowWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AidlPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AidlPercMstpSlowWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_turnL: AmovPercMstpSrasWpstDnon {
            stamina=0.2;
        };
        class AmovPercMstpSrasWpstDnon_turnR: AmovPercMstpSrasWpstDnon {
            stamina=0.2;
        };
        class AmovPknlMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G0S: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_AI: AidlPknlMstpSrasWpstDnon_G0S {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G01: AidlPknlMstpSrasWpstDnon_G0S {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G02: AidlPknlMstpSrasWpstDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G03: AidlPknlMstpSrasWpstDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G01_player: AidlPknlMstpSrasWpstDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G02_player: AidlPknlMstpSrasWpstDnon_G01 {
            stamina=0.6;
        };
        class AidlPknlMstpSrasWpstDnon_G03_player: AidlPknlMstpSrasWpstDnon_G01 {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_relax: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDup: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDdown: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDleft: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPcrhMstpSrasWpstDnon_AadjPcrhMstpSrasWpstDright: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDup: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDup_AmovPcrhMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDdown: AadjPcrhMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDDown_AmovPcrhMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDleft: AadjPcrhMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDleft_AmovPcrhMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDright: AadjPcrhMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPcrhMstpSrasWpstDright_AmovPcrhMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPknlMstpSrasWpstDup: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPknlMstpSrasWpstDdown: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPknlMstpSrasWpstDleft: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPknlMstpSrasWpstDright: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDup: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDup_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDdown: AadjPknlMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDDown_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDleft: AadjPknlMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDleft_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDright: AadjPknlMstpSrasWpstDup {
            stamina=0.6;
        };
        class AadjPknlMstpSrasWpstDright_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.8;
        };
        class AidlPknlMstpSlowWpstDnon_G0S: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AidlPknlMstpSlowWpstDnon_AI: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=0.8;
        };
        class AidlPknlMstpSlowWpstDnon_G01: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=0.8;
        };
        class AidlPknlMstpSlowWpstDnon_G02: AidlPknlMstpSlowWpstDnon_G01 {
            stamina=0.8;
        };
        class AidlPknlMstpSlowWpstDnon_G03: AidlPknlMstpSlowWpstDnon_G01 {
            stamina=0.8;
        };
        class AmovPknlMstpSlowWpstDnon_turnL: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWpstDnon_turnR: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=0.8;
        };
        class AmovPknlMwlkSlowWpstDf: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDfl: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDl: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDbl: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDb: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDbr: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDr: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWpstDfr: AmovPknlMwlkSlowWpstDf {
            stamina=-0.1;
        };
        class AmovPknlMtacSlowWpstDf: AmovPknlMwlkSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDfl: AmovPknlMtacSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDl: AmovPknlMtacSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDb: AmovPknlMtacSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDbl: AmovPknlMtacSlowWpstDb {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDbr: AmovPknlMtacSlowWpstDb {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDr: AmovPknlMtacSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWpstDfr: AmovPknlMtacSlowWpstDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSlowWpstDf: AmovPknlMwlkSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDfl: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDl: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDbl: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDb: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDbr: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDr: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWpstDfr: AmovPknlMrunSlowWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMstpSlowWpstDnon_gear_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_gear_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon_gear: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWpstDnon_gear: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWpstDnon_explo: AmovPknlMstpSrasWpstDnon_gear {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_gear_AmovPercMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_gear {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon_gear: AmovPknlMstpSrasWpstDnon_gear {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_gear: AmovPknlMstpSrasWpstDnon_gear {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon_gear: AmovPknlMstpSrasWpstDnon_gear {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWpstDnon_turnL: AmovPknlMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWpstDnon_turnR: AmovPknlMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G0S: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_AI: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G01: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G02: AidlPpneMstpSrasWpstDnon_G01 {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G03: AidlPpneMstpSrasWpstDnon_G01 {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G01_player: AidlPpneMstpSrasWpstDnon_G01 {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G02_player: AidlPpneMstpSrasWpstDnon_G01 {
            stamina=1;
        };
        class AidlPpneMstpSrasWpstDnon_G03_player: AidlPpneMstpSrasWpstDnon_G01 {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDup: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDup_turnL: AadjPpneMstpSrasWpstDup {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDup_turnR: AadjPpneMstpSrasWpstDup {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDdown: AadjPpneMstpSrasWpstDup {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDdown_turnL: AadjPpneMstpSrasWpstDdown {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDdown_turnR: AadjPpneMstpSrasWpstDdown {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDleft: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDright: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_AadjPpneMstpSrasWpstDup: AadjPpneMstpSrasWpstDup {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_AadjPpneMstpSrasWpstDdown: AadjPpneMstpSrasWpstDdown {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright: AadjPpneMstpSrasWpstDright {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft: AadjPpneMstpSrasWpstDleft {
            stamina=1;
        };
        class AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright: AadjPpneMstpSrasWpstDright {
            stamina=1;
        };
        class AmovPercMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft: AadjPpneMstpSrasWpstDleft {
            stamina=1;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPpneMstpSrasWpstDright: AadjPpneMstpSrasWpstDright {
            stamina=1;
        };
        class AmovPknlMstpSrasWpstDnon_AadjPpneMstpSrasWpstDleft: AadjPpneMstpSrasWpstDleft {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDup_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDdown_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDleft_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPpneMstpSrasWpstDleft_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPpneMstpSrasWpstDright_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AadjPpneMstpSrasWpstDright_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AadjPpneMstpSrasWpstDleft_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AadjPpneMstpSrasWpstDright_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_relax: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=1;
        };
        class AmovPpneMstpSrasWpstDnon_turnL: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWpstDnon_turnR: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWlnrDnon: Default {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWlnrDnon_relax: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWlnrDnon_G0S: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class ReloadRPGKneel: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=-0.6;
        };
        class AidlPknlMstpSrasWlnrDnon_AI: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWlnrDnon_G01: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWlnrDnon_G02: AidlPknlMstpSrasWlnrDnon_G01 {
            stamina=0.4;
        };
        class AidlPknlMstpSrasWlnrDnon_G03: AidlPknlMstpSrasWlnrDnon_G01 {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWlnrDnon_turnL: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=0.2;
        };
        class AmovPknlMstpSrasWlnrDnon_turnR: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=0.2;
        };
        class AmovPpneMstpSrasWlnrDnon: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=1.2;
        };
        class AmovPpneMstpSrasWlnrDnon_turnL: AmovPpneMstpSrasWlnrDnon {
            stamina=1.2;
        };
        class AmovPpneMstpSrasWlnrDnon_turnR: AmovPpneMstpSrasWlnrDnon {
            stamina=1.2;
        };
        class AmovPpneMrunSrasWlnrDf: AmovPpneMstpSrasWlnrDnon {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDfl: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDl: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDbl: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDb: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDbr: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDr: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPpneMrunSrasWlnrDfr: AmovPpneMrunSrasWlnrDf {
            stamina=-0.6;
        };
        class AmovPercMstpSnonWnonDnon: StandBase {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G0S: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_AI: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G01: AidlPercMstpSnonWnonDnon_G0S {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G02: AidlPercMstpSnonWnonDnon_G01 {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G03: AidlPercMstpSnonWnonDnon_G01 {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G04: AidlPercMstpSnonWnonDnon_G01 {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G05: AidlPercMstpSnonWnonDnon_G01 {
            stamina=0.8;
        };
        class AidlPercMstpSnonWnonDnon_G06: AidlPercMstpSnonWnonDnon_G01 {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_falling: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class InBaseMoves_assemblingVehicleErc: AidlPercMstpSnonWnonDnon_G0S {
            stamina=0.8;
        };
        class InBaseMoves_table1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_HandsBehindBack1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_HandsBehindBack2: InBaseMoves_HandsBehindBack1 {
            stamina=0.8;
        };
        class InBaseMoves_repairVehicleKnl: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_repairVehiclePne: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_patrolling1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_patrolling2: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_SittingRifle1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_SittingRifle2: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_Lean1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_holdleft_idle1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class InBaseMoves_sitHighUp1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class c4coming2cDf_genericstani1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class c4coming2cDf_genericstani2: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class c4coming2cDf_genericstani4: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class c5efe_HonzaLoop: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class c5efe_MichalLoop: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class LHD_krajPaluby: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class sitTableRfl_listening: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class UnaErcPoslechVelitele1: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class UnaErcPoslechVelitele2: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class UnaErcPoslechVelitele3: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class UnaErcPoslechVelitele4: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class Poster_pose_01: InBaseMoves_assemblingVehicleErc {
            stamina=0.8;
        };
        class Poster_pose_02: Poster_pose_01 {
            stamina=0.8;
        };
        class AovrPercMstpSnonWnonDf: AmovPercMstpSnonWnonDnon {
            stamina=-2;
        };
        class AmovPercMstpSnonWnonDnon_turnL: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_turnR: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=1;
        };
        class AidlPknlMstpSnonWnonDnon_G0S: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AidlPknlMstpSnonWnonDnon_AI: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AidlPknlMstpSnonWnonDnon_G01: AidlPknlMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AidlPknlMstpSnonWnonDnon_G02: AidlPknlMstpSnonWnonDnon_G01 {
            stamina=1;
        };
        class AidlPknlMstpSnonWnonDnon_G03: AidlPknlMstpSnonWnonDnon_G01 {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_relax: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_gear: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_explo: AmovPknlMstpSnonWnonDnon_gear {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_gear_trans: AmovPknlMstpSnonWnonDnon_gear {
            stamina=1;
        };
        class AmovPercMstpSnonWnonDnon_gear: AmovPknlMstpSnonWnonDnon_gear {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_turnL: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPknlMstpSnonWnonDnon_turnR: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=1;
        };
        class AidlPpneMstpSnonWnonDnon_G0S: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AidlPpneMstpSnonWnonDnon_AI: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AidlPpneMstpSnonWnonDnon_G01: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AidlPpneMstpSnonWnonDnon_G02: AidlPpneMstpSnonWnonDnon_G01 {
            stamina=1;
        };
        class AidlPpneMstpSnonWnonDnon_G03: AidlPpneMstpSnonWnonDnon_G01 {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_relax: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_turnL: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_turnR: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon_Putdown: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_AinvPpneMstpSnonWnonDnon_Putdown: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPpneMstpSnonWnonDnon_Putdown_AmovPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPercMwlkSlowWrflDf: AmovPercMstpSlowWrflDnon {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDf_v1: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDf_v2: AmovPercMwlkSlowWrflDf_v1 {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDf_v3: AmovPercMwlkSlowWrflDf_v1 {
            stamina=0.3;
        };
        class AidlPercMwlkSrasWrflDf: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDfl: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDl: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDbl: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDb: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDbr: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDr: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWrflDfr: AmovPercMwlkSlowWrflDf {
            stamina=0.3;
        };
        class AmovPercMrunSlowWrflDf: AmovPercMstpSlowWrflDnon {
            stamina=-0.2;
        };
        class AidlPercMrunSrasWrflDf: AmovPercMrunSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDfl: AmovPercMrunSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDl: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDbl: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDb: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDbr: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDr: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMrunSlowWrflDfr: AmovPercMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPercMwlkSrasWrflDf: AmovPercMstpSrasWrflDnon {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDfl: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDl: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDb: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDbl: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDbr: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDr: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWrflDfr: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AmovPercMtacSrasWrflDf: AmovPercMwlkSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfl: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDl: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDb: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDbl: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDbr: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDr: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfr: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSlowWrflDf: AmovPercMwlkSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDfl: AmovPercMwlkSlowWrflDfl {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDbl: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDb: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDbr: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDr: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDl: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMtacSlowWrflDfr: AmovPercMtacSlowWrflDf {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWrflDf: AmovPercMstpSrasWrflDnon {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfl: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDl: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDb: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDbl: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDbr: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDr: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfr: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDf_ldst: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfl_ldst: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDl_ldst: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDbl_ldst: AmovPercMrunSrasWrflDbl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDb_ldst: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDbr_ldst: AmovPercMrunSrasWrflDbr {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDr_ldst: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfr_ldst: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AmovPercMwlkSnonWnonDf: AidlPercMstpSnonWnonDnon_G0S {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDfl: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDl: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDbl: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDb: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDbr: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDr: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMwlkSnonWnonDfr: AmovPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class AmovPercMrunSnonWnonDf: AmovPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDfl: AmovPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDl: AmovPercMrunSnonWnonDfl {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDbl: AmovPercMrunSnonWnonDl {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDb: AmovPercMrunSnonWnonDl {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDbr: AmovPercMrunSnonWnonDl {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDr: AmovPercMrunSnonWnonDl {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWnonDfr: AmovPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSlowWrflDf: AidlPknlMstpSlowWpstDnon_G0S {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDfl: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDl: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDbl: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDb: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDbr: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDr: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMwlkSlowWrflDfr: AmovPknlMwlkSlowWrflDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSlowWrflDf: AidlPknlMstpSlowWrflDnon_G0S {
            stamina=-0.3;
        };
        class AmovPknlMstpSlowWrflDnon_AmovPknlMrunSlowWrflDf: AmovPknlMrunSlowWrflDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDfl: AmovPknlMrunSlowWrflDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDl: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDbl: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDb: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDbr: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDr: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMrunSlowWrflDfr: AmovPknlMrunSlowWrflDfl {
            stamina=-0.3;
        };
        class AmovPknlMtacSlowWrflDf: AmovPknlMrunSlowWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMtacSlowWrflDfl: AmovPknlMrunSlowWrflDfl {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDl: AmovPknlMrunSlowWrflDl {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDbl: AmovPknlMrunSlowWrflDbl {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDb: AmovPknlMrunSlowWrflDb {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDbr: AmovPknlMrunSlowWrflDbr {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDr: AmovPknlMrunSlowWrflDr {
            stamina=-0.2;
        };
        class AmovPknlMtacSlowWrflDfr: AmovPknlMrunSlowWrflDfr {
            stamina=-0.2;
        };
        class AmovPknlMwlkSrasWrflDf: AmovPknlMstpSrasWrflDnon {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDfl: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDl: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDb: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDbl: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDbr: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDr: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMwlkSrasWrflDfr: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AmovPknlMrunSrasWrflDf: AmovPknlMstpSrasWrflDnon {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDf_ldst: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDfl: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDfl_ldst: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDl: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDl_ldst: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDb: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDb_ldst: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDbl: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDbl_ldst: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDbr: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDbr_ldst: AmovPknlMrunSrasWrflDbr {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDr: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDr_ldst: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDfr: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSrasWrflDfr_ldst: AmovPknlMrunSrasWrflDfr {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWrflDf: AmovPknlMrunSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDfl: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDl: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDb: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDbl: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDbr: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDr: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPknlMtacSrasWrflDfr: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf: AmovPercMstpSrasWpstDnon {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDfl: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDl: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDb: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDbl: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDbr: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDr: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AmovPercMwlkSrasWpstDfr: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AmovPercMwlkSlowWpstDf: AmovPercMwlkSrasWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDfl: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDl: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDbl: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDb: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDbr: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDr: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMwlkSlowWpstDfr: AmovPercMwlkSlowWpstDf {
            stamina=0.5;
        };
        class AmovPercMtacSlowWpstDf: AmovPercMwlkSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDfl: AmovPercMtacSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDl: AmovPercMtacSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDb: AmovPercMtacSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDbl: AmovPercMtacSlowWpstDb {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDbr: AmovPercMtacSlowWpstDb {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDr: AmovPercMtacSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSlowWpstDfr: AmovPercMtacSlowWpstDf {
            stamina=0;
        };
        class AmovPercMtacSrasWpstDf: AmovPercMwlkSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDfl: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDl: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDb: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDbl: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDbr: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDr: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMtacSrasWpstDfr: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AmovPercMrunSrasWpstDf: AmovPercMstpSrasWpstDnon {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDf: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDfl: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDfl: AmovPercMrunSrasWpstDfl {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDl: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDl: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDb: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDb: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDbl: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDbl: AmovPercMrunSrasWpstDbl {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDbr: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDbr: AmovPercMrunSrasWpstDbr {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDr: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDr: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AmovPercMrunSrasWpstDfr: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPercMrunSlowWpstDfr: AmovPercMrunSrasWpstDfr {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDf: AmovPknlMstpSrasWpstDnon {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDfl: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDl: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDb: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDbl: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDbr: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDr: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPknlMwlkSrasWpstDfr: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AmovPknlMrunSrasWpstDf: AidlPknlMstpSrasWpstDnon_G0S {
            stamina=-0.3;
        };
        class AmovPknlMstpSlowWpstDnon_AmovPknlMrunSrasWpstDf: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDfl: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDl: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDb: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDbl: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDbr: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDr: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWpstDfr: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AmovPknlMtacSrasWpstDf: AmovPknlMwlkSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDfl: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDl: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDb: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDbl: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDbr: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDr: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPknlMtacSrasWpstDfr: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AmovPercMrunSlowWlnrDf: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDf: AmovPercMrunSlowWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDfl: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDfl: AmovPknlMrunSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDl: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDl: AmovPknlMrunSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDbl: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPercMrunSlowWlnrDb: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDb: AmovPknlMrunSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMrunSrasWlnrDbl: AmovPknlMrunSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDbr: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDbr: AmovPknlMrunSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDr: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDr: AmovPknlMrunSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMrunSlowWlnrDfr: AmovPercMrunSlowWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMrunSrasWlnrDfr: AmovPercMrunSlowWlnrDfr {
            stamina=-0.5;
        };
        class AmovPercMevaSlowWlnrDf: AmovPercMrunSlowWlnrDf {
            stamina=-1.4;
        };
        class AmovPercMevaSlowWlnrDfr: AmovPercMevaSlowWlnrDf {
            stamina=-1.4;
        };
        class AmovPercMevaSlowWlnrDfl: AmovPercMevaSlowWlnrDf {
            stamina=-1.4;
        };
        class AmovPknlMevaSlowWlnrDf: AmovPercMrunSlowWlnrDf {
            stamina=-1.6;
        };
        class AmovPknlMevaSlowWlnrDfr: AmovPknlMevaSlowWlnrDf {
            stamina=-1.6;
        };
        class AmovPknlMevaSlowWlnrDfl: AmovPknlMevaSlowWlnrDf {
            stamina=-1.6;
        };
        class AmovPknlMwlkSrasWlnrDf: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDfl: AmovPknlMwlkSrasWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDl: AmovPknlMwlkSrasWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDb: AmovPknlMwlkSrasWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDbl: AmovPknlMwlkSrasWlnrDb {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDbr: AmovPknlMwlkSrasWlnrDb {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDr: AmovPknlMwlkSrasWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMwlkSrasWlnrDfr: AmovPknlMwlkSrasWlnrDf {
            stamina=-0.3;
        };
        class AmovPknlMtacSrasWlnrDf: AidlPknlMstpSrasWlnrDnon_G0S {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDfl: AmovPknlMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDl: AmovPknlMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDb: AmovPknlMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDbl: AmovPknlMtacSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDbr: AmovPknlMtacSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDr: AmovPknlMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMtacSrasWlnrDfr: AmovPknlMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPknlMrunSnonWnonDf: AmovPknlMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AmovPknlMwlkSnonWnonDf: AmovPknlMrunSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDbr: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDbl: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDb: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDl: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDr: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDfr: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMwlkSnonWnonDfl: AmovPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPknlMrunSnonWnonDf: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDfl: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDl: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDbl: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDb: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDbr: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDr: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWnonDfr: AmovPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AmovPpneMrunSlowWrflDf: AmovPpneMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDfl: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDl: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDbl: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDb: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDbr: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDr: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMrunSlowWrflDfr: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDf: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMevaSlowWrflDf: AmovPpneMrunSlowWrflDf {
            stamina=-1.4;
        };
        class AmovPpneMsprSlowWrflDbl: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDl: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDr: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDbr: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDb: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDf_injured: AmovPpneMstpSrasWrflDnon_injured {
            stamina=-2.6;
        };
        class AmovPpneMsprSlowWrflDfl: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AmovPpneMsprSlowWrflDfr: AmovPpneMsprSlowWrflDf {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_f: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_fl: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_fr: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_b: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_bl: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_br: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_l: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDup_r: AadjPpneMwlkSrasWrflDup_f {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDleft_l: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDleft_r: AadjPpneMwlkSrasWrflDleft_l {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDright_l: AmovPpneMrunSlowWrflDf {
            stamina=-1;
        };
        class AadjPpneMwlkSrasWrflDright_r: AadjPpneMwlkSrasWrflDright_l {
            stamina=-1;
        };
        class AmovPpneMrunSlowWpstDf: AidlPpneMstpSrasWpstDnon_G0S {
            stamina=-0.8;
        };
        class AmovPpneMsprSlowWpstDf: AmovPpneMrunSlowWpstDf {
            stamina=-1.2;
        };
        class AmovPpneMrunSlowWpstDfl: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDl: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDbl: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDb: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDbr: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDr: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AmovPpneMrunSlowWpstDfr: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDup_f: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDup_b: AadjPpneMwlkSrasWpstDup_f {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDup_l: AadjPpneMwlkSrasWpstDup_f {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDup_r: AadjPpneMwlkSrasWpstDup_f {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDleft_l: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDleft_r: AadjPpneMwlkSrasWpstDleft_l {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDright_l: AmovPpneMrunSlowWpstDf {
            stamina=-0.8;
        };
        class AadjPpneMwlkSrasWpstDright_r: AadjPpneMwlkSrasWpstDright_l {
            stamina=-0.8;
        };
        class AmovPpneMrunSnonWnonDf: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDfl: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDl: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDbl: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDb: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDbr: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDr: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWnonDfr: AmovPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AmovPpneMsprSnonWnonDf: AmovPpneMrunSnonWnonDf {
            stamina=-1;
        };
        class AmovPincMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPincMstpSrasWrflDnon_turnL: AmovPincMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPincMstpSrasWrflDnon_turnR: AmovPincMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPincMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPincMstpSrasWpstDnon_turnL: AmovPincMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPincMstpSrasWpstDnon_turnR: AmovPincMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPincMstpSnonWnonDnon: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AmovPincMstpSnonWnonDnon_turnL: AmovPincMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPincMstpSnonWnonDnon_turnR: AmovPincMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPincMrunSlowWrflDf: AmovPincMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDfl: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDl: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDbl: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDb: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDbr: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDr: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWrflDfr: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMsprSlowWrflDf: AmovPincMrunSlowWrflDf {
            stamina=0.8;
        };
        class AmovPincMrunSlowWpstDf: AmovPincMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDfl: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDl: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDbl: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDb: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDbr: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDr: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSlowWpstDfr: AmovPincMrunSlowWpstDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDf: AmovPincMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDfl: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDl: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDbl: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDb: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDbr: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDr: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class AmovPincMrunSnonWnonDfr: AmovPincMrunSnonWnonDf {
            stamina=1;
        };
        class RifleReloadProneBase: Default {
            stamina=1;
        };
        class RifleReloadProneMk20: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMk20UGL: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMX: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMXUGL: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneTRGUGL: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMXCompact: RifleReloadProneMX {
            stamina=1;
        };
        class RifleReloadProneMXSniper: RifleReloadProneMX {
            stamina=1;
        };
        class RifleReloadProneTRG: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneKatiba: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneKatibaUGL: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneM200: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneLRR: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneEBR: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneSMG_02: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneSMG_03: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneSDAR: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR02: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR03: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR04: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR05: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneDMR06: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMMG01: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneMMG02: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneGM6: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneSMG_01: RifleReloadProneBase {
            stamina=1;
        };
        class RifleReloadProneM4SSAS: RifleReloadProneBase {
            stamina=1;
        };
        class PistolReloadProneBase: RifleReloadProneBase {
            stamina=1;
        };
        class PistolReloadProne: PistolReloadProneBase {
            stamina=1;
        };
        class PistolHeavy02ReloadProne: PistolReloadProneBase {
            stamina=1;
        };
        class PistolReloadProneFlaregun: PistolReloadProneBase {
            stamina=1;
        };
        class WeaponMagazineReloadStand: Default {
            stamina=1;
        };
        class WeaponMagazineReloadKneel: WeaponMagazineReloadStand {
            stamina=1;
        };
        class WeaponMagazineReloadProne: WeaponMagazineReloadStand {
            stamina=1;
        };
        class PistolMagazineReloadStand: Default {
            stamina=1;
        };
        class PistolMagazineReloadKneel: PistolMagazineReloadStand {
            stamina=1;
        };
        class PistolMagazineReloadProne: PistolMagazineReloadStand {
            stamina=1;
        };
        class LauncherReloadKneel: Default {
            stamina=1;
        };
        class LauncherReloadStand: LauncherReloadKneel {
            stamina=1;
        };
        class TransAnimBase: Default {
            stamina=0.5;
        };
        class TransAnimBase_noIK: TransAnimBase {
            stamina=0.5;
        };
        class AadjPpneMstpSrasWrflDup_AadjPknlMstpSrasWrflDdown: AadjPknlMstpSrasWrflDdown {
            stamina=-0.2;
        };
        class AadjPknlMstpSrasWrflDdown_AadjPpneMstpSrasWrflDup: AadjPpneMstpSrasWrflDup {
            stamina=-0.2;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSlowWpstDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSnonWnonDnon_end: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon_end: AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSlowWlnrDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSlowWlnrDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon_end: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase_noIK {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon: TransAnimBase {
            stamina=-0.6;
        };
        class AmovPpneMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase {
            stamina=-2;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPpneMstpSrasWlnrDnon: TransAnimBase {
            stamina=-0.8;
        };
        class AmovPpneMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon: TransAnimBase {
            stamina=-1;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase {
            stamina=-0.8;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPpneMstpSnonWnonDnon: TransAnimBase {
            stamina=-2;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPpneMstpSnonWnonDnon: AmovPercMstpSrasWlnrDnon_AmovPpneMstpSnonWnonDnon {
            stamina=-2;
        };
        class AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AinvPercMstpSrasWrflDnon_Putdown: AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon_Putdown {
            stamina=0.3;
        };
        class AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AinvPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AinvPercMstpSrasWrflDnon_G01: AmovPercMstpSrasWrflDnon_AinvPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AinvPercMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWrflDnon_Putdown: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon_Putdown {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWrflDnon_G01: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon_Putdown: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AinvPpneMstpSrasWrflDnon_Putdown: AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon_Putdown {
            stamina=0.8;
        };
        class AinvPpneMstpSrasWrflDnon_Putdown_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AinvPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AinvPpneMstpSrasWrflDnon_G01: AmovPpneMstpSrasWrflDnon_AinvPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AinvPpneMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AinvPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AinvPercMstpSrasWpstDnon_G01: AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AinvPercMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSrasWpstDnon_G01: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPpneMstpSrasWpstDnon_AinvPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon_AinvPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPpneMstpSrasWpstDnon_G01: AmovPpneMstpSrasWpstDnon_AinvPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPpneMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPercMstpSrasWpstDnon_AinvPercMstpSrasWpstDnon_Putdown: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AinvPercMstpSrasWpstDnon_Putdown_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWpstDnon_AinvPknlMstpSrasWpstDnon_Putdown: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSrasWpstDnon_Putdown_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPpneMstpSrasWpstDnon_AinvPpneMstpSrasWpstDnon_Putdown: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPpneMstpSrasWpstDnon_Putdown_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPercMstpSnonWnonDnon_G01: AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon_G01: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_AinvPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_AinvPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPpneMstpSnonWnonDnon_G01: AmovPpneMstpSnonWnonDnon_AinvPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPpneMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPercMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=-0.4;
        };
        class AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon: AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=-0.5;
        };
        class AmovPercMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon: AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSlowWrflDnon_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon: TransAnimBase {
            stamina=-1;
        };
        class AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon_2: AmovPercMsprSlowWrflDf_AmovPpneMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=-2;
        };
        class AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon_end: AmovPpneMstpSrasWrflDnon {
            stamina=-2;
        };
        class AmovPercMrunSlowWrflDf_AmovPpneMstpSrasWrflDnon_old: AmovPpneMstpSrasWrflDnon {
            stamina=-2;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=-0.6;
        };
        class AmovPknlMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon {
            stamina=-0.6;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=-0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMsprSrasWrflDf: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPercMsprSrasWrflDf_2: AmovPknlMstpSrasWrflDnon_AmovPknlMsprSrasWrflDf {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=-2;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPercMsprSlowWrflDf: TransAnimBase {
            stamina=-2;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPercMsprSlowWrflDf_2: AmovPpneMstpSrasWrflDnon_AmovPercMsprSlowWrflDf {
            stamina=-2;
        };
        class AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPercMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=-0.2;
        };
        class AmovPercMstpSlowWpstDnon_AmovPknlMstpSlowWpstDnon: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon: TransAnimBase {
            stamina=-0.8;
        };
        class AmovPercMsprSlowWpstDf_AmovPpneMstpSrasWpstDnon_2: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPercMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AmovPercMstpSlowWpstDnon_AmovPpneMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AmovPknlMstpSlowWpstDnon_AmovPpneMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AmovPknlMstpSlowWpstDnon_AmovPercMstpSlowWpstDnon: AmovPercMstpSlowWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPercMsprSrasWpstDf: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=-0.2;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=-1;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=-0.8;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPercMsprSlowWpstDf: TransAnimBase {
            stamina=-2;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPercMsprSlowWpstDf_2: AmovPpneMstpSrasWpstDnon_AmovPercMsprSlowWpstDf {
            stamina=-2;
        };
        class AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon: TransAnimBase {
            stamina=-0.6;
        };
        class AmovPercMsprSnonWnonDf_AmovPpneMstpSnonWnonDnon_2: AmovPpneMstpSnonWnonDnon {
            stamina=-2;
        };
        class AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=-0.6;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPercMsprSnonWnonDf: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPercMsprSnonWnonDf_2: AmovPknlMstpSnonWnonDnon_AmovPercMsprSnonWnonDf {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=-1;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPercMsprSnonWnonDf: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPercMsprSnonWnonDf_2: AmovPpneMstpSnonWnonDnon_AmovPercMsprSnonWnonDf {
            stamina=0.5;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon {
            stamina=-0.5;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWpstDnon: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWpstDnon_end: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=-1;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon: TransAnimBase {
            stamina=-1.5;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWlnrDnon: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWlnrDnon_end: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end {
            stamina=-1;
        };
        class AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPpneMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon {
            stamina=-0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=-1;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon: TransAnimBase {
            stamina=-1.5;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon_end: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon_end: TransAnimBase {
            stamina=-0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWlnrDnon: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWlnrDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon_end {
            stamina=-1;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMstpSnonWnonDnon_end: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPknlMstpSrasWrflDnon: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPknlMstpSrasWrflDnon_end: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=-1;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPknlMstpSrasWpstDnon: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon {
            stamina=-1;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPknlMstpSrasWpstDnon_end: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=-1;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPercMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWrflDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWrflDnon_end: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWrflDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWrflDnon_end: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWpstDnon_end: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWpstDnon_end: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSnonWnonDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSnonWnonDnon_end: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSnonWnonDnon_end: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSnonWnonDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AmovPpneMstpSnonWnonDnon_end: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWrflDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end: AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWpstDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWpstDnon_end: AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AmovPercMstpSnonWnonDnon_AmovPknlMstpSrasWlnrDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPercMevaSrasWrflDf: SprintBaseDf {
            stamina=-1;
        };
        class AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AmovPercMevaSrasWrflDfr_AmovPknlMstpSrasWrflDnon: AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPercMevaSrasWrflDfl_AmovPknlMstpSrasWrflDnon: AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon {
            stamina=-1;
        };
        class AmovPknlMevaSrasWrflDf: AmovPercMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AmovPercMevaSlowWrflDf: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AidlPercMevaSrasWrflDf: AmovPercMevaSlowWrflDf {
            stamina=-1;
        };
        class AidlPercMwlkSrasWrflDb: AmovPercMwlkSlowWrflDb {
            stamina=0.3;
        };
        class AmovPercMevaSrasWrflDfl: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AmovPknlMevaSrasWrflDfl: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AmovPercMevaSlowWrflDfl: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AmovPercMevaSrasWrflDfr: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AmovPercMevaSrasWrflDr: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AmovPercMevaSrasWrflDl: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AmovPknlMevaSrasWrflDr: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AmovPknlMevaSrasWrflDl: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AmovPknlMevaSrasWrflDfr: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AmovPercMevaSlowWrflDfr: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AmovPknlMevaSlowWrflDf: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AmovPknlMevaSlowWrflDfl: AmovPknlMevaSrasWrflDfl {
            stamina=-1.2;
        };
        class AmovPknlMevaSlowWrflDfr: AmovPknlMevaSrasWrflDfr {
            stamina=-1;
        };
        class AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl: AmovPpneMstpSrasWrflDnon {
            stamina=-3;
        };
        class AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr: AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl {
            stamina=-3;
        };
        class AmovPercMevaSrasWpstDf: SprintCivilBaseDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSrasWpstDf: AmovPercMevaSrasWpstDf {
            stamina=-1;
        };
        class AmovPercMevaSlowWpstDf: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AmovPercMevaSrasWpstDfl: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSrasWpstDfl: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AmovPercMevaSlowWpstDfl: AmovPercMevaSrasWpstDfl {
            stamina=-0.8;
        };
        class AmovPercMevaSrasWpstDfr: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSrasWpstDfr: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AmovPercMevaSlowWpstDfr: AmovPercMevaSrasWpstDfr {
            stamina=-0.8;
        };
        class AmovPercMevaSrasWpstDr: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AmovPercMevaSrasWpstDl: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AmovPknlMevaSrasWpstDr: AmovPknlMrunSrasWpstDr {
            stamina=-0.3;
        };
        class AmovPknlMevaSrasWpstDl: AmovPknlMrunSrasWpstDl {
            stamina=-0.3;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMevaSlowWpstDl: AmovPpneMstpSrasWpstDnon {
            stamina=-2.5;
        };
        class AmovPpneMstpSrasWpstDnon_AmovPpneMevaSlowWpstDr: AmovPpneMstpSrasWpstDnon_AmovPpneMevaSlowWpstDl {
            stamina=-2.5;
        };
        class AmovPercMevaSnonWnonDf: SprintCivilBaseDf {
            stamina=-0.6;
        };
        class AmovPercMevaSnonWnonDfl: AmovPercMevaSnonWnonDf {
            stamina=-0.6;
        };
        class AmovPercMevaSnonWnonDfr: AmovPercMevaSnonWnonDf {
            stamina=-0.6;
        };
        class AmovPknlMevaSnonWnonDf: SprintCivilBaseDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSnonWnonDfl: AmovPknlMevaSnonWnonDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSnonWnonDfr: AmovPknlMevaSnonWnonDf {
            stamina=-0.8;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDl: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=-2;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDr: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=-2;
        };
        class CutSceneAnimationBase: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class CutSceneAnimationBaseAbuse: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_exercisekneeBendA: CutSceneAnimationBase {
            stamina=-0.55;
        };
        class AmovPercMstpSnonWnonDnon_exercisekneeBendB: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_exercisePushup: CutSceneAnimationBase {
            stamina=-0.5;
        };
        class AmovPercMstpSnonWnonDnon_exerciseKata: CutSceneAnimationBase {
            stamina=0.8;
        };
        class CutSceneAnimationBaseSit: CutSceneAnimationBase {
            stamina=0.8;
        };
        class CutSceneAnimationBaseZoZo: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_Scared: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_Scared2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSlowWrflDnon_SaluteIn: AidlPercMstpSlowWrflDnon_G0S {
            stamina=0.4;
        };
        class AidlPercMstpSrasWrflDnon_SaluteIn: AmovPercMstpSlowWrflDnon_SaluteIn {
            stamina=0.4;
        };
        class AmovPercMstpSlowWrflDnon_Salute: AmovPercMstpSlowWrflDnon_SaluteIn {
            stamina=0.4;
        };
        class AidlPercMstpSrasWrflDnon_Salute: AmovPercMstpSlowWrflDnon_Salute {
            stamina=0.4;
        };
        class AmovPercMstpSlowWrflDnon_SaluteOut: AmovPercMstpSlowWrflDnon_SaluteIn {
            stamina=0.4;
        };
        class AidlPercMstpSrasWrflDnon_SaluteOut: AmovPercMstpSlowWrflDnon_SaluteOut {
            stamina=0.4;
        };
        class AmovPercMstpSrasWrflDnon_SaluteIn: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_Salute: AmovPercMstpSrasWrflDnon_SaluteIn {
            stamina=0.3;
        };
        class AmovPercMstpSrasWrflDnon_SaluteOut: AmovPercMstpSrasWrflDnon_SaluteIn {
            stamina=0.3;
        };
        class AmovPercMstpSrasWpstDnon_SaluteIn: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_SaluteIn_end: AmovPercMstpSrasWpstDnon_SaluteIn {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_Salute: AmovPercMstpSrasWpstDnon_SaluteIn_end {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_SaluteOut: AmovPercMstpSrasWpstDnon_SaluteIn_end {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_SaluteOut_end: AmovPercMstpSrasWpstDnon_SaluteOut {
            stamina=0.4;
        };
        class AmovPercMstpSnonWnonDnon_SaluteIn: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_Salute: AmovPercMstpSnonWnonDnon_SaluteIn {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_SaluteOut: AmovPercMstpSnonWnonDnon_SaluteIn {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_EaseIn: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_Ease: AmovPercMstpSnonWnonDnon_EaseIn {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_EaseOut: AmovPercMstpSnonWnonDnon_EaseIn {
            stamina=0.8;
        };
        class AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPsitMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPsitMstpSlowWrflDnon_WeaponCheck1: AmovPsitMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPsitMstpSlowWrflDnon_WeaponCheck2: AmovPsitMstpSlowWrflDnon_WeaponCheck1 {
            stamina=0.4;
        };
        class AmovPsitMstpSlowWrflDnon_Smoking: AmovPsitMstpSlowWrflDnon_WeaponCheck1 {
            stamina=0.4;
        };
        class AmovPsitMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMstpSlowWrflDnon_AmovPsitMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon_AmovPsitMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon_trans: AmovPsitMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon_WeaponCheck1: AmovPsitMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon_WeaponCheck2: AmovPsitMstpSrasWrflDnon_WeaponCheck1 {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon_Smoking: AmovPsitMstpSrasWrflDnon_WeaponCheck1 {
            stamina=0.3;
        };
        class AmovPsitMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon: AmovPsitMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWpstDnon_ground: AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWpstDnon_smoking: AmovPsitMstpSnonWpstDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWpstDnon_AmovPercMstpSnonWpstDnon_ground: AmovPercMstpSnonWpstDnon_AmovPsitMstpSnonWpstDnon_ground {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPpneMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AmovPsitMstpSnonWnonDnon_ground: AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWnonDnon_smoking_trans: AmovPsitMstpSnonWnonDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWnonDnon_smoking: AmovPsitMstpSnonWnonDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_ground: AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground {
            stamina=0.8;
        };
        class AmovPsitMstpSnonWnonDnon_ground_AmovPpneMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AmovPsitMstpSnonWnonDnon_ground {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon: CutSceneAnimationBase {
            stamina=0.8;
        };
        class AmovPercMstpSsurWnonDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
            stamina=0.8;
        };
        class AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon {
            stamina=0.8;
        };
        class TestDance: AmovPercMstpSrasWrflDnon {
            stamina=0.7;
        };
        class TestSurrender: TestDance {
            stamina=1;
        };
        class AwopPercMstpSgthWrflDnon_Start1: Default {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWrflDnon_Throw1: AwopPercMstpSgthWrflDnon_Start1 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWrflDnon_End1: AwopPercMstpSgthWrflDnon_Start1 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWrflDnon_Start2: AwopPercMstpSgthWrflDnon_Start1 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWrflDnon_Throw2: AwopPercMstpSgthWrflDnon_Throw1 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWrflDnon_End2: AwopPercMstpSgthWrflDnon_End1 {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthStart: Default {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthThrow: AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthStart {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthEnd: AmovPercMrunSlowWrflDf_AmovPercMstpSrasWrflDnon_gthThrow {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart: Default {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthThrow: AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthStart {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthEnd: AmovPercMwlkSrasWrflDf_AmovPercMstpSrasWrflDnon_gthThrow {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWrflDnon_Start: Default {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWrflDnon_Throw: AwopPknlMstpSgthWrflDnon_Start {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWrflDnon_End: AwopPknlMstpSgthWrflDnon_Start {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWrflDnon_Fast_Start: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWrflDnon_Fast_End: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AwopPpneMstpSgthWpstDnon_Fast_Start: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Fast_Start_1: AwopPpneMstpSgthWpstDnon_Fast_Start {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Fast_End: AwopPpneMstpSgthWpstDnon_Fast_Start_1 {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Fast_End_1: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AwopPpneMstpSgthWnonDnon_Fast_Start: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWnonDnon_Fast_End: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AwopPpneMstpSgthWrflDnon_Start: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWrflDnon_Throw: AwopPpneMstpSgthWrflDnon_Start {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWrflDnon_End: AwopPpneMstpSgthWrflDnon_Start {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWpstDnon_Part1: Default {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWpstDnon_Part2: AwopPercMstpSgthWpstDnon_Part1 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWpstDnon_Part3: AwopPercMstpSgthWpstDnon_Part2 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWpstDnon_Part4: AwopPercMstpSgthWpstDnon_Part3 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWpstDnon_Part5: AwopPercMstpSgthWpstDnon_Part4 {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthStart: Default {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthThrow: AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthStart {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthArm: AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthThrow {
            stamina=-0.6;
        };
        class AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthEnd: AmovPercMrunSlowWpstDf_AmovPercMstpSrasWpstDnon_gthArm {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf_AwopPercMrunSgthWnonDf_1: Default {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthStart: Default {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthThrow: AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthStart {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthArm: AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthThrow {
            stamina=-0.6;
        };
        class AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthEnd: AmovPercMwlkSrasWpstDf_AmovPercMstpSrasWpstDnon_gthArm {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWpstDnon_Part1: Default {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWpstDnon_Part2: AwopPknlMstpSgthWpstDnon_Part1 {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWpstDnon_Part3: AwopPknlMstpSgthWpstDnon_Part2 {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWpstDnon_Part4: AwopPknlMstpSgthWpstDnon_Part3 {
            stamina=-0.6;
        };
        class AwopPknlMstpSgthWpstDnon_Part5: AwopPknlMstpSgthWpstDnon_Part4 {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Part1: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Part2: AwopPpneMstpSgthWpstDnon_Part1 {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Part3: AwopPpneMstpSgthWpstDnon_Part2 {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Part4: AwopPpneMstpSgthWpstDnon_Part3 {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWpstDnon_Part5: AwopPpneMstpSgthWpstDnon_Part4 {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWnonDnon_start: Default {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWnonDnon_throw: AwopPercMstpSgthWnonDnon_start {
            stamina=-0.6;
        };
        class AwopPercMstpSgthWnonDnon_end: AwopPercMstpSgthWnonDnon_throw {
            stamina=-0.6;
        };
        class AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthStart: Default {
            stamina=-0.6;
        };
        class AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthThrow: AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthStart {
            stamina=-0.6;
        };
        class AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthEnd: AmovPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon_gthThrow {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWnonDnon_start: Default {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWnonDnon_throw: AwopPpneMstpSgthWnonDnon_start {
            stamina=-0.6;
        };
        class AwopPpneMstpSgthWnonDnon_end: AwopPpneMstpSgthWnonDnon_throw {
            stamina=-0.6;
        };
        class LadderCivilStatic: StandBase {
            stamina=0.4;
        };
        class LadderCivilOn_Top: LadderCivilStatic {
            stamina=0.4;
        };
        class LadderCivilOn_Bottom: LadderCivilStatic {
            stamina=0.4;
        };
        class LadderCivilUpLoop: LadderCivilStatic {
            stamina=-0.4;
        };
        class LadderCivilTopOff: LadderCivilUpLoop {
            stamina=-0.4;
        };
        class LadderCivilDownOff: LadderCivilTopOff {
            stamina=-0.4;
        };
        class LadderCivilDownLoop: LadderCivilUpLoop {
            stamina=0;
        };
        class LadderRifleStatic: LadderCivilStatic {
            stamina=0.4;
        };
        class LadderRifleOn: LadderCivilOn_Top {
            stamina=0.4;
        };
        class LadderRifleTopOff: LadderCivilTopOff {
            stamina=-0.4;
        };
        class LadderRifleDownOff: LadderRifleTopOff {
            stamina=-0.4;
        };
        class LadderRifleUpLoop: LadderCivilUpLoop {
            stamina=-0.4;
        };
        class LadderRifleDownLoop: LadderCivilDownLoop {
            stamina=0;
        };
        class AswmPercMstpSnonWnonDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.2;
        };
        class AswmPercMstpSnonWnonDnon_AswmPercMstpSnonWnonDnon_putDown: AswmPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AswmPercMstpSnonWnonDnon_putDown_AswmPercMstpSnonWnonDnon: AswmPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AswmPercMstpSnonWnonDnon_goup: AswmPercMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AswmPercMstpSnonWnonDnon_godown: AswmPercMstpSnonWnonDnon {
            stamina=-0.8;
        };
        class AswmPercMstpSnonWnonDnon_relax: AswmPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AswmPercMstpSnonWnonDnon_putDown: AswmPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AswmPercMrunSnonWnonDf: AswmPercMstpSnonWnonDnon {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDf: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMrunSnonWnonDfl: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDfl: AswmPercMrunSnonWnonDfl {
            stamina=-0.6;
        };
        class AswmPercMrunSnonWnonDfr: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDfr: AswmPercMrunSnonWnonDfr {
            stamina=-0.6;
        };
        class AswmPercMrunSnonWnonDl: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDl: AswmPercMrunSnonWnonDl {
            stamina=-0.6;
        };
        class AswmPercMrunSnonWnonDr: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDr: AswmPercMrunSnonWnonDr {
            stamina=-0.6;
        };
        class AswmPercMrunSnonWnonDb: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMwlkSnonWnonDb: AswmPercMrunSnonWnonDb {
            stamina=-0.6;
        };
        class AswmPercMsprSnonWnonDf: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AswmPercMsprSnonWnonDFl: AswmPercMrunSnonWnonDfl {
            stamina=-0.6;
        };
        class AswmPercMsprSnonWnonDFr: AswmPercMrunSnonWnonDfr {
            stamina=-0.6;
        };
        class AswmPercMstpSnonWnonDnon_AswmPercMrunSnonWnonDf: AswmPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AswmPercMrunSnonWnonDf_AswmPercMstpSnonWnonDnon: AswmPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AsswPercMstpSnonWnonDnon: AswmPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsswPercMstpSnonWnonDnon_goup: AsswPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AsswPercMstpSnonWnonDnon_goDown: AsswPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AsswPercMstpSnonWnonDnon_relax: AsswPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsswPercMstpSnonWnonDnon_putDown: AsswPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AsswPercMrunSnonWnonDf: AsswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDf: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMrunSnonWnonDfl: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDfl: AsswPercMrunSnonWnonDfl {
            stamina=-0.3;
        };
        class AsswPercMrunSnonWnonDfr: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDfr: AsswPercMrunSnonWnonDfr {
            stamina=-0.3;
        };
        class AsswPercMrunSnonWnonDl: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDl: AsswPercMrunSnonWnonDl {
            stamina=-0.3;
        };
        class AsswPercMrunSnonWnonDr: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDr: AsswPercMrunSnonWnonDr {
            stamina=-0.3;
        };
        class AsswPercMrunSnonWnonDb: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMwlkSnonWnonDb: AsswPercMrunSnonWnonDb {
            stamina=-0.3;
        };
        class AsswPercMsprSnonWnonDf: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AsswPercMsprSnonWnonDFl: AsswPercMrunSnonWnonDfl {
            stamina=-0.3;
        };
        class AsswPercMsprSnonWnonDFr: AsswPercMrunSnonWnonDfr {
            stamina=-0.3;
        };
        class AsswPercMstpSnonWnonDnon_AsswPercMrunSnonWnonDf: AsswPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AsswPercMrunSnonWnonDf_AsswPercMstpSnonWnonDnon: AsswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMstpSnonWnonDnon: AswmPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AbswPercMstpSnonWnonDnon_relax: AbswPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AbswPercMstpSnonWnonDnon_goup: AbswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AbswPercMstpSnonWnonDnon_goDown: AbswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AbswPercMstpSnonWnonDnon_putDown: AbswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDf: AbswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDf: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDfl: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDfl: AbswPercMrunSnonWnonDfl {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDfr: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDfr: AbswPercMrunSnonWnonDfr {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDl: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDl: AbswPercMrunSnonWnonDl {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDr: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDr: AbswPercMrunSnonWnonDr {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDb: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMwlkSnonWnonDb: AbswPercMrunSnonWnonDb {
            stamina=-0.3;
        };
        class AbswPercMsprSnonWnonDf: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AbswPercMsprSnonWnonDFl: AbswPercMrunSnonWnonDfl {
            stamina=-0.3;
        };
        class AbswPercMsprSnonWnonDFr: AbswPercMrunSnonWnonDfr {
            stamina=-0.3;
        };
        class AbswPercMstpSnonWnonDnon_AbswPercMrunSnonWnonDf: AbswPercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AbswPercMrunSnonWnonDf_AbswPercMstpSnonWnonDnon: AbswPercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMstpSnonWnonDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMstpSnonWnonDnon_putDown: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_putDown_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_relax: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_GetInSDV: AdvePercMstpSnonWnonDnon {
            stamina=-0.5;
        };
        class AdvePercMstpSnonWnonDnon_GetOutSDV: AdvePercMstpSnonWnonDnon {
            stamina=-0.5;
        };
        class AdvePercMstpSnonWnonDnon_goup: AdvePercMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AdvePercMstpSnonWnonDnon_godown: AdvePercMstpSnonWnonDnon {
            stamina=-0.8;
        };
        class AmovPercMwlkSrasWrflDf_AdvePercMrunSnonWnonDf: AmovPercMstpSrasWrflDnon {
            stamina=-0.06;
        };
        class AmovPercMwlkSnonWnonDf_AdvePercMrunSnonWnonDf: AmovPercMwlkSrasWrflDf_AdvePercMrunSnonWnonDf {
            stamina=-0.06;
        };
        class AdvePercMstpSnonWnonDnon_turnL: AdvePercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_turnR: AdvePercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDf: AdvePercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDfr: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDfl: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDb: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDbr: AdvePercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDbl: AdvePercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDl: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDr: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDf: AdvePercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDfr: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDfl: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDb: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDbr: AdvePercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDbl: AdvePercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDl: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDr: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMrunSnonWnonDf: AdvePercMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDfr: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDfl: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDb: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDbr: AdvePercMrunSnonWnonDb {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDbl: AdvePercMrunSnonWnonDb {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDl: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMrunSnonWnonDr: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMsprSnonWnonDf: AdvePercMrunSnonWnonDf {
            stamina=-0.8;
        };
        class AdvePercMstpSnonWrflDnon: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AdvePercMstpSnonWrflDnon_AdvePercMstpSnonWrflDnon_putDown: AdvePercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWrflDnon_putDown_AdvePercMstpSnonWrflDnon: AdvePercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWrflDnon_relax: AdvePercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWrflDnon_GetInSDV: AdvePercMstpSnonWrflDnon {
            stamina=-0.5;
        };
        class AdvePercMstpSnonWrflDnon_GetOutSDV: AdvePercMstpSnonWrflDnon {
            stamina=-0.5;
        };
        class AdvePercMstpSnonWrflDnon_goup: AdvePercMstpSnonWrflDnon {
            stamina=-0.6;
        };
        class AdvePercMstpSnonWrflDnon_godown: AdvePercMstpSnonWrflDnon {
            stamina=-1;
        };
        class AmovPercMwlkSrasWrflDf_AdvePercMrunSnonWrflDf: AmovPercMstpSrasWrflDnon {
            stamina=-0.06;
        };
        class AdvePercMstpSnonWrflDnon_turnL: AdvePercMstpSnonWrflDnon {
            stamina=0.1;
        };
        class AdvePercMstpSnonWrflDnon_turnR: AdvePercMstpSnonWrflDnon {
            stamina=0.1;
        };
        class AdvePercMwlkSnonWrflDf: AdvePercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDfr: AdvePercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDfl: AdvePercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDb: AdvePercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDbr: AdvePercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDbl: AdvePercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDl: AdvePercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWrflDr: AdvePercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDf: AdvePercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDfr: AdvePercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDfl: AdvePercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDb: AdvePercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDbr: AdvePercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDbl: AdvePercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDl: AdvePercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMtacSnonWrflDr: AdvePercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AdvePercMrunSnonWrflDf: AdvePercMstpSnonWrflDnon {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDfr: AdvePercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDfl: AdvePercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDb: AdvePercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDbr: AdvePercMrunSnonWrflDb {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDbl: AdvePercMrunSnonWrflDb {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDl: AdvePercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMrunSnonWrflDr: AdvePercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMsprSnonWrflDf: AdvePercMrunSnonWrflDf {
            stamina=-1;
        };
        class AsdvPercMstpSnonWnonDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMstpSnonWnonDnon_putDown: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_putDown_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_relax: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_GetInSDV: AsdvPercMstpSnonWnonDnon {
            stamina=-0.5;
        };
        class AsdvPercMstpSnonWnonDnon_GetOutSDV: AsdvPercMstpSnonWnonDnon {
            stamina=-0.5;
        };
        class AsdvPercMstpSnonWnonDnon_goup: AsdvPercMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AsdvPercMstpSnonWnonDnon_godown: AsdvPercMstpSnonWnonDnon {
            stamina=-0.8;
        };
        class AsdvPercMstpSnonWnonDnon_turnL: AsdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_turnR: AsdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDf: AsdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDfr: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDfl: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDb: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDbr: AsdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDbl: AsdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDl: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDr: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDf: AsdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDfr: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDfl: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDb: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDbr: AsdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDbl: AsdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDl: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDr: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMrunSnonWnonDf: AsdvPercMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDfr: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDfl: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDb: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDbr: AsdvPercMrunSnonWnonDb {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDbl: AsdvPercMrunSnonWnonDb {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDl: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMrunSnonWnonDr: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMsprSnonWnonDf: AsdvPercMrunSnonWnonDf {
            stamina=-0.8;
        };
        class AsdvPercMstpSnonWrflDnon: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWrflDnon_AsdvPercMstpSnonWrflDnon_putDown: AsdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWrflDnon_putDown_AsdvPercMstpSnonWrflDnon: AsdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWrflDnon_relax: AsdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWrflDnon_GetInSDV: AsdvPercMstpSnonWrflDnon {
            stamina=-0.5;
        };
        class AsdvPercMstpSnonWrflDnon_GetOutSDV: AsdvPercMstpSnonWrflDnon {
            stamina=-0.5;
        };
        class AsdvPercMstpSnonWrflDnon_goup: AsdvPercMstpSnonWrflDnon {
            stamina=-0.6;
        };
        class AsdvPercMstpSnonWrflDnon_godown: AsdvPercMstpSnonWrflDnon {
            stamina=-1;
        };
        class AsdvPercMstpSnonWrflDnon_turnL: AsdvPercMstpSnonWrflDnon {
            stamina=0.1;
        };
        class AsdvPercMstpSnonWrflDnon_turnR: AsdvPercMstpSnonWrflDnon {
            stamina=0.1;
        };
        class AsdvPercMwlkSnonWrflDf: AsdvPercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDfr: AsdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDfl: AsdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDb: AsdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDbr: AsdvPercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDbl: AsdvPercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDl: AsdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWrflDr: AsdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDf: AsdvPercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDfr: AsdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDfl: AsdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDb: AsdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDbr: AsdvPercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDbl: AsdvPercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDl: AsdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWrflDr: AsdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AsdvPercMrunSnonWrflDf: AsdvPercMstpSnonWrflDnon {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDfr: AsdvPercMrunSnonWrflDf {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDfl: AsdvPercMrunSnonWrflDf {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDb: AsdvPercMrunSnonWrflDf {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDbr: AsdvPercMrunSnonWrflDb {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDbl: AsdvPercMrunSnonWrflDb {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDl: AsdvPercMrunSnonWrflDf {
            stamina=-0.4;
        };
        class AsdvPercMrunSnonWrflDr: AsdvPercMrunSnonWrflDf {
            stamina=-0.4;
        };
        class AsdvPercMsprSnonWrflDf: AsdvPercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AbdvPercMstpSnonWnonDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMstpSnonWnonDnon_putDown: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_putDown_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_relax: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_GetInSDV: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWnonDnon_GetOutSDV: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWnonDnon_goup: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWnonDnon_godown: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWnonDnon_turnL: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWnonDnon_turnR: AbdvPercMstpSnonWnonDnon {
            stamina=-0.06;
        };
        class AbdvPercMwlkSnonWnonDf: AbdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDfr: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDfl: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDb: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDbr: AbdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDbl: AbdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDl: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDr: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDf: AbdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDfr: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDfl: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDb: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDbr: AbdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDbl: AbdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDl: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDr: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDf: AbdvPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDfr: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDfl: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDb: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDbr: AbdvPercMrunSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDbl: AbdvPercMrunSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDl: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWnonDr: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMsprSnonWnonDf: AbdvPercMrunSnonWnonDf {
            stamina=-0.6;
        };
        class AbdvPercMstpSnonWrflDnon: AidlPercMstpSrasWrflDnon_G0S {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWrflDnon_AbdvPercMstpSnonWrflDnon_putDown: AbdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWrflDnon_putDown_AbdvPercMstpSnonWrflDnon: AbdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWrflDnon_relax: AbdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWrflDnon_GetInSDV: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWrflDnon_GetOutSDV: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWrflDnon_goup: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWrflDnon_godown: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWrflDnon_turnL: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMstpSnonWrflDnon_turnR: AbdvPercMstpSnonWrflDnon {
            stamina=-0.06;
        };
        class AbdvPercMwlkSnonWrflDf: AbdvPercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDfr: AbdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDfl: AbdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDb: AbdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDbr: AbdvPercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDbl: AbdvPercMwlkSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDl: AbdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWrflDr: AbdvPercMwlkSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDf: AbdvPercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDfr: AbdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDfl: AbdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDb: AbdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDbr: AbdvPercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDbl: AbdvPercMtacSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDl: AbdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWrflDr: AbdvPercMtacSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDf: AbdvPercMstpSnonWrflDnon {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDfr: AbdvPercMrunSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDfl: AbdvPercMrunSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDb: AbdvPercMrunSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDbr: AbdvPercMrunSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDbl: AbdvPercMrunSnonWrflDb {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDl: AbdvPercMrunSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMrunSnonWrflDr: AbdvPercMrunSnonWrflDf {
            stamina=0.2;
        };
        class AbdvPercMsprSnonWrflDf: AbdvPercMrunSnonWrflDf {
            stamina=-0.6;
        };
        class AdvePercMstpSnonWrflDnon_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMstpSnonWrflDnon: AdvePercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWrflDnon_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMstpSnonWrflDnon: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWrflDnon_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWrflDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMstpSnonWrflDnon: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AmovPercMstpSoptWbinDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDf: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDfr: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDr: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDbr: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDb: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDbl: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDl: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDfl: AmovPercMwlkSoptWbinDf {
            stamina=0.4;
        };
        class AmovPercMrunSnonWbinDf: AmovPercMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDfr: AmovPercMrunSnonWbinDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDr: AmovPercMrunSnonWbinDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDb: AmovPercMrunSnonWbinDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDbr: AmovPercMrunSnonWbinDb {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDbl: AmovPercMrunSnonWbinDb {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDl: AmovPercMrunSnonWbinDf {
            stamina=-0.1;
        };
        class AmovPercMrunSnonWbinDfl: AmovPercMrunSnonWbinDf {
            stamina=-0.1;
        };
        class AmovPercMstpSoptWbinDnon_turnL: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPercMstpSoptWbinDnon_turnR: AmovPercMstpSoptWbinDnon_turnL {
            stamina=0.4;
        };
        class AmovPercMevaSnonWbinDf: AmovPercMrunSnonWbinDf {
            stamina=-0.6;
        };
        class AmovPercMevaSnonWbinDfl: AmovPercMevaSnonWbinDf {
            stamina=-0.6;
        };
        class AmovPercMevaSnonWbinDfr: AmovPercMevaSnonWbinDf {
            stamina=-0.6;
        };
        class AovrPercMstpSoptWbinDf: AmovPercMstpSoptWbinDnon {
            stamina=-2;
        };
        class AmovPknlMstpSoptWbinDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPknlMwlkSoptWbinDf: AmovPknlMstpSoptWbinDnon {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDfr: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDr: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDbr: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDb: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDbl: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDl: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMwlkSoptWbinDfl: AmovPknlMwlkSoptWbinDf {
            stamina=-0.1;
        };
        class AmovPknlMrunSnonWbinDf: AmovPknlMwlkSoptWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDfr: AmovPknlMrunSnonWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDr: AmovPknlMrunSnonWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDb: AmovPknlMrunSnonWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDbr: AmovPknlMrunSnonWbinDb {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDbl: AmovPknlMrunSnonWbinDb {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDl: AmovPknlMrunSnonWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMrunSnonWbinDfl: AmovPknlMrunSnonWbinDf {
            stamina=-0.2;
        };
        class AmovPknlMevaSnonWbinDf: AmovPknlMrunSnonWbinDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSnonWbinDfl: AmovPknlMevaSnonWbinDf {
            stamina=-0.8;
        };
        class AmovPknlMevaSnonWbinDfr: AmovPknlMevaSnonWbinDf {
            stamina=-0.8;
        };
        class AmovPknlMstpSoptWbinDnon_turnL: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSoptWbinDnon_turnR: AmovPknlMstpSoptWbinDnon_turnL {
            stamina=0.4;
        };
        class AmovPpneMstpSoptWbinDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPpneMwlkSoptWbinDf: AmovPpneMstpSoptWbinDnon {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDfr: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDr: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDbr: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDb: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDbl: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDl: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMwlkSoptWbinDfl: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDf: AmovPpneMwlkSoptWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDfr: AmovPpneMrunSnonWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDr: AmovPpneMrunSnonWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDb: AmovPpneMrunSnonWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDbr: AmovPpneMrunSnonWbinDb {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDbl: AmovPpneMrunSnonWbinDb {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDl: AmovPpneMrunSnonWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMrunSnonWbinDfl: AmovPpneMrunSnonWbinDf {
            stamina=-0.3;
        };
        class AmovPpneMevaSnonWbinDf: AmovPpneMrunSnonWbinDf {
            stamina=-1;
        };
        class AmovPpneMstpSoptWbinDnon_turnL: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AmovPpneMstpSoptWbinDnon_turnR: AmovPpneMstpSoptWbinDnon_turnL {
            stamina=0.8;
        };
        class AmovPpneMstpSoptWbinDnon_AmovPpneMevaSoptWbinDl: AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDl {
            stamina=-2;
        };
        class AmovPpneMstpSoptWbinDnon_AmovPpneMevaSoptWbinDr: AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDr {
            stamina=-2;
        };
        class AwopPercMstpSoptWbinDnon_rfl: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDf_rfl: AwopPercMstpSoptWbinDnon_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfr_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDr_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbr_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDb_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbl_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDl_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfl_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPercMrunSnonWbinDf_rfl: AmovPercMwlkSoptWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfr_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDr_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDb_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbr_rfl: AmovPercMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbl_rfl: AmovPercMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDl_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfl_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AwopPercMstpSoptWbinDnon_rfl_turnL: AwopPercMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_rfl_turnR: AwopPercMstpSoptWbinDnon_rfl_turnL {
            stamina=0.4;
        };
        class AmovPercMevaSnonWbinDf_rfl: AmovPercMrunSnonWbinDf_rfl {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfl_rfl: AmovPercMevaSnonWbinDf_rfl {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfr_rfl: AmovPercMevaSnonWbinDf_rfl {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_rfl: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AmovPknlMwlkSoptWbinDf_rfl: AwopPknlMstpSoptWbinDnon_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfr_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDr_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbr_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDb_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbl_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDl_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfl_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPknlMrunSnonWbinDf_rfl: AmovPknlMwlkSoptWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfr_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDr_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDb_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbr_rfl: AmovPknlMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbl_rfl: AmovPknlMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDl_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfl_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPknlMevaSnonWbinDf_rfl: AmovPknlMrunSnonWbinDf_rfl {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfl_rfl: AmovPknlMevaSnonWbinDf_rfl {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfr_rfl: AmovPknlMevaSnonWbinDf_rfl {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_rfl_turnL: AwopPknlMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_rfl_turnR: AwopPknlMstpSoptWbinDnon_rfl_turnL {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_rfl: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPpneMwlkSoptWbinDf_rfl: AwopPpneMstpSoptWbinDnon_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfr_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDr_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbr_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDb_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbl_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDl_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfl_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=0.1;
        };
        class AmovPpneMrunSnonWbinDf_rfl: AmovPpneMwlkSoptWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfr_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDr_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDb_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbr_rfl: AmovPpneMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbl_rfl: AmovPpneMrunSnonWbinDb_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDl_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfl_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-0.4;
        };
        class AmovPpneMevaSnonWbinDf_rfl: AmovPpneMrunSnonWbinDf_rfl {
            stamina=-1;
        };
        class AwopPpneMstpSoptWbinDnon_rfl_turnL: AwopPpneMstpSoptWbinDnon_rfl {
            stamina=0.8;
        };
        class AwopPpneMstpSoptWbinDnon_rfl_turnR: AwopPpneMstpSoptWbinDnon_rfl_turnL {
            stamina=0.8;
        };
        class AwopPercMstpSoptWbinDnon_pst: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDf_pst: AwopPercMstpSoptWbinDnon_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfr_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDr_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbr_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDb_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbl_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDl_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfl_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPercMrunSnonWbinDf_pst: AmovPercMwlkSoptWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfr_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDr_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDb_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbr_pst: AmovPercMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbl_pst: AmovPercMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDl_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfl_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AwopPercMstpSoptWbinDnon_pst_turnL: AwopPercMstpSoptWbinDnon_pst {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_pst_turnR: AwopPercMstpSoptWbinDnon_pst_turnL {
            stamina=0.4;
        };
        class AmovPercMevaSnonWbinDf_pst: AmovPercMrunSnonWbinDf_pst {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfl_pst: AmovPercMevaSnonWbinDf_pst {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfr_pst: AmovPercMevaSnonWbinDf_pst {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_pst: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMwlkSoptWbinDf_pst: AwopPknlMstpSoptWbinDnon_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfr_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDr_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbr_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDb_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbl_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDl_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfl_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPknlMrunSnonWbinDf_pst: AmovPknlMwlkSoptWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfr_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDr_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDb_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbr_pst: AmovPknlMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbl_pst: AmovPknlMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDl_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfl_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPknlMevaSnonWbinDf_pst: AmovPknlMrunSnonWbinDf_pst {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfl_pst: AmovPknlMevaSnonWbinDf_pst {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfr_pst: AmovPknlMevaSnonWbinDf_pst {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_pst_turnL: AwopPknlMstpSoptWbinDnon_pst {
            stamina=0.6;
        };
        class AwopPknlMstpSoptWbinDnon_pst_turnR: AwopPknlMstpSoptWbinDnon_pst_turnL {
            stamina=0.6;
        };
        class AwopPpneMstpSoptWbinDnon_pst: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPpneMwlkSoptWbinDf_pst: AwopPpneMstpSoptWbinDnon_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfr_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDr_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbr_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDb_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbl_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDl_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfl_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=0.1;
        };
        class AmovPpneMrunSnonWbinDf_pst: AmovPpneMwlkSoptWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfr_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDr_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDb_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbr_pst: AmovPpneMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbl_pst: AmovPpneMrunSnonWbinDb_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDl_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfl_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-0.4;
        };
        class AmovPpneMevaSnonWbinDf_pst: AmovPpneMrunSnonWbinDf_pst {
            stamina=-1;
        };
        class AwopPpneMstpSoptWbinDnon_pst_turnL: AwopPpneMstpSoptWbinDnon_pst {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_pst_turnR: AwopPpneMstpSoptWbinDnon_pst_turnL {
            stamina=1;
        };
        class AwopPercMstpSoptWbinDnon_lnr: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDf_lnr: AwopPercMstpSoptWbinDnon_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfr_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDr_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbr_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDb_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbl_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDl_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfl_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPercMrunSnonWbinDf_lnr: AmovPercMwlkSoptWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfr_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDr_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDb_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbr_lnr: AmovPercMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbl_lnr: AmovPercMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDl_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfl_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AwopPercMstpSoptWbinDnon_lnr_turnL: AwopPercMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_lnr_turnR: AwopPercMstpSoptWbinDnon_lnr_turnL {
            stamina=0.4;
        };
        class AmovPercMevaSnonWbinDf_lnr: AmovPercMrunSnonWbinDf_lnr {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfl_lnr: AmovPercMevaSnonWbinDf_lnr {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfr_lnr: AmovPercMevaSnonWbinDf_lnr {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_lnr: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AmovPknlMwlkSoptWbinDf_lnr: AwopPknlMstpSoptWbinDnon_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfr_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDr_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbr_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDb_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbl_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDl_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfl_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPknlMrunSnonWbinDf_lnr: AmovPknlMwlkSoptWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfr_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDr_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDb_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbr_lnr: AmovPknlMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbl_lnr: AmovPknlMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDl_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfl_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPknlMevaSnonWbinDf_lnr: AmovPknlMrunSnonWbinDf_lnr {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfl_lnr: AmovPknlMevaSnonWbinDf_lnr {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfr_lnr: AmovPknlMevaSnonWbinDf_lnr {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_lnr_turnL: AwopPknlMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_lnr_turnR: AwopPknlMstpSoptWbinDnon_lnr_turnL {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_lnr: AmovPpneMstpSrasWlnrDnon {
            stamina=1.2;
        };
        class AmovPpneMwlkSoptWbinDf_lnr: AwopPpneMstpSoptWbinDnon_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfr_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDr_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbr_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDb_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbl_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDl_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfl_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=0.1;
        };
        class AmovPpneMrunSnonWbinDf_lnr: AmovPpneMwlkSoptWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfr_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDr_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDb_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbr_lnr: AmovPpneMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbl_lnr: AmovPpneMrunSnonWbinDb_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDl_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfl_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-0.4;
        };
        class AmovPpneMevaSnonWbinDf_lnr: AmovPpneMrunSnonWbinDf_lnr {
            stamina=-1;
        };
        class AwopPpneMstpSoptWbinDnon_lnr_turnL: AwopPpneMstpSoptWbinDnon_lnr {
            stamina=1.2;
        };
        class AwopPpneMstpSoptWbinDnon_lnr_turnR: AwopPpneMstpSoptWbinDnon_lnr_turnL {
            stamina=1.2;
        };
        class AwopPercMstpSoptWbinDnon_non: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AmovPercMwlkSoptWbinDf_non: AwopPercMstpSoptWbinDnon_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfr_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDr_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbr_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDb_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDbl_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDl_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMwlkSoptWbinDfl_non: AmovPercMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPercMrunSnonWbinDf_non: AmovPercMwlkSoptWbinDf_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfr_non: AmovPercMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDr_non: AmovPercMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDb_non: AmovPercMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbr_non: AmovPercMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDbl_non: AmovPercMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDl_non: AmovPercMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPercMrunSnonWbinDfl_non: AmovPercMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AwopPercMstpSoptWbinDnon_non_turnL: AwopPercMstpSoptWbinDnon_non {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_non_turnR: AwopPercMstpSoptWbinDnon_non_turnL {
            stamina=0.4;
        };
        class AmovPercMevaSnonWbinDf_non: AmovPercMrunSnonWbinDf_non {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfl_non: AmovPercMevaSnonWbinDf_non {
            stamina=-1;
        };
        class AmovPercMevaSnonWbinDfr_non: AmovPercMevaSnonWbinDf_non {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_non: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMwlkSoptWbinDf_non: AwopPknlMstpSoptWbinDnon_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfr_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDr_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbr_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDb_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDbl_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDl_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMwlkSoptWbinDfl_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPknlMrunSnonWbinDf_non: AmovPknlMwlkSoptWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfr_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDr_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDb_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbr_non: AmovPknlMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDbl_non: AmovPknlMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDl_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMrunSnonWbinDfl_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPknlMevaSnonWbinDf_non: AmovPknlMrunSnonWbinDf_non {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfl_non: AmovPknlMevaSnonWbinDf_non {
            stamina=-1;
        };
        class AmovPknlMevaSnonWbinDfr_non: AmovPknlMevaSnonWbinDf_non {
            stamina=-1;
        };
        class AwopPknlMstpSoptWbinDnon_non_turnL: AwopPknlMstpSoptWbinDnon_non {
            stamina=0.6;
        };
        class AwopPknlMstpSoptWbinDnon_non_turnR: AwopPknlMstpSoptWbinDnon_non_turnL {
            stamina=0.6;
        };
        class AwopPpneMstpSoptWbinDnon_non: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPpneMwlkSoptWbinDf_non: AwopPpneMstpSoptWbinDnon_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfr_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDr_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbr_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDb_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDbl_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDl_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMwlkSoptWbinDfl_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=0.1;
        };
        class AmovPpneMrunSnonWbinDf_non: AmovPpneMwlkSoptWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfr_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDr_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDb_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbr_non: AmovPpneMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDbl_non: AmovPpneMrunSnonWbinDb_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDl_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMrunSnonWbinDfl_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-0.4;
        };
        class AmovPpneMevaSnonWbinDf_non: AmovPpneMrunSnonWbinDf_non {
            stamina=-1;
        };
        class AwopPpneMstpSoptWbinDnon_non_turnL: AwopPpneMstpSoptWbinDnon_non {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_non_turnR: AwopPpneMstpSoptWbinDnon_non_turnL {
            stamina=1;
        };
        class AmovPercMstpSoptWbinDnon_AmovPknlMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon {
            stamina=-0.1;
        };
        class AmovPercMstpSoptWbinDnon_AmovPpneMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon {
            stamina=-0.6;
        };
        class AmovPknlMstpSoptWbinDnon_AmovPercMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon {
            stamina=-0.2;
        };
        class AmovPknlMstpSoptWbinDnon_AmovPpneMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon {
            stamina=-0.1;
        };
        class AmovPpneMstpSoptWbinDnon_AmovPercMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon {
            stamina=-1;
        };
        class AmovPpneMstpSoptWbinDnon_AmovPknlMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon {
            stamina=-0.6;
        };
        class AwopPercMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_rifle: AwopPknlMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_rifle: AwopPpneMstpSoptWbinDnon_rfl {
            stamina=0.8;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_rifle: AwopPercMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_rifle: AwopPpneMstpSoptWbinDnon_rfl {
            stamina=0.8;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_rifle: AwopPercMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_rifle: AwopPknlMstpSoptWbinDnon_rfl {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_pistol: AwopPknlMstpSoptWbinDnon_pst {
            stamina=0.6;
        };
        class AwopPercMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_pistol: AwopPpneMstpSoptWbinDnon_pst {
            stamina=1;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_pistol: AwopPercMstpSoptWbinDnon_pst {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_pistol: AwopPpneMstpSoptWbinDnon_pst {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_pistol: AwopPercMstpSoptWbinDnon_pst {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_pistol: AwopPknlMstpSoptWbinDnon_pst {
            stamina=0.6;
        };
        class AwopPercMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_launcher: AwopPknlMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_launcher: AwopPpneMstpSoptWbinDnon_lnr {
            stamina=1.2;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_launcher: AwopPercMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_launcher: AwopPpneMstpSoptWbinDnon_lnr {
            stamina=1.2;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_launcher: AwopPercMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_launcher: AwopPknlMstpSoptWbinDnon_lnr {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_non: AwopPknlMstpSoptWbinDnon_non {
            stamina=0.6;
        };
        class AwopPercMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_non: AwopPpneMstpSoptWbinDnon_non {
            stamina=1;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_non: AwopPercMstpSoptWbinDnon_non {
            stamina=0.4;
        };
        class AwopPknlMstpSoptWbinDnon_AwopPpneMstpSoptWbinDnon_non: AwopPpneMstpSoptWbinDnon_non {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPercMstpSoptWbinDnon_non: AwopPercMstpSoptWbinDnon_non {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AwopPknlMstpSoptWbinDnon_non: AwopPknlMstpSoptWbinDnon_non {
            stamina=0.6;
        };
        class AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AinvPknlMstpSlayWrflDnon: AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.3;
        };
        class AinvPknlMstpSlayWrflDnon_AmovPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.3;
        };
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWrflDnon_1: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWrflDnon_medic: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWrflDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWrflDnon_medicDummyEnd: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPpneMstpSlayWrflDnon_medic: AinvPknlMstpSlayWrflDnon_medic {
            stamina=0.4;
        };
        class AinvPpneMstpSlayWrflDnon_medicOther: AinvPknlMstpSlayWrflDnon_medic {
            stamina=0.4;
        };
        class AinvPpneMstpSlayWrflDnon_medicDummyEnd: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AinvPknlMstpSlayWpstDnon_medic: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWpstDnon_medicIn: AinvPknlMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWpstDnon_medicOut: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWpstDnon_medicOther: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWpstDnon_medicOtherIn: AinvPknlMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWpstDnon_medicOtherOut: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWpstDnon_medic: AinvPknlMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWpstDnon_medicIn: AinvPpneMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWpstDnon_medicOut: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPpneMstpSlayWpstDnon_medicOther: AinvPknlMstpSlayWpstDnon_medicOther {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWpstDnon_medicOtherIn: AinvPpneMstpSlayWpstDnon_medicOther {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWpstDnon_medicOtherOut: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AinvPknlMstpSlayWnonDnon_medic: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSlayWnonDnon_medicIn: AinvPknlMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPknlMstpSlayWnonDnon_medicOut: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPpneMstpSlayWnonDnon_medic: AinvPknlMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWnonDnon_medicIn: AinvPpneMstpSlayWpstDnon_medic {
            stamina=0.6;
        };
        class AinvPpneMstpSlayWnonDnon_medicOut: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSlayWrflDnon_healed: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWrflDnon_healed2: AinvPknlMstpSlayWrflDnon_healed {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWnonDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AinvPpneMstpSlayWnonDnon_medicOther: AinvPknlMstpSlayWnonDnon_medicOther {
            stamina=0.4;
        };
        class AadjPercMwlkSrasWrflDf_left: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfl_left: AmovPercMwlkSrasWrflDfl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDl_left: AmovPercMwlkSrasWrflDl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbl_left: AmovPercMwlkSrasWrflDbl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDb_left: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbr_left: AmovPercMwlkSrasWrflDbr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDr_left: AmovPercMwlkSrasWrflDr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfr_left: AmovPercMwlkSrasWrflDfr {
            stamina=0.2;
        };
        class AadjPercMtacSrasWrflDf_left: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfl_left: AmovPercMtacSrasWrflDfl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDl_left: AmovPercMtacSrasWrflDl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbl_left: AmovPercMtacSrasWrflDbl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDb_left: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbr_left: AmovPercMtacSrasWrflDbr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDr_left: AmovPercMtacSrasWrflDr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfr_left: AmovPercMtacSrasWrflDfr {
            stamina=-0.5;
        };
        class AadjPercMrunSrasWrflDf_left: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfl_left: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDl_left: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbl_left: AmovPercMrunSrasWrflDbl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDb_left: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbr_left: AmovPercMrunSrasWrflDbr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDr_left: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfr_left: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AadjPercMevaSrasWrflDf_left: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfl_left: AmovPercMevaSrasWrflDfl {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfr_left: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPercMwlkSrasWrflDf_right: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfl_right: AmovPercMwlkSrasWrflDfl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDl_right: AmovPercMwlkSrasWrflDl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbl_right: AmovPercMwlkSrasWrflDbl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDb_right: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbr_right: AmovPercMwlkSrasWrflDbr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDr_right: AmovPercMwlkSrasWrflDr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfr_right: AmovPercMwlkSrasWrflDfr {
            stamina=0.2;
        };
        class AadjPercMtacSrasWrflDf_right: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfl_right: AmovPercMtacSrasWrflDfl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDl_right: AmovPercMtacSrasWrflDl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbl_right: AmovPercMtacSrasWrflDbl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDb_right: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbr_right: AmovPercMtacSrasWrflDbr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDr_right: AmovPercMtacSrasWrflDr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfr_right: AmovPercMtacSrasWrflDfr {
            stamina=-0.5;
        };
        class AadjPercMrunSrasWrflDf_right: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfl_right: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDl_right: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbl_right: AmovPercMrunSrasWrflDbl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDb_right: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbr_right: AmovPercMrunSrasWrflDbr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDr_right: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfr_right: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AadjPercMevaSrasWrflDf_right: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfl_right: AmovPercMevaSrasWrflDfl {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfr_right: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPercMwlkSrasWrflDf_down: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfl_down: AmovPercMwlkSrasWrflDfl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDl_down: AmovPercMwlkSrasWrflDl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbl_down: AmovPercMwlkSrasWrflDbl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDb_down: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbr_down: AmovPercMwlkSrasWrflDbr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDr_down: AmovPercMwlkSrasWrflDr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfr_down: AmovPercMwlkSrasWrflDfr {
            stamina=0.2;
        };
        class AadjPercMtacSrasWrflDf_down: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfl_down: AmovPercMtacSrasWrflDfl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDl_down: AmovPercMtacSrasWrflDl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbl_down: AmovPercMtacSrasWrflDbl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDb_down: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbr_down: AmovPercMtacSrasWrflDbr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDr_down: AmovPercMtacSrasWrflDr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfr_down: AmovPercMtacSrasWrflDfr {
            stamina=-0.5;
        };
        class AadjPercMrunSrasWrflDf_down: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfl_down: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDl_down: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbl_down: AmovPercMrunSrasWrflDbl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDb_down: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbr_down: AmovPercMrunSrasWrflDbr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDr_down: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfr_down: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AadjPercMevaSrasWrflDf_down: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfl_down: AmovPercMevaSrasWrflDfl {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfr_down: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPercMwlkSrasWrflDf_up: AmovPercMwlkSrasWrflDf {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfl_up: AmovPercMwlkSrasWrflDfl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDl_up: AmovPercMwlkSrasWrflDl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbl_up: AmovPercMwlkSrasWrflDbl {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDb_up: AmovPercMwlkSrasWrflDb {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDbr_up: AmovPercMwlkSrasWrflDbr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDr_up: AmovPercMwlkSrasWrflDr {
            stamina=0.2;
        };
        class AadjPercMwlkSrasWrflDfr_up: AmovPercMwlkSrasWrflDfr {
            stamina=0.2;
        };
        class AadjPercMtacSrasWrflDf_up: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfl_up: AmovPercMtacSrasWrflDfl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDl_up: AmovPercMtacSrasWrflDl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbl_up: AmovPercMtacSrasWrflDbl {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDb_up: AmovPercMtacSrasWrflDb {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDbr_up: AmovPercMtacSrasWrflDbr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDr_up: AmovPercMtacSrasWrflDr {
            stamina=-0.5;
        };
        class AadjPercMtacSrasWrflDfr_up: AmovPercMtacSrasWrflDfr {
            stamina=-0.5;
        };
        class AadjPercMrunSrasWrflDf_up: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfl_up: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDl_up: AmovPercMrunSrasWrflDl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbl_up: AmovPercMrunSrasWrflDbl {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDb_up: AmovPercMrunSrasWrflDb {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDbr_up: AmovPercMrunSrasWrflDbr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDr_up: AmovPercMrunSrasWrflDr {
            stamina=-0.3;
        };
        class AadjPercMrunSrasWrflDfr_up: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AadjPercMevaSrasWrflDf_up: AmovPercMevaSrasWrflDf {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfl_up: AmovPercMevaSrasWrflDfl {
            stamina=-1;
        };
        class AadjPercMevaSrasWrflDfr_up: AmovPercMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWrflDf_left: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfl_left: AmovPknlMwlkSrasWrflDfl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDl_left: AmovPknlMwlkSrasWrflDl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbl_left: AmovPknlMwlkSrasWrflDbl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDb_left: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbr_left: AmovPknlMwlkSrasWrflDbr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDr_left: AmovPknlMwlkSrasWrflDr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfr_left: AmovPknlMwlkSrasWrflDfr {
            stamina=-0.25;
        };
        class AadjPknlMtacSrasWrflDf_left: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfl_left: AmovPknlMtacSrasWrflDfl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDl_left: AmovPknlMtacSrasWrflDl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbl_left: AmovPknlMtacSrasWrflDbl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDb_left: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbr_left: AmovPknlMtacSrasWrflDbr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDr_left: AmovPknlMtacSrasWrflDr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfr_left: AmovPknlMtacSrasWrflDfr {
            stamina=-0.6;
        };
        class AadjPknlMrunSrasWrflDf_left: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfl_left: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDl_left: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbl_left: AmovPknlMrunSrasWrflDbl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDb_left: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbr_left: AmovPknlMrunSrasWrflDbr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDr_left: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfr_left: AmovPknlMrunSrasWrflDfr {
            stamina=-0.4;
        };
        class AadjPknlMevaSrasWrflDf_left: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfl_left: AmovPknlMevaSrasWrflDfl {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfr_left: AmovPknlMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWrflDf_right: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfl_right: AmovPknlMwlkSrasWrflDfl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDl_right: AmovPknlMwlkSrasWrflDl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbl_right: AmovPknlMwlkSrasWrflDbl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDb_right: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbr_right: AmovPknlMwlkSrasWrflDbr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDr_right: AmovPknlMwlkSrasWrflDr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfr_right: AmovPknlMwlkSrasWrflDfr {
            stamina=-0.25;
        };
        class AadjPknlMtacSrasWrflDf_right: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfl_right: AmovPknlMtacSrasWrflDfl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDl_right: AmovPknlMtacSrasWrflDl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbl_right: AmovPknlMtacSrasWrflDbl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDb_right: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbr_right: AmovPknlMtacSrasWrflDbr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDr_right: AmovPknlMtacSrasWrflDr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfr_right: AmovPknlMtacSrasWrflDfr {
            stamina=-0.6;
        };
        class AadjPknlMrunSrasWrflDf_right: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfl_right: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDl_right: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbl_right: AmovPknlMrunSrasWrflDbl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDb_right: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbr_right: AmovPknlMrunSrasWrflDbr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDr_right: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfr_right: AmovPknlMrunSrasWrflDfr {
            stamina=-0.4;
        };
        class AadjPknlMevaSrasWrflDf_right: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfl_right: AmovPknlMevaSrasWrflDfl {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfr_right: AmovPknlMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWrflDf_down: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfl_down: AmovPknlMwlkSrasWrflDfl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDl_down: AmovPknlMwlkSrasWrflDl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbl_down: AmovPknlMwlkSrasWrflDbl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDb_down: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbr_down: AmovPknlMwlkSrasWrflDbr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDr_down: AmovPknlMwlkSrasWrflDr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfr_down: AmovPknlMwlkSrasWrflDfr {
            stamina=-0.25;
        };
        class AadjPknlMtacSrasWrflDf_down: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfl_down: AmovPknlMtacSrasWrflDfl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDl_down: AmovPknlMtacSrasWrflDl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbl_down: AmovPknlMtacSrasWrflDbl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDb_down: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbr_down: AmovPknlMtacSrasWrflDbr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDr_down: AmovPknlMtacSrasWrflDr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfr_down: AmovPknlMtacSrasWrflDfr {
            stamina=-0.6;
        };
        class AadjPknlMrunSrasWrflDf_down: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfl_down: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDl_down: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbl_down: AmovPknlMrunSrasWrflDbl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDb_down: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbr_down: AmovPknlMrunSrasWrflDbr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDr_down: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfr_down: AmovPknlMrunSrasWrflDfr {
            stamina=-0.4;
        };
        class AadjPknlMevaSrasWrflDf_down: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfl_down: AmovPknlMevaSrasWrflDfl {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfr_down: AmovPknlMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWrflDf_up: AmovPknlMwlkSrasWrflDf {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfl_up: AmovPknlMwlkSrasWrflDfl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDl_up: AmovPknlMwlkSrasWrflDl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbl_up: AmovPknlMwlkSrasWrflDbl {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDb_up: AmovPknlMwlkSrasWrflDb {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDbr_up: AmovPknlMwlkSrasWrflDbr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDr_up: AmovPknlMwlkSrasWrflDr {
            stamina=-0.25;
        };
        class AadjPknlMwlkSrasWrflDfr_up: AmovPknlMwlkSrasWrflDfr {
            stamina=-0.25;
        };
        class AadjPknlMtacSrasWrflDf_up: AmovPknlMtacSrasWrflDf {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfl_up: AmovPknlMtacSrasWrflDfl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDl_up: AmovPknlMtacSrasWrflDl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbl_up: AmovPknlMtacSrasWrflDbl {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDb_up: AmovPknlMtacSrasWrflDb {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDbr_up: AmovPknlMtacSrasWrflDbr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDr_up: AmovPknlMtacSrasWrflDr {
            stamina=-0.6;
        };
        class AadjPknlMtacSrasWrflDfr_up: AmovPknlMtacSrasWrflDfr {
            stamina=-0.6;
        };
        class AadjPknlMrunSrasWrflDf_up: AmovPknlMrunSrasWrflDf {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfl_up: AmovPknlMrunSrasWrflDfl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDl_up: AmovPknlMrunSrasWrflDl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbl_up: AmovPknlMrunSrasWrflDbl {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDb_up: AmovPknlMrunSrasWrflDb {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDbr_up: AmovPknlMrunSrasWrflDbr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDr_up: AmovPknlMrunSrasWrflDr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWrflDfr_up: AmovPknlMrunSrasWrflDfr {
            stamina=-0.4;
        };
        class AadjPknlMevaSrasWrflDf_up: AmovPknlMevaSrasWrflDf {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfl_up: AmovPknlMevaSrasWrflDfl {
            stamina=-1.2;
        };
        class AadjPknlMevaSrasWrflDfr_up: AmovPknlMevaSrasWrflDfr {
            stamina=-1;
        };
        class AadjPercMwlkSrasWpstDf_left: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfl_left: AmovPercMwlkSrasWpstDfl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDl_left: AmovPercMwlkSrasWpstDl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbl_left: AmovPercMwlkSrasWpstDbl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDb_left: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbr_left: AmovPercMwlkSrasWpstDbr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDr_left: AmovPercMwlkSrasWpstDr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfr_left: AmovPercMwlkSrasWpstDfr {
            stamina=0.3;
        };
        class AadjPercMtacSrasWpstDf_left: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfl_left: AmovPercMtacSrasWpstDfl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDl_left: AadjPercMtacSrasWpstDfl_left {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbl_left: AmovPercMtacSrasWpstDbl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDb_left: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbr_left: AmovPercMtacSrasWpstDbr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDr_left: AmovPercMtacSrasWpstDr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfr_left: AmovPercMtacSrasWpstDfr {
            stamina=-0.2;
        };
        class AadjPercMrunSrasWpstDf_left: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfl_left: AmovPercMrunSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDl_left: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbl_left: AmovPercMrunSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDb_left: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbr_left: AmovPercMrunSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDr_left: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfr_left: AmovPercMrunSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPercMevaSrasWpstDf_left: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfl_left: AmovPercMevaSrasWpstDfl {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfr_left: AmovPercMevaSrasWpstDfr {
            stamina=-0.8;
        };
        class AadjPercMwlkSrasWpstDf_right: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfl_right: AmovPercMwlkSrasWpstDfl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDl_right: AmovPercMwlkSrasWpstDl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbl_right: AmovPercMwlkSrasWpstDbl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDb_right: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbr_right: AmovPercMwlkSrasWpstDbr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDr_right: AmovPercMwlkSrasWpstDr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfr_right: AmovPercMwlkSrasWpstDfr {
            stamina=0.3;
        };
        class AadjPercMtacSrasWpstDf_right: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfl_right: AmovPercMtacSrasWpstDfl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDl_right: AmovPercMtacSrasWpstDl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbl_right: AmovPercMtacSrasWpstDbl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDb_right: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbr_right: AmovPercMtacSrasWpstDbr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDr_right: AmovPercMtacSrasWpstDr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfr_right: AmovPercMtacSrasWpstDfr {
            stamina=-0.2;
        };
        class AadjPercMrunSrasWpstDf_right: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfl_right: AmovPercMrunSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDl_right: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbl_right: AmovPercMrunSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDb_right: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbr_right: AmovPercMrunSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDr_right: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfr_right: AmovPercMrunSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPercMevaSrasWpstDf_right: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfl_right: AmovPercMevaSrasWpstDfl {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfr_right: AmovPercMevaSrasWpstDfr {
            stamina=-0.8;
        };
        class AadjPercMwlkSrasWpstDf_down: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfl_down: AmovPercMwlkSrasWpstDfl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDl_down: AmovPercMwlkSrasWpstDl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbl_down: AmovPercMwlkSrasWpstDbl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDb_down: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbr_down: AmovPercMwlkSrasWpstDbr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDr_down: AmovPercMwlkSrasWpstDr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfr_down: AmovPercMwlkSrasWpstDfr {
            stamina=0.3;
        };
        class AadjPercMtacSrasWpstDf_down: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfl_down: AmovPercMtacSrasWpstDfl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDl_down: AmovPercMtacSrasWpstDl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbl_down: AmovPercMtacSrasWpstDbl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDb_down: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbr_down: AmovPercMtacSrasWpstDbr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDr_down: AmovPercMtacSrasWpstDr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfr_down: AmovPercMtacSrasWpstDfr {
            stamina=-0.2;
        };
        class AadjPercMrunSrasWpstDf_down: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfl_down: AmovPercMrunSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDl_down: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbl_down: AmovPercMrunSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDb_down: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbr_down: AmovPercMrunSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDr_down: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfr_down: AmovPercMrunSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPercMevaSrasWpstDf_down: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfl_down: AmovPercMevaSrasWpstDfl {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfr_down: AmovPercMevaSrasWpstDfr {
            stamina=-0.8;
        };
        class AadjPercMwlkSrasWpstDf_up: AmovPercMwlkSrasWpstDf {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfl_up: AmovPercMwlkSrasWpstDfl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDl_up: AmovPercMwlkSrasWpstDl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbl_up: AmovPercMwlkSrasWpstDbl {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDb_up: AmovPercMwlkSrasWpstDb {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDbr_up: AmovPercMwlkSrasWpstDbr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDr_up: AmovPercMwlkSrasWpstDr {
            stamina=0.3;
        };
        class AadjPercMwlkSrasWpstDfr_up: AmovPercMwlkSrasWpstDfr {
            stamina=0.3;
        };
        class AadjPercMtacSrasWpstDf_up: AmovPercMtacSrasWpstDf {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfl_up: AmovPercMtacSrasWpstDfl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDl_up: AmovPercMtacSrasWpstDl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbl_up: AmovPercMtacSrasWpstDbl {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDb_up: AmovPercMtacSrasWpstDb {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDbr_up: AmovPercMtacSrasWpstDbr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDr_up: AmovPercMtacSrasWpstDr {
            stamina=-0.2;
        };
        class AadjPercMtacSrasWpstDfr_up: AmovPercMtacSrasWpstDfr {
            stamina=-0.2;
        };
        class AadjPercMrunSrasWpstDf_up: AmovPercMrunSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfl_up: AmovPercMrunSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDl_up: AmovPercMrunSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbl_up: AmovPercMrunSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDb_up: AmovPercMrunSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDbr_up: AmovPercMrunSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDr_up: AmovPercMrunSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPercMrunSrasWpstDfr_up: AmovPercMrunSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPercMevaSrasWpstDf_up: AmovPercMevaSrasWpstDf {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfl_up: AmovPercMevaSrasWpstDfl {
            stamina=-0.8;
        };
        class AadjPercMevaSrasWpstDfr_up: AmovPercMevaSrasWpstDfr {
            stamina=-0.8;
        };
        class AadjPknlMwlkSrasWpstDf_left: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfl_left: AmovPknlMwlkSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDl_left: AmovPknlMwlkSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbl_left: AmovPknlMwlkSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDb_left: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbr_left: AmovPknlMwlkSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDr_left: AmovPknlMwlkSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfr_left: AmovPknlMwlkSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPknlMtacSrasWpstDf_left: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfl_left: AmovPknlMtacSrasWpstDfl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDl_left: AmovPknlMtacSrasWpstDl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbl_left: AmovPknlMtacSrasWpstDbl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDb_left: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbr_left: AmovPknlMtacSrasWpstDbr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDr_left: AmovPknlMtacSrasWpstDr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfr_left: AmovPknlMtacSrasWpstDfr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWpstDf_left: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfl_left: AmovPknlMrunSrasWpstDfl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDl_left: AmovPknlMrunSrasWpstDl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbl_left: AmovPknlMrunSrasWpstDbl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDb_left: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbr_left: AmovPknlMrunSrasWpstDbr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDr_left: AmovPknlMrunSrasWpstDr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfr_left: AmovPknlMrunSrasWpstDfr {
            stamina=-0.3;
        };
        class AadjPknlMevaSrasWpstDf_left: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfl_left: AmovPknlMevaSrasWpstDfl {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfr_left: AmovPknlMevaSrasWpstDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWpstDf_right: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfl_right: AmovPknlMwlkSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDl_right: AmovPknlMwlkSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbl_right: AmovPknlMwlkSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDb_right: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbr_right: AmovPknlMwlkSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDr_right: AmovPknlMwlkSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfr_right: AmovPknlMwlkSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPknlMtacSrasWpstDf_right: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfl_right: AmovPknlMtacSrasWpstDfl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDl_right: AmovPknlMtacSrasWpstDl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbl_right: AmovPknlMtacSrasWpstDbl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDb_right: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbr_right: AmovPknlMtacSrasWpstDbr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDr_right: AmovPknlMtacSrasWpstDr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfr_right: AmovPknlMtacSrasWpstDfr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWpstDf_right: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfl_right: AmovPknlMrunSrasWpstDfl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDl_right: AmovPknlMrunSrasWpstDl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbl_right: AmovPknlMrunSrasWpstDbl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDb_right: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbr_right: AmovPknlMrunSrasWpstDbr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDr_right: AmovPknlMrunSrasWpstDr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfr_right: AmovPknlMrunSrasWpstDfr {
            stamina=-0.3;
        };
        class AadjPknlMevaSrasWpstDf_right: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfl_right: AmovPknlMevaSrasWpstDfl {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfr_right: AmovPknlMevaSrasWpstDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWpstDf_down: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfl_down: AmovPknlMwlkSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDl_down: AmovPknlMwlkSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbl_down: AmovPknlMwlkSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDb_down: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbr_down: AmovPknlMwlkSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDr_down: AmovPknlMwlkSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfr_down: AmovPknlMwlkSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPknlMtacSrasWpstDf_down: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfl_down: AmovPknlMtacSrasWpstDfl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDl_down: AmovPknlMtacSrasWpstDl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbl_down: AmovPknlMtacSrasWpstDbl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDb_down: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbr_down: AmovPknlMtacSrasWpstDbr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDr_down: AmovPknlMtacSrasWpstDr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfr_down: AmovPknlMtacSrasWpstDfr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWpstDf_down: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfl_down: AmovPknlMrunSrasWpstDfl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDl_down: AmovPknlMrunSrasWpstDl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbl_down: AmovPknlMrunSrasWpstDbl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDb_down: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbr_down: AmovPknlMrunSrasWpstDbr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDr_down: AmovPknlMrunSrasWpstDr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfr_down: AmovPknlMrunSrasWpstDfr {
            stamina=-0.3;
        };
        class AadjPknlMevaSrasWpstDf_down: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfl_down: AmovPknlMevaSrasWpstDfl {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfr_down: AmovPknlMevaSrasWpstDfr {
            stamina=-1;
        };
        class AadjPknlMwlkSrasWpstDf_up: AmovPknlMwlkSrasWpstDf {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfl_up: AmovPknlMwlkSrasWpstDfl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDl_up: AmovPknlMwlkSrasWpstDl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbl_up: AmovPknlMwlkSrasWpstDbl {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDb_up: AmovPknlMwlkSrasWpstDb {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDbr_up: AmovPknlMwlkSrasWpstDbr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDr_up: AmovPknlMwlkSrasWpstDr {
            stamina=-0.15;
        };
        class AadjPknlMwlkSrasWpstDfr_up: AmovPknlMwlkSrasWpstDfr {
            stamina=-0.15;
        };
        class AadjPknlMtacSrasWpstDf_up: AmovPknlMtacSrasWpstDf {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfl_up: AmovPknlMtacSrasWpstDfl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDl_up: AmovPknlMtacSrasWpstDl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbl_up: AmovPknlMtacSrasWpstDbl {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDb_up: AmovPknlMtacSrasWpstDb {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDbr_up: AmovPknlMtacSrasWpstDbr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDr_up: AmovPknlMtacSrasWpstDr {
            stamina=-0.4;
        };
        class AadjPknlMtacSrasWpstDfr_up: AmovPknlMtacSrasWpstDfr {
            stamina=-0.4;
        };
        class AadjPknlMrunSrasWpstDf_up: AmovPknlMrunSrasWpstDf {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfl_up: AmovPknlMrunSrasWpstDfl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDl_up: AmovPknlMrunSrasWpstDl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbl_up: AmovPknlMrunSrasWpstDbl {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDb_up: AmovPknlMrunSrasWpstDb {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDbr_up: AmovPknlMrunSrasWpstDbr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDr_up: AmovPknlMrunSrasWpstDr {
            stamina=-0.3;
        };
        class AadjPknlMrunSrasWpstDfr_up: AmovPknlMrunSrasWpstDfr {
            stamina=-0.3;
        };
        class AadjPknlMevaSrasWpstDf_up: AmovPknlMevaSrasWpstDf {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfl_up: AmovPknlMevaSrasWpstDfl {
            stamina=-1;
        };
        class AadjPknlMevaSrasWpstDfr_up: AmovPknlMevaSrasWpstDfr {
            stamina=-1;
        };
        class AinvPknlMstpSlayWrflDnon_AmovPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSrasWrflDnon_healed: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end: AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWnonDnon_1: AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end: AmovPercMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon {
            stamina=0.6;
        };
        class AinvPknlMstpSnonWnonDnon_2: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.6;
        };
        class AinvPknlMstpSnonWnonDnon_medic_1: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.6;
        };
        class AinvPknlMstpSnonWnonDnon_healed_1: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.6;
        };
        class AinvPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.6;
        };
        class AinvPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon_end: AmovPknlMstpSrasWpstDnon_AinvPknlMstpSnonWnonDnon_end {
            stamina=0.6;
        };
        class AmovPpneMstpSrasWpstDnon_healed: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPknlMstpSnonWnonDnon_3: AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPknlMstpSlayWrflDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AinvPknlMstpSnonWnonDnon_4: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon_medic_2: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSnonWnonDnon_healed_2: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AinvPknlMstpSlayWrflDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AmovPpneMstpSnonWnonDnon_healed: AidlPpneMstpSnonWnonDnon_G0S {
            stamina=1;
        };
        class AparPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutMedium: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutHigh: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutHighZamak: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutHighHemtt: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class GetInHelicopterCargoRfl: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class GetOutHelicopterCargoRfl: GetInHelicopterCargoRfl {
            stamina=0.3;
        };
        class GetInMRAP_01Rfl: GetInHelicopterCargoRfl {
            stamina=0.3;
        };
        class GetOutMRAP_01Rfl: GetInMRAP_01Rfl {
            stamina=0.3;
        };
        class GetInMRAP_01_cargoRfl: GetInMRAP_01Rfl {
            stamina=0.3;
        };
        class GetOutMRAP_01_cargoRfl: GetOutMRAP_01Rfl {
            stamina=0.3;
        };
        class Heli_Attack_01Pilot_AmovPercMstpSlowWrflDnon: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class Heli_Attack_01Gunner_AmovPercMstpSlowWrflDnon: Heli_Attack_01Pilot_AmovPercMstpSlowWrflDnon {
            stamina=0.3;
        };
        class AmovPercMstpSnonWnonDnon_Heli_Attack_01Pilot: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon_getOutLow {
            stamina=0.3;
        };
        class AmovPercMstpSnonWnonDnon_Heli_Attack_01Gunner: Heli_Attack_01Pilot_AmovPercMstpSlowWrflDnon {
            stamina=0.3;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutMedium: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow {
            stamina=0.4;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutHigh: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow {
            stamina=0.4;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutHighZamak: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow {
            stamina=0.4;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutHighHemtt: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow {
            stamina=0.4;
        };
        class GetInHelicopterCargoPst: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_getOutLow {
            stamina=0.4;
        };
        class GetOutHelicopterCargoPst: GetInHelicopterCargoPst {
            stamina=0.4;
        };
        class GetInMRAP_01Pst: GetInHelicopterCargoPst {
            stamina=0.4;
        };
        class GetOutMRAP_01Pst: GetInMRAP_01Pst {
            stamina=0.4;
        };
        class GetInMRAP_01_cargoPst: GetInMRAP_01Pst {
            stamina=0.4;
        };
        class GetOutMRAP_01_cargoPst: GetOutMRAP_01Pst {
            stamina=0.4;
        };
        class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInMedium: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInHigh: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow {
            stamina=0.8;
        };
        class AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInSDV: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow {
            stamina=0.8;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow: AmovPercMstpSnonWnonDnon_AcrgPknlMstpSnonWnonDnon_getInLow {
            stamina=0.8;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutMedium: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow {
            stamina=0.8;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutHigh: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow {
            stamina=0.8;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutHighZamak: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow {
            stamina=0.8;
        };
        class AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutHighHemtt: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow {
            stamina=0.8;
        };
        class GetInHelicopterCargo: AcrgPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon_getOutLow {
            stamina=0.8;
        };
        class GetOutHelicopterCargo: GetInHelicopterCargo {
            stamina=0.8;
        };
        class GetInMRAP_01: GetInHelicopterCargo {
            stamina=0.8;
        };
        class GetOutMRAP_01: GetInMRAP_01 {
            stamina=0.8;
        };
        class GetInMRAP_01_cargo: GetInMRAP_01 {
            stamina=0.8;
        };
        class GetOutMRAP_01_cargo: GetOutMRAP_01 {
            stamina=0.8;
        };
        class AinjPpneMstpSnonWrflDnon: AmovPpneMstpSrasWrflDnon_injured {
            stamina=0.5;
        };
        class AinjPpneMstpSnonWrflDnon_injuredHealed: AinjPpneMstpSnonWrflDnon {
            stamina=0;
        };
        class AinjPpneMstpSnonWrflDnon_rolltoback: AinjPpneMstpSnonWrflDnon {
            stamina=-3;
        };
        class AinjPpneMstpSnonWrflDnon_rolltofront: AinjPpneMstpSnonWrflDnon_rolltoback {
            stamina=-3;
        };
        class AinjPpneMstpSnonWnonDnon_kneel: AinjPpneMstpSnonWrflDnon {
            stamina=0.5;
        };
        class AinjPpneMstpSnonWrflDb: AinjPpneMstpSnonWrflDnon {
            stamina=0.5;
        };
        class AinjPpneMstpSnonWrflDb_release: AinjPpneMstpSnonWrflDnon {
            stamina=0.5;
        };
        class AinjPpneMstpSnonWrflDb_death: AinjPpneMstpSnonWrflDb_release {
            stamina=0.5;
        };
        class AcinPknlMwlkSlowWrflDb_still: AinjPpneMstpSnonWrflDnon {
            stamina=0.5;
        };
        class AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1: Default {
            stamina=-0.2;
        };
        class AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_2: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            stamina=-0.2;
        };
        class GetIn_Vertical_Rifle: GetInHelicopterCargoRfl {
            stamina=0.3;
        };
        class GetIn_Vertical_Pistol: GetInHelicopterCargoPst {
            stamina=0.4;
        };
        class GetIn_Vertical_Unarmed: GetInHelicopterCargo {
            stamina=0.8;
        };
        class AcinPknlMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            stamina=0.3;
        };
        class DraggerBase: Default {
            stamina=-0.2;
        };
        class DraggerBaseRfl: DraggerBase {
            stamina=-0.2;
        };
        class AcinPknlMwlkSlowWrflDb_AmovPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            stamina=0.5;
        };
        class AcinPknlMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon: DraggerBaseRfl {
            stamina=-0.2;
        };
        class AcinPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon: DraggerBaseRfl {
            stamina=-0.2;
        };
        class AcinPknlMwlkSrasWrflDb: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            stamina=-0.6;
        };
        class AcinPknlMwlkSlowWrflDb_death: AmovPercMstpSlowWrflDnon_AcinPknlMwlkSlowWrflDb_1 {
            stamina=-0.2;
        };
        class AcinPknlMwlkSlowWrflDb_agony: AmovPpneMstpSrasWrflDnon_injured {
            stamina=0.5;
        };
        class AcinPercMrunSrasWrflDf: InjuredMovedBase {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDb: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDbl: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDbr: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDfl: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDfr: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDl: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDr: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDf_death: AcinPercMrunSrasWrflDf {
            stamina=-0.5;
        };
        class AcinPercMrunSrasWrflDf_agony: AcinPercMrunSrasWrflDf_death {
            stamina=-10;
        };
        class AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon: InjuredMovedBase {
            stamina=-1;
        };
        class Helper_SwitchToCarryRfl: AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon {
            stamina=-1;
        };
        class AcinPercMstpSrasWrflDnon: AcinPknlMstpSrasWrflDnon_AcinPercMrunSrasWrflDnon {
            stamina=0.2;
        };
        class AcinPercMstpSrasWrflDnon_agony: AcinPercMstpSrasWrflDnon {
            stamina=0.2;
        };
        class AcinPercMrunSrasWrflDf_AmovPercMstpSlowWrflDnon: InjuredMovedBase {
            stamina=0.5;
        };
        class AcinPknlMwlkSlowWrflDb_death2: AcinPknlMwlkSlowWrflDb_death {
            stamina=-0.2;
        };
        class Helper_InjuredRfl: AgonyBaseRfl {
            stamina=0.5;
        };
        class Hepler_InjuredNon: Helper_InjuredRfl {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDnon_AmovPpneMstpSrasWrflDnon_injured: AinjPfalMstpSnonWrflDnon_carried_Up {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDnon_carried_still: AinjPfalMstpSnonWrflDnon_carried_Up {
            stamina=0;
        };
        class AinjPfalMstpSnonWrflDf_carried: AinjPfalMstpSnonWrflDnon_carried_Up {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDf_carried_fallwc: AinjPfalMstpSnonWrflDf_carried {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDf_carried_fall: AinjPfalMstpSnonWrflDf_carried_fallwc {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDf_carried_dead: AinjPfalMstpSnonWrflDf_carried {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWrflDnon_carried_Down: AgonyBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWnonDnon_injured: AgonyBase {
            stamina=0.5;
        };
        class AmovPpneMstpSnonWpstDnon_injured: AmovPpneMstpSnonWnonDnon_injured {
            stamina=0.5;
        };
        class AmovPpneMsprSnonWnonDf_injured: AmovPpneMstpSnonWnonDnon_injured {
            stamina=-2.6;
        };
        class AinjPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_injured {
            stamina=0.5;
        };
        class AinjPpneMstpSnonWnonDnon_injuredHealed: AinjPpneMstpSnonWnonDnon {
            stamina=0;
        };
        class AinjPpneMstpSnonWnonDnon_rolltoback: AinjPpneMstpSnonWnonDnon {
            stamina=-3;
        };
        class AinjPpneMstpSnonWnonDnon_rolltofront: AinjPpneMstpSnonWnonDnon_rolltoback {
            stamina=-3;
        };
        class AinjPpneMrunSnonWnonDb: AinjPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AinjPpneMrunSnonWnonDb_grab: AinjPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AinjPpneMrunSnonWnonDb_release: AinjPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AinjPpneMrunSnonWnonDb_death: AinjPpneMrunSnonWnonDb_release {
            stamina=0.5;
        };
        class AinjPpneMrunSnonWnonDb_still: AinjPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1: Default {
            stamina=-0.2;
        };
        class AmovPercMstpSrasWpstDnon_AcinPknlMwlkSnonWpstDb_1: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            stamina=-0.2;
        };
        class AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            stamina=-0.2;
        };
        class AmovPercMstpSrasWpstDnon_AcinPknlMwlkSnonWpstDb_2: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_2 {
            stamina=-0.2;
        };
        class AcinPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            stamina=0.3;
        };
        class AcinPknlMstpSnonWpstDnon: AcinPknlMstpSrasWrflDnon {
            stamina=0.3;
        };
        class DraggerBasenon: DraggerBase {
            stamina=-0.2;
        };
        class AcinPknlMwlkSnonWnonDb_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            stamina=0.5;
        };
        class AcinPknlMwlkSnonWpstDb_AmovPercMstpSrasWpstDnon: AcinPknlMwlkSnonWnonDb_AmovPercMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AcinPknlMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon: DraggerBasenon {
            stamina=-0.2;
        };
        class AcinPknlMstpSnonWpstDnon_AmovPknlMstpSrasWpstDnon: AcinPknlMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AcinPknlMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon: DraggerBasenon {
            stamina=-0.2;
        };
        class AcinPknlMstpSnonWpstDnon_AmovPpneMstpSrasWpstDnon: AcinPknlMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AcinPknlMwlkSnonWnonDb: AmovPercMstpSnonWnonDnon_AcinPknlMwlkSnonWnonDb_1 {
            stamina=-6;
        };
        class AcinPknlMwlkSnonWpstDb: AcinPknlMwlkSrasWrflDb {
            stamina=-0.6;
        };
        class AcinPknlMwlkSnonWnonDb_death: AcinPknlMwlkSnonWnonDb {
            stamina=-6;
        };
        class AcinPknlMwlkSnonWpstDb_death: AcinPknlMwlkSnonWnonDb_death {
            stamina=-6;
        };
        class AcinPknlMwlkSnonWnonDb_agony: AmovPpneMstpSnonWnonDnon_injured {
            stamina=0.5;
        };
        class AcinPknlMwlkSnonWpstDb_agony: AcinPknlMwlkSnonWnonDb_agony {
            stamina=0.5;
        };
        class AcinPercMrunSnonWnonDf: InjuredMovedBase {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDb: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDbl: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDbr: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDfl: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDfr: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDl: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDr: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDf: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDfl: AcinPercMrunSnonWnonDfl {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDfr: AcinPercMrunSnonWnonDfr {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDl: AcinPercMrunSnonWnonDl {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDr: AcinPercMrunSnonWnonDr {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDbr: AcinPercMrunSnonWnonDbr {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDbl: AcinPercMrunSnonWnonDbl {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWpstDb: AcinPercMrunSnonWnonDb {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDf_death: AcinPercMrunSnonWnonDf {
            stamina=-0.5;
        };
        class AcinPercMrunSnonWnonDf_agony: AcinPercMrunSnonWnonDf_death {
            stamina=-10;
        };
        class AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon: InjuredMovedBase {
            stamina=-1;
        };
        class AcinPknlMstpSnonWpstDnon_AcinPercMrunSnonWpstDnon: AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon {
            stamina=-1;
        };
        class Helper_SwitchToCarrynon: AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon {
            stamina=-1;
        };
        class Helper_SwitchToCarrynon_pst: Helper_SwitchToCarrynon {
            stamina=-1;
        };
        class AinvPknlMstpSnonWrflDr_medic1: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWrflDr_medic2: AinvPknlMstpSnonWrflDr_medic1 {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWrflDr_medic3: AinvPknlMstpSnonWrflDr_medic1 {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWrflDr_medic4: AinvPknlMstpSnonWrflDr_medic1 {
            stamina=0.4;
        };
        class AinvPknlMstpSnonWrflDr_medic5: AinvPknlMstpSnonWrflDr_medic1 {
            stamina=0.4;
        };
        class AcinPercMstpSnonWnonDnon: AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon {
            stamina=0.2;
        };
        class AcinPercMstpSnonWpstDnon: AcinPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AcinPercMstpSnonWnonDnon_agony: AcinPercMstpSnonWnonDnon {
            stamina=0.2;
        };
        class AcinPercMstpSnonWpstDnon_agony: AcinPercMstpSnonWnonDnon_agony {
            stamina=0.2;
        };
        class AcinPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon: InjuredMovedBase {
            stamina=0.5;
        };
        class AcinPercMrunSnonWpstDf_AmovPercMstpSrasWpstDnon: AcinPercMrunSnonWnonDf_AmovPercMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDnon_carried_Up: AgonyBase {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon_injured: AinjPfalMstpSnonWnonDnon_carried_Up {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDnon_carried_still: AinjPfalMstpSnonWnonDnon_carried_Up {
            stamina=0;
        };
        class AinjPfalMstpSnonWnonDf_carried: AinjPfalMstpSnonWnonDnon_carried_Up {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDf_carried_fallwc: AinjPfalMstpSnonWnonDf_carried {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDf_carried_fall: AinjPfalMstpSnonWnonDf_carried_fallwc {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDf_carried_dead: AinjPfalMstpSnonWnonDf_carried {
            stamina=0.5;
        };
        class AinjPfalMstpSnonWnonDnon_carried_Down: AgonyBase {
            stamina=0.5;
        };
        class AidlPsitMstpSnonWnonDnon_ground00: StandBase {
            stamina=0.5;
        };
        class AmovPercMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_G0S: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class ReloadRPG: AidlPercMstpSrasWlnrDnon_G0S {
            stamina=-0.6;
        };
        class AidlPercMstpSrasWlnrDnon_AI: AidlPercMstpSrasWlnrDnon_G0S {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_G01: AidlPercMstpSrasWlnrDnon_G0S {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_G02: AidlPercMstpSrasWlnrDnon_G01 {
            stamina=0.2;
        };
        class AovrPercMstpSrasWlnrDf: AmovPercMstpSrasWlnrDnon {
            stamina=-2;
        };
        class AidlPercMstpSrasWlnrDnon_S: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_3: AidlPercMstpSrasWlnrDnon_S {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_1: AidlPercMstpSrasWlnrDnon_3 {
            stamina=0.2;
        };
        class AidlPercMstpSrasWlnrDnon_2: AidlPercMstpSrasWlnrDnon_3 {
            stamina=0.2;
        };
        class AmovPercMstpSlowWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AovrPercMstpSlowWlnrDf: AmovPercMstpSlowWlnrDnon {
            stamina=-2;
        };
        class AmovPercMstpSlowWlnrDnon_turnL: AmovPercMstpSlowWlnrDnon {
            stamina=0.2;
        };
        class AmovPercMstpSlowWlnrDnon_turnR: AmovPercMstpSlowWlnrDnon_turnL {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDf: AmovPercMstpSlowWlnrDnon {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDfr: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDr: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDbr: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDb: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDbl: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDl: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSlowWlnrDfl: AmovPercMwlkSlowWlnrDf {
            stamina=0.2;
        };
        class AmovPercMwlkSrasWlnrDf: AidlPercMstpSrasWlnrDnon_G0S {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDfl: AmovPercMwlkSrasWlnrDf {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDl: AmovPercMwlkSrasWlnrDf {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDb: AmovPercMwlkSrasWlnrDf {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDbl: AmovPercMwlkSrasWlnrDb {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDbr: AmovPercMwlkSrasWlnrDb {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDr: AmovPercMwlkSrasWlnrDf {
            stamina=0.1;
        };
        class AmovPercMwlkSrasWlnrDfr: AmovPercMwlkSrasWlnrDf {
            stamina=0.1;
        };
        class AmovPercMtacSrasWlnrDf: AidlPercMstpSrasWlnrDnon_G0S {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDfl: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDl: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDb: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDbl: AmovPercMtacSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDbr: AmovPercMtacSrasWlnrDb {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDr: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWlnrDfr: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMrunSrasWlnrDf: AmovPercMrunSlowWlnrDf {
            stamina=-0.4;
        };
        class AmovPercMrunSrasWlnrDfl: AmovPercMrunSrasWlnrDf {
            stamina=-0.4;
        };
        class AmovPercMrunSrasWlnrDl: AmovPercMrunSrasWlnrDf {
            stamina=-0.4;
        };
        class AmovPercMrunSrasWlnrDb: AmovPercMrunSlowWlnrDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWlnrDbl: AmovPercMrunSrasWlnrDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWlnrDbr: AmovPercMrunSrasWlnrDb {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWlnrDr: AmovPercMrunSrasWlnrDf {
            stamina=-0.4;
        };
        class AmovPercMrunSrasWlnrDfr: AmovPercMrunSrasWlnrDf {
            stamina=-0.4;
        };
        class AmovPercMstpSrasWlnrDnon_turnL: AmovPercMstpSrasWlnrDnon {
            stamina=0;
        };
        class AmovPercMstpSrasWlnrDnon_turnR: AmovPercMstpSrasWlnrDnon {
            stamina=0;
        };
        class AadjPercMstpSrasWrflDleft_AadjPknlMstpSrasWrflDleft: AadjPknlMstpSrasWrflDleft {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWrflDleft_AadjPercMstpSrasWrflDleft: AadjPercMstpSrasWrflDleft {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWrflDright_AadjPknlMstpSrasWrflDright: AadjPknlMstpSrasWrflDright {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWrflDright_AadjPercMstpSrasWrflDright: AadjPercMstpSrasWrflDright {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWrflDdown_AadjPknlMstpSrasWrflDdown: AadjPknlMstpSrasWrflDdown {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWrflDdown_AadjPknlMstpSrasWrflDup: AadjPknlMstpSrasWrflDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWrflDdown_AadjPercMstpSrasWrflDdown: AadjPercMstpSrasWrflDdown {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWrflDup_AadjPknlMstpSrasWrflDup: AadjPknlMstpSrasWrflDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWrflDup_AadjPercMstpSrasWrflDup: AadjPercMstpSrasWrflDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWrflDup_AadjPercMstpSrasWrflDdown: AadjPercMstpSrasWrflDdown {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWpstDleft_AadjPknlMstpSrasWpstDleft: AadjPknlMstpSrasWpstDleft {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDleft_AadjPercMstpSrasWpstDleft: AadjPercMstpSrasWpstDleft {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWpstDright_AadjPknlMstpSrasWpstDright: AadjPknlMstpSrasWpstDright {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDright_AadjPercMstpSrasWpstDright: AadjPercMstpSrasWpstDright {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWpstDdown_AadjPknlMstpSrasWpstDdown: AadjPknlMstpSrasWpstDdown {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWpstDdown_AadjPknlMstpSrasWpstDup: AadjPknlMstpSrasWpstDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDdown_AadjPercMstpSrasWpstDdown: AadjPercMstpSrasWpstDdown {
            stamina=-0.3;
        };
        class AadjPercMstpSrasWpstDup_AadjPknlMstpSrasWpstDup: AadjPknlMstpSrasWpstDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDup_AadjPercMstpSrasWpstDup: AadjPercMstpSrasWpstDup {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDup_AadjPercMstpSrasWpstDdown: AadjPercMstpSrasWpstDdown {
            stamina=-0.3;
        };
        class AadjPknlMstpSrasWpstDdown_AadjPpneMstpSrasWpstDup: AadjPpneMstpSrasWpstDup {
            stamina=-0.3;
        };
        class AadjPpneMstpSrasWpstDup_AadjPknlMstpSrasWpstDdown: AadjPknlMstpSrasWpstDdown {
            stamina=-0.3;
        };
        class AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AmovPercMstpSrasWlnrDnon_AmovPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWlnrDnon_AmovPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWlnrDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWlnrDnon_end: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWlnrDnon: TransAnimBase {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWlnrDnon_end: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWlnrDnon_AwopPercMstpSoptWbinDnon: TransAnimBase_noIK {
            stamina=0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSrasWlnrDnon_AwopPknlMstpSoptWbinDnon: TransAnimBase {
            stamina=0.5;
        };
        class AmovPknlMstpSrasWlnrDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPercMrunSrasWrflDf_AmovPercMrunSrasWrflDfl: AmovPercMrunSrasWrflDf {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDfr: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDf: AmovPercMrunSrasWrflDfl {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDfl: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDf: AmovPercMrunSrasWrflDfr {
            stamina=-0.3;
        };
        class AfalPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AfalPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AfalPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AfalPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AfalPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AfalPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AfalPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AfalPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AfalPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AfalPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AfalPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AmovPercMstpSoptWbinDnon_AinvPercMstpSoptWbinDnon_Putdown: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AinvPercMstpSoptWbinDnon_Putdown_AmovPercMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPknlMstpSoptWbinDnon_AinvPknlMstpSoptWbinDnon_Putdown: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSoptWbinDnon_Putdown_AmovPknlMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AmovPpneMstpSoptWbinDnon_AinvPpneMstpSoptWbinDnon_Putdown: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AinvPpneMstpSoptWbinDnon_Putdown_AmovPpneMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AmovPercMtacSrasWrflDf_AmovPercMtacSrasWlnrDf: AmovPercMtacSrasWrflDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDf_AmovPercMtacSrasWlnrDf_2: AmovPercMtacSrasWlnrDf {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfl_AmovPercMtacSrasWlnrDfl: AmovPercMtacSrasWrflDfl {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfl_AmovPercMtacSrasWlnrDfl_2: AmovPercMtacSrasWlnrDfl {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfr_AmovPercMtacSrasWlnrDfr: AmovPercMtacSrasWrflDfr {
            stamina=-0.5;
        };
        class AmovPercMtacSrasWrflDfr_AmovPercMtacSrasWlnrDfr_2: AmovPercMtacSrasWlnrDfr {
            stamina=-0.5;
        };
        class HaloFreeFall_non: Default {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_FR: HaloFreeFall_non {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_R: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_BR: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_B: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_BL: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_L: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_FL: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_non_HaloFreeFall_F: HaloFreeFall_non_HaloFreeFall_FR {
            stamina=0.5;
        };
        class HaloFreeFall_F: HaloFreeFall_non {
            stamina=0.5;
        };
        class HaloFreeFall_FL: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_L: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_BL: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_B: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_BR: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_R: HaloFreeFall_F {
            stamina=0.5;
        };
        class HaloFreeFall_FR: HaloFreeFall_F {
            stamina=0.5;
        };
        class ReloadGM6: Default {
            stamina=0.5;
        };
        class ReloadGM6Prone: ReloadGM6 {
            stamina=0.5;
        };
        class MountOptic: Default {
            stamina=0.5;
        };
        class AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AinvPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AinvPercMstpSrasWlnrDnon_G01: AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AinvPercMstpSrasWlnrDnon_AmovPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AmovPknlMstpSrasWlnrDnon_AinvPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSlayWlnrDnon_medicOther: AmovPknlMstpSrasWlnrDnon_AinvPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon_AinvPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWlnrDnon_G01: AmovPknlMstpSrasWlnrDnon_AinvPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWlnrDnon_AmovPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AmovPercMstpSrasWlnrDnon_AinvPercMstpSrasWlnrDnon_Putdown: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AinvPercMstpSrasWlnrDnon_Putdown_AmovPercMstpSrasWlnrDnon: AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class AmovPknlMstpSrasWlnrDnon_AinvPknlMstpSrasWlnrDnon_Putdown: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class AinvPknlMstpSrasWlnrDnon_Putdown_AmovPknlMstpSrasWlnrDnon: AmovPknlMstpSrasWlnrDnon {
            stamina=0.4;
        };
        class MountOpticProne: MountOptic {
            stamina=0.5;
        };
        class DismountOptic: Default {
            stamina=0.5;
        };
        class DismountOpticProne: DismountOptic {
            stamina=0.5;
        };
        class MountSide: Default {
            stamina=0.5;
        };
        class MountSideProne: MountSide {
            stamina=0.5;
        };
        class DismountSide: Default {
            stamina=0.5;
        };
        class DismountSideProne: DismountSide {
            stamina=0.5;
        };
        class Acts_CrouchingCoveringRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingFiringLeftRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingFiringLeftRifle02: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingFiringLeftRifle03: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingFiringLeftRifle04: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingIdleRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingReloadingRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingWatchingRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_CrouchingWatchingRifle02: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_PointingLeftUnarmed: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_StandingSpeakingUnarmed: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredLyingRifle01: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_InjuredLyingRifle02: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_InjuredLookingRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredLookingRifle02: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredLookingRifle03: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredLookingRifle04: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredLookingRifle05: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredAngryRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredSpeakingRifle01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_InjuredCoughRifle02: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_MHCargo_JumpToWater_all: CutSceneAnimationBaseSit {
            stamina=0.8;
        };
        class Acts_MHCargo_JumpToWater_sittingloop: CutSceneAnimationBaseSit {
            stamina=0.8;
        };
        class HubTemplateU: StandBase {
            stamina=0.5;
        };
        class HubTemplate: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairA_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairA_idle2: HubSittingChairA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairA_idle3: HubSittingChairA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairA_move1: HubSittingChairA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairB_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairB_idle2: HubSittingChairB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairB_idle3: HubSittingChairB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairB_move1: HubSittingChairB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairC_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairC_idle2: HubSittingChairC_idle1 {
            stamina=0.5;
        };
        class HubSittingChairC_idle3: HubSittingChairC_idle1 {
            stamina=0.5;
        };
        class HubSittingChairC_move1: HubSittingChairC_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUA_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairUA_idle2: HubSittingChairUA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUA_idle3: HubSittingChairUA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUA_move1: HubSittingChairUA_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUB_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairUB_idle2: HubSittingChairUB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUB_idle3: HubSittingChairUB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUB_move1: HubSittingChairUB_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUC_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingChairUC_idle2: HubSittingChairUC_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUC_idle3: HubSittingChairUC_idle1 {
            stamina=0.5;
        };
        class HubSittingChairUC_move1: HubSittingChairUC_idle1 {
            stamina=0.5;
        };
        class HubSittingAtTableU_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingAtTableU_idle2: HubSittingAtTableU_idle1 {
            stamina=0.5;
        };
        class HubSittingAtTableU_idle3: HubSittingAtTableU_idle1 {
            stamina=0.5;
        };
        class HubSittingHighA_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingHighB_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubSittingHighB_idle2: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubSittingHighB_idle3: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubSittingHighB_move1: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubSittingHighB_in: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubSittingHighB_out: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubSittingHighB_outSalute: HubSittingHighB_idle1 {
            stamina=0.5;
        };
        class HubWoundedProne_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubWoundedProne_idle2: HubWoundedProne_idle1 {
            stamina=0.5;
        };
        class HubFixingVehicleProne_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubShootingRange_base: HubTemplate {
            stamina=0.5;
        };
        class HubShootingRangeKneel_shoot: HubShootingRange_base {
            stamina=0.5;
        };
        class HubShootingRangeKneel_move1: HubShootingRange_base {
            stamina=0.5;
        };
        class HubShootingRangeKneel_move2: HubShootingRangeKneel_move1 {
            stamina=0.5;
        };
        class HubShootingRangeKneel_move3: HubShootingRangeKneel_move1 {
            stamina=0.5;
        };
        class HubShootingRangeProne_shoot: HubShootingRangeKneel_shoot {
            stamina=0.5;
        };
        class HubShootingRangeProne_move1: HubShootingRange_base {
            stamina=0.5;
        };
        class HubShootingRangeProne_move2: HubShootingRangeProne_move1 {
            stamina=0.5;
        };
        class HubShootingRangeProne_move3: HubShootingRangeProne_move1 {
            stamina=0.5;
        };
        class HubShootingRangeStand_shoot: HubShootingRangeKneel_shoot {
            stamina=0.5;
        };
        class HubShootingRangeStand_move1: HubShootingRange_base {
            stamina=0.5;
        };
        class HubShootingRangeStand_move2: HubShootingRangeStand_move1 {
            stamina=0.5;
        };
        class HubShootingRangeStand_move3: HubShootingRangeStand_move1 {
            stamina=0.5;
        };
        class HubShootingRangeStand_move4: HubShootingRangeStand_move1 {
            stamina=0.5;
        };
        class HubShootingRangeKneel_HubShootingRangeStand: HubShootingRange_base {
            stamina=0.5;
        };
        class HubShootingRangeStand_HubShootingRangeKneel: HubShootingRangeKneel_HubShootingRangeStand {
            stamina=0.5;
        };
        class HubStandingUA_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubStandingUA_idle2: HubStandingUA_idle1 {
            stamina=0.5;
        };
        class HubStandingUA_idle3: HubStandingUA_idle1 {
            stamina=0.5;
        };
        class HubStandingUA_move1: HubStandingUA_idle1 {
            stamina=0.5;
        };
        class HubStandingUA_move2: HubStandingUA_idle1 {
            stamina=0.5;
        };
        class HubStandingUB_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubStandingUB_idle2: HubStandingUB_idle1 {
            stamina=0.5;
        };
        class HubStandingUB_idle3: HubStandingUB_idle1 {
            stamina=0.5;
        };
        class HubStandingUB_move1: HubStandingUB_idle1 {
            stamina=0.5;
        };
        class HubStandingUC_idle1: HubTemplateU {
            stamina=0.5;
        };
        class HubStandingUC_idle2: HubStandingUC_idle1 {
            stamina=0.5;
        };
        class HubStandingUC_idle3: HubStandingUC_idle1 {
            stamina=0.5;
        };
        class HubStandingUC_move1: HubStandingUC_idle1 {
            stamina=0.5;
        };
        class HubStandingUC_move2: HubStandingUC_idle1 {
            stamina=0.5;
        };
        class HubStanding_idle1: HubTemplate {
            stamina=0.5;
        };
        class HubStanding_idle2: HubStanding_idle1 {
            stamina=0.5;
        };
        class HubStanding_idle3: HubStanding_idle1 {
            stamina=0.5;
        };
        class HubWave_move1: HubTemplate {
            stamina=0.5;
        };
        class HubWave_move2: HubWave_move1 {
            stamina=0.5;
        };
        class HubTemplate_Briefing: HubTemplateU {
            stamina=0.5;
        };
        class HubBriefing_loop: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_lookAround1: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_lookAround2: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_pointAtTable: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_pointLeft: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_pointRight: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_scratch: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_stretch: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_talkAround: HubTemplate_Briefing {
            stamina=0.5;
        };
        class HubBriefing_think: HubTemplate_Briefing {
            stamina=0.5;
        };
        class Campaign_Base: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class Acts_CrouchGetLowGesture: Campaign_Base {
            stamina=0.8;
        };
        class Acts_PercMwlkSlowWrflDf: Campaign_Base {
            stamina=0.8;
        };
        class Acts_PercMwlkSlowWrflDf2: Acts_PercMwlkSlowWrflDf {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup2: Campaign_Base {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup2b: Acts_PercMstpSlowWrflDnon_handup2 {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup2c: Acts_PercMstpSlowWrflDnon_handup2 {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup1: Campaign_Base {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup1b: Acts_PercMstpSlowWrflDnon_handup1 {
            stamina=0.8;
        };
        class Acts_PercMstpSlowWrflDnon_handup1c: Acts_PercMstpSlowWrflDnon_handup1 {
            stamina=0.8;
        };
        class Acts_WalkingChecking: Campaign_Base {
            stamina=0.8;
        };
        class HubSpectator_stand: HubTemplate {
            stamina=0.5;
        };
        class HubSpectator_walk: HubSpectator_stand {
            stamina=0.5;
        };
        class HubSpectator_walkU: HubSpectator_walk {
            stamina=0.5;
        };
        class HubSpectator_standU: HubSpectator_stand {
            stamina=0.5;
        };
        class Acts_UnconsciousStandUp_part1: Campaign_Base {
            stamina=0.8;
        };
        class Acts_UnconsciousStandUp_part2: Acts_UnconsciousStandUp_part1 {
            stamina=0.8;
        };
        class Acts_HUBABriefing: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SignalToCheck: Campaign_Base {
            stamina=0.8;
        };
        class Acts_carFixingWheel: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_in: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_loop1: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_loop2: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_loop3: Campaign_Base {
            stamina=0.8;
        };
        class Acts_SittingJumpingSaluting_out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_NavigatingChopper_In: Campaign_Base {
            stamina=0.8;
        };
        class Acts_NavigatingChopper_Loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_NavigatingChopper_Out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_TreatingWounded_in: Campaign_Base {
            stamina=0.8;
        };
        class Acts_TreatingWounded_loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_TreatingWounded01: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded02: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded03: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded04: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded05: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded06: Acts_TreatingWounded_loop {
            stamina=0.8;
        };
        class Acts_TreatingWounded_Out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_LyingWounded_loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_LyingWounded_loop1: Acts_LyingWounded_loop {
            stamina=0.8;
        };
        class Acts_LyingWounded_loop2: Acts_LyingWounded_loop {
            stamina=0.8;
        };
        class Acts_LyingWounded_loop3: Acts_LyingWounded_loop {
            stamina=0.8;
        };
        class Acts_ShowingTheRightWay_in: Campaign_Base {
            stamina=0.8;
        };
        class Acts_ShowingTheRightWay_loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_ShowingTheRightWay_out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_ShieldFromSun_in: Campaign_Base {
            stamina=0.8;
        };
        class Acts_ShieldFromSun_loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_ShieldFromSun_out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_listeningToRadio_In: Campaign_Base {
            stamina=0.8;
        };
        class Acts_listeningToRadio_Loop: Campaign_Base {
            stamina=0.8;
        };
        class Acts_listeningToRadio_Out: Campaign_Base {
            stamina=0.8;
        };
        class Acts_BoatAttacked01: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_BoatAttacked02: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_BoatAttacked03: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_BoatAttacked04: AmovPercMstpSnonWnonDnon_Scared {
            stamina=0.8;
        };
        class Acts_BoatAttacked05: CutSceneAnimationBaseZoZo {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_pissing: Campaign_Base {
            stamina=0.8;
        };
        class Acts_A_M01_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_A_M02_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_A_M03_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_A_M04_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_A_M05_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_A_OUT_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_B_briefings: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_B_hub01_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_m06_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_M01_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_M02_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_M03_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_M05_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_B_out2_briefing: Acts_B_briefings {
            stamina=0.8;
        };
        class Acts_C_in1_briefing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_PknlMstpSlowWrflDnon: HubSpectator_walk {
            stamina=0.5;
        };
        class Acts_welcomeOnHUB01_AIWalk: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_1b: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_1: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_2: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_3: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_4: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_5: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_AIWalk_6: Acts_welcomeOnHUB01_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk_2: Acts_welcomeOnHUB02_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk_3: Acts_welcomeOnHUB02_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk_4: Acts_welcomeOnHUB02_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk_5: Acts_welcomeOnHUB02_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_AIWalk_6: Acts_welcomeOnHUB02_AIWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_1: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_2: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_3: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_4: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_5: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB01_PlayerWalk_6: Acts_welcomeOnHUB01_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_PlayerWalk: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_PlayerWalk_1: Acts_welcomeOnHUB02_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_PlayerWalk_2: Acts_welcomeOnHUB02_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB02_PlayerWalk_3: Acts_welcomeOnHUB02_PlayerWalk {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_AIWalk_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_PlayerWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_PlayerWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_PlayerWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_PlayerWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB03_PlayerWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_AIWalk_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_PlayerWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_PlayerWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_PlayerWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_PlayerWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB04_PlayerWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_AIWalk_6: Acts_welcomeOnHUB05_AIWalk_5 {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_welcomeOnHUB05_PlayerWalk_7: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_7: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_8: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Commander_9: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_NATOCommanderArrival_Larkin_7: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_passenger_boat_holdright: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_passenger_boat_holdleft: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_passenger_boat_rightrear: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_gunner_MRAP_01_mocap: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_passenger_flatground_leanright: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_2: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_3: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_4: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_5: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_6: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_7: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_8: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_9: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_10: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_ComingInSpeakingWalkingOut_11: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_SittingWounded_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_SittingWounded_wave: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_SittingWounded_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_SittingWounded_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_SittingWounded_breath: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_starterPistol_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_starterPistol_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_starterPistol_fire: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_starterPistol_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Abuse_abuser: CutSceneAnimationBaseAbuse {
            stamina=0.8;
        };
        class Acts_Abuse_abusing: CutSceneAnimationBaseAbuse {
            stamina=0.8;
        };
        class Acts_Abuse_Akhanteros: CutSceneAnimationBaseAbuse {
            stamina=0.8;
        };
        class Acts_Abuse_Lacey: CutSceneAnimationBaseAbuse {
            stamina=0.8;
        };
        class Acts_Abuse_Lacey2: Acts_Abuse_Lacey {
            stamina=0.8;
        };
        class Acts_Abuse_Lacey3: Acts_Abuse_Lacey {
            stamina=0.8;
        };
        class Acts_Abuse_Lacey4: Acts_Abuse_Lacey {
            stamina=0.8;
        };
        class Acts_Abuse_Lacey5: Acts_Abuse_Lacey {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Adams: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Lacey: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Lacey1: Acts_BootKoreShootingRange_Lacey {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Lacey2: Acts_BootKoreShootingRange_Lacey {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Lacey3: Acts_BootKoreShootingRange_Lacey {
            stamina=0.8;
        };
        class Acts_BootKoreShootingRange_Lacey4: Acts_BootKoreShootingRange_Lacey {
            stamina=0.8;
        };
        class Acts_Ending_Adams1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Ending_Adams2: Acts_Ending_Adams1 {
            stamina=0.8;
        };
        class Acts_Ending_Adams3: Acts_Ending_Adams1 {
            stamina=0.8;
        };
        class Acts_Ending_Lacey1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Ending_Lacey2: Acts_Ending_Lacey1 {
            stamina=0.8;
        };
        class Acts_Ending_Lacey3: Acts_Ending_Lacey1 {
            stamina=0.8;
        };
        class Acts_FarmIncident_Adams1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_FarmIncident_Adams2: Acts_FarmIncident_Adams1 {
            stamina=0.8;
        };
        class Acts_FarmIncident_Adams3: Acts_FarmIncident_Adams1 {
            stamina=0.8;
        };
        class Acts_FarmIncident_Commander: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_FarmIncident_Lacey1: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_FarmIncident_Lacey2: Acts_FarmIncident_Lacey1 {
            stamina=0.8;
        };
        class Acts_FarmIncident_Lacey3: Acts_FarmIncident_Lacey1 {
            stamina=0.8;
        };
        class Acts_FarmIncident_Lacey4: Acts_FarmIncident_Lacey1 {
            stamina=0.8;
        };
        class Acts_HeliCargo_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargo_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargo_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargoHopInSignal: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargoPointing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargoTalking_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargoTalking_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_HeliCargoTalking_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_IdleNoWeapon_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_IdleNoWeapon_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_IdleNoWeapon_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_Introducing: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_PointingForward: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_TalkingOverRadio_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_TalkingOverRadio_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_Kore_TalkingOverRadio_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class LaceyTest1a: CutSceneAnimationBase {
            stamina=0.8;
        };
        class LaceyTest1b: LaceyTest1a {
            stamina=0.8;
        };
        class LaceyTest2a: CutSceneAnimationBase {
            stamina=0.8;
        };
        class LaceyTest2b: LaceyTest2a {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon_loop: CutSceneAnimationBaseSit {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon01: Acts_AidlPsitMstpSsurWnonDnon_loop {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon02: Acts_AidlPsitMstpSsurWnonDnon01 {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon03: Acts_AidlPsitMstpSsurWnonDnon01 {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon04: Acts_AidlPsitMstpSsurWnonDnon01 {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon05: Acts_AidlPsitMstpSsurWnonDnon01 {
            stamina=0.8;
        };
        class Acts_AidlPsitMstpSsurWnonDnon_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup_loop: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup01: Acts_AidlPercMstpSlowWrflDnon_warmup_loop {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup02: Acts_AidlPercMstpSlowWrflDnon_warmup01 {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup03: Acts_AidlPercMstpSlowWrflDnon_warmup01 {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup04: Acts_AidlPercMstpSlowWrflDnon_warmup01 {
            stamina=0.8;
        };
        class Acts_AidlPercMstpSlowWrflDnon_warmup05: Acts_AidlPercMstpSlowWrflDnon_warmup01 {
            stamina=0.8;
        };
        class AfdsPercMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AfdsPercMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AfdsPercMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AfdsPercMstpSlowWpstDnon: AmovPercMstpSlowWpstDnon {
            stamina=0.6;
        };
        class AfdsPknlMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AfdsPknlMstpSlowWpstDnon: AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AfdsPpneMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AfdsPknlMstpSlowWrflDnon: AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AfdsPpneMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AfdsPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AfdsPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AfdsPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class AfdsPercMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AfdsPknlMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon {
            stamina=0.4;
        };
        class AfdsPpneMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon {
            stamina=0.8;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPercMstpSlowWrflDnon: AmovPercMstpSrasWrflDnon_AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AfdsPercMstpSlowWrflDnon_AfdsPercMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPercMstpSrasWpstDnon: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon {
            stamina=-0.5;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPercMstpSrasWpstDnon_end: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=-0.5;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPercMstpSrasWrflDnon: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon {
            stamina=-0.5;
        };
        class AfdsPknlMstpSrasWrflDnon_AfdsPknlMstpSrasWpstDnon: AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWpstDnon {
            stamina=-1;
        };
        class AfdsPknlMstpSrasWrflDnon_AfdsPknlMstpSrasWpstDnon_end: AmovPknlMstpSrasWrflDnon_AmovPknlMstpSrasWpstDnon_end {
            stamina=-1;
        };
        class AfdsPknlMstpSrasWpstDnon_AfdsPknlMstpSrasWrflDnon_end: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon_end {
            stamina=-1;
        };
        class AfdsPknlMstpSrasWpstDnon_AfdsPknlMstpSrasWrflDnon: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSrasWrflDnon {
            stamina=-1;
        };
        class AfdsPpneMstpSrasWpstDnon_AfdsPpneMstpSrasWrflDnon: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class AfdsPpneMstpSrasWpstDnon_AfdsPpneMstpSrasWrflDnon_end: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class AfdsPpneMstpSrasWrflDnon_AfdsPpneMstpSrasWpstDnon_end: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class AfdsPpneMstpSrasWrflDnon_AfdsPpneMstpSrasWpstDnon: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPercMstpSrasWrflDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=-0.5;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPknlMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon {
            stamina=-0.4;
        };
        class AfdsPknlMstpSlowWrflDnon_AfdsPercMstpSlowWrflDnon: AmovPknlMstpSlowWrflDnon_AmovPercMstpSlowWrflDnon {
            stamina=0.4;
        };
        class AfdsPercMstpSlowWrflDnon_AfdsPknlMstpSlowWrflDnon: AmovPercMstpSlowWrflDnon_AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AfdsPknlMstpSrasWrflDnon_AfdsPercMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon {
            stamina=-0.6;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPercMstpSlowWpstDnon: AmovPercMstpSrasWpstDnon_AmovPercMstpSlowWpstDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSlowWpstDnon_AfdsPercMstpSrasWpstDnon: AmovPercMstpSlowWpstDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSlowWpstDnon_AfdsPknlMstpSlowWpstDnon: AmovPercMstpSlowWpstDnon_AmovPknlMstpSlowWpstDnon {
            stamina=0.8;
        };
        class AfdspPknlMstpSlowWpstDnon_AfdspPercMstpSlowWpstDnon: AmovPknlMstpSlowWpstDnon_AmovPercMstpSlowWpstDnon {
            stamina=0.6;
        };
        class AfdsPknlMstpSlowWrflDnon_AfdsPknlMstpSrasWrflDnon: AmovPknlMstpSlowWrflDnon_AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWrflDnon_AfdsPknlMstpSlowWrflDnon: AmovPknlMstpSrasWrflDnon_AmovPknlMstpSlowWrflDnon {
            stamina=0.6;
        };
        class AfdsPpneMstpSrasWrflDnon_AfdsPknlMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon_AmovPknlMstpSrasWrflDnon {
            stamina=-1;
        };
        class AfdsPpneMstpSrasWrflDnon_AfdsPercMstpSrasWrflDnon: AmovPpneMstpSrasWrflDnon_AmovPercMstpSrasWrflDnon {
            stamina=-2;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPpneMstpSrasWrflDnon: AmovPercMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-0.5;
        };
        class AfdsPknlMstpSrasWrflDnon_AfdsPpneMstpSrasWrflDnon: AmovPknlMstpSrasWrflDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-0.4;
        };
        class AfdsPknlMstpSlowWrflDnon_AfdsPpneMstpSrasWrflDnon: AmovPknlMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AfdsPercMstpSlowWrflDnon_AfdsPpneMstpSrasWrflDnon: AmovPercMstpSlowWrflDnon_AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AfdsPknlMstpSrasWpstDnon_AfdsPercMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPknlMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon {
            stamina=-0.2;
        };
        class AfdsPknlMstpSlowWpstDnon_AfdsPknlMstpSrasWpstDnon: AmovPknlMstpSlowWpstDnon_AmovPknlMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSrasWpstDnon_AfdsPknlMstpSlowWpstDnon: AmovPknlMstpSrasWpstDnon_AmovPknlMstpSlowWpstDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSlowWpstDnon_AfdsPpneMstpSrasWpstDnon: AmovPercMstpSlowWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPpneMstpSrasWpstDnon: AmovPercMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AfdsPknlMstpSlowWpstDnon_AfdsPpneMstpSrasWpstDnon: AmovPknlMstpSlowWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.4;
        };
        class AfdsPknlMstpSrasWpstDnon_AfdsPpneMstpSrasWpstDnon: AmovPknlMstpSrasWpstDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-0.2;
        };
        class AfdsPpneMstpSrasWpstDnon_AfdsPknlMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon_AmovPknlMstpSrasWpstDnon {
            stamina=-0.8;
        };
        class AfdsPpneMstpSrasWpstDnon_AfdsPercMstpSrasWpstDnon: AmovPpneMstpSrasWpstDnon_AmovPercMstpSrasWpstDnon {
            stamina=-1;
        };
        class AfdsPercMstpSnonWnonDnon_AfdsPknlMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AfdsPercMstpSnonWnonDnon_AfdsPpneMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon {
            stamina=-0.6;
        };
        class AfdsPknlMstpSnonWnonDnon_AfdsPercMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class AfdsPknlMstpSnonWnonDnon_AfdsPpneMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class AfdsPpneMstpSnonWnonDnon_AfdsPknlMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_AmovPknlMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AfdsPpneMstpSnonWnonDnon_AfdsPercMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon {
            stamina=-1;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPercMstpSnonWnonDnon: AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSrasWpstDnon_AfdsPercMstpSnonWnonDnon_end: AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon_end {
            stamina=0.5;
        };
        class AfdsPercMstpSrasWrflDnon_AfdsPercMstpSnonWnonDnon: AmovPercMstpSrasWrflDnon_AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AfdsPercMstpSnonWnonDnon_AfdsPercMstpSrasWrflDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSnonWnonDnon_AfdsPknlMstpSrasWrflDnon: AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AfdsPpneMstpSnonWnonDnon_AfdsPpneMstpSrasWrflDnon: AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSnonWnonDnon_AfdsPercMstpSrasWpstDnon: AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSnonWnonDnon_AfdsPercMstpSrasWpstDnon_end: AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.5;
        };
        class AfdsPknlMstpSnonWnonDnon_AfdsPknlMstpSrasWpstDnon: AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSnonWnonDnon_AfdsPknlMstpSrasWpstDnon_end: AmovPknlMstpSnonWnonDnon_AmovPknlMstpSrasWpstDnon_end {
            stamina=0.5;
        };
        class AfdsPpneMstpSnonWnonDnon_AfdsPpneMstpSrasWpstDnon: AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AfdsPpneMstpSnonWnonDnon_AfdsPpneMstpSrasWpstDnon_end: AmovPpneMstpSnonWnonDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=0.5;
        };
        class AfdsPercMstpSoptWbinDnon_AfdsPknlMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon_AmovPknlMstpSoptWbinDnon {
            stamina=-0.1;
        };
        class AfdsPercMstpSoptWbinDnon_AfdsPpneMstpSoptWbinDnon: AmovPercMstpSoptWbinDnon_AmovPpneMstpSoptWbinDnon {
            stamina=-0.6;
        };
        class AfdsPknlMstpSoptWbinDnon_AfdsPercMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon_AmovPercMstpSoptWbinDnon {
            stamina=-0.2;
        };
        class AfdsPknlMstpSoptWbinDnon_AfdsPpneMstpSoptWbinDnon: AmovPknlMstpSoptWbinDnon_AmovPpneMstpSoptWbinDnon {
            stamina=-0.1;
        };
        class AfdsPpneMstpSoptWbinDnon_AfdsPercMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon_AmovPercMstpSoptWbinDnon {
            stamina=-1;
        };
        class AfdsPpneMstpSoptWbinDnon_AfdsPknlMstpSoptWbinDnon: AmovPpneMstpSoptWbinDnon_AmovPknlMstpSoptWbinDnon {
            stamina=-0.6;
        };
        class AfdsPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon: AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSnonWnonDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon: AmovPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSnonWnonDnon_AwopPknlMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon: AmovPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSrasWpstDnon_AwopPknlMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon: AmovPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon_end: AmovPknlMstpSrasWrflDnon_AwopPknlMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class AfdsPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon: AmovPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSnonWnonDnon_AwopPpneMstpSoptWbinDnon_end {
            stamina=0.8;
        };
        class AfdsPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon: AmovPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSrasWpstDnon_AwopPpneMstpSoptWbinDnon_end {
            stamina=0.8;
        };
        class AfdsPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon: AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon {
            stamina=0.5;
        };
        class AfdsPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon_end: AmovPpneMstpSrasWrflDnon_AwopPpneMstpSoptWbinDnon_end {
            stamina=0.8;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSnonWnonDnon: AwopPercMstpSoptWbinDnon_AmovPercMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSnonWnonDnon_end: AwopPercMstpSoptWbinDnon_AmovPercMstpSnonWnonDnon_end {
            stamina=0.8;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSrasWpstDnon: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSrasWpstDnon_end: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSrasWrflDnon: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AwopPercMstpSoptWbinDnon_AfdsPercMstpSrasWrflDnon_end: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSnonWnonDnon: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSnonWnonDnon_end: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSnonWnonDnon_end {
            stamina=1;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSrasWpstDnon: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSrasWpstDnon_end: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWpstDnon_end {
            stamina=0.6;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSrasWrflDnon: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AwopPknlMstpSoptWbinDnon_AfdsPknlMstpSrasWrflDnon_end: AwopPknlMstpSoptWbinDnon_AmovPknlMstpSrasWrflDnon_end {
            stamina=0.4;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSnonWnonDnon: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSnonWnonDnon {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSnonWnonDnon_end: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSnonWnonDnon_end {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSrasWpstDnon: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWpstDnon {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSrasWpstDnon_end: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=1;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSrasWrflDnon: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWrflDnon {
            stamina=0.5;
        };
        class AwopPpneMstpSoptWbinDnon_AfdsPpneMstpSrasWrflDnon_end: AwopPpneMstpSoptWbinDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=0.8;
        };
        class AfdsPercMstpSrasWrflDnon_turnL: AmovPercMstpSrasWrflDnon_turnL {
            stamina=0;
        };
        class AfdsPercMstpSrasWrflDnon_turnR: AmovPercMstpSrasWrflDnon_turnR {
            stamina=0;
        };
        class AfdsPercMstpSlowWrflDnon_turnL: AmovPercMstpSlowWrflDnon_turnL {
            stamina=0.2;
        };
        class AfdsPercMstpSlowWrflDnon_turnR: AmovPercMstpSlowWrflDnon_turnR {
            stamina=0.2;
        };
        class AfdsPknlMstpSrasWrflDnon_turnL: AmovPknlMstpSrasWrflDnon_turnL {
            stamina=0.2;
        };
        class AfdsPknlMstpSrasWrflDnon_turnR: AmovPknlMstpSrasWrflDnon_turnR {
            stamina=0.2;
        };
        class AfdsPknlMstpSlowWrflDnon_turnL: AmovPknlMstpSlowWrflDnon_turnL {
            stamina=0.4;
        };
        class AfdsPknlMstpSlowWrflDnon_turnR: AmovPknlMstpSlowWrflDnon_turnR {
            stamina=0.4;
        };
        class AfdsPpneMstpSrasWrflDnon_turnL: AmovPpneMstpSrasWrflDnon_turnL {
            stamina=0.6;
        };
        class AfdsPpneMstpSrasWrflDnon_turnR: AmovPpneMstpSrasWrflDnon_turnR {
            stamina=0.6;
        };
        class AfdsPercMstpSrasWpstDnon_turnL: AmovPercMstpSrasWpstDnon_turnL {
            stamina=0.2;
        };
        class AfdsPercMstpSrasWpstDnon_turnR: AmovPercMstpSrasWpstDnon_turnR {
            stamina=0.2;
        };
        class AfdsPercMstpSlowWpstDnon_turnL: AmovPercMstpSlowWpstDnon_turnL {
            stamina=0.4;
        };
        class AfdsPercMstpSlowWpstDnon_turnR: AmovPercMstpSlowWpstDnon_turnR {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWpstDnon_turnL: AmovPknlMstpSrasWpstDnon_turnL {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWpstDnon_turnR: AmovPknlMstpSrasWpstDnon_turnR {
            stamina=0.4;
        };
        class AfdsPknlMstpSlowWpstDnon_turnL: AmovPknlMstpSlowWpstDnon_turnL {
            stamina=0.6;
        };
        class AfdsPknlMstpSlowWpstDnon_turnR: AmovPknlMstpSlowWpstDnon_turnR {
            stamina=0.8;
        };
        class AfdsPpneMstpSrasWpstDnon_turnL: AmovPpneMstpSrasWpstDnon_turnL {
            stamina=0.8;
        };
        class AfdsPpneMstpSrasWpstDnon_turnR: AmovPpneMstpSrasWpstDnon_turnR {
            stamina=0.8;
        };
        class AfdsPercMstpSnonWnonDnon_turnL: AmovPercMstpSnonWnonDnon_turnL {
            stamina=0.8;
        };
        class AfdsPercMstpSnonWnonDnon_turnR: AmovPercMstpSnonWnonDnon_turnR {
            stamina=0.8;
        };
        class AfdsPknlMstpSnonWnonDnon_turnL: AmovPknlMstpSnonWnonDnon_turnL {
            stamina=1;
        };
        class AfdsPknlMstpSnonWnonDnon_turnR: AmovPknlMstpSnonWnonDnon_turnR {
            stamina=1;
        };
        class AfdsPpneMstpSnonWnonDnon_turnL: AmovPpneMstpSnonWnonDnon_turnL {
            stamina=1;
        };
        class AfdsPpneMstpSnonWnonDnon_turnR: AmovPpneMstpSnonWnonDnon_turnR {
            stamina=1;
        };
        class AfdsPercMstpSoptWbinDnon_turnL: AmovPercMstpSoptWbinDnon_turnL {
            stamina=0.4;
        };
        class AfdsPercMstpSoptWbinDnon_turnR: AmovPercMstpSoptWbinDnon_turnR {
            stamina=0.4;
        };
        class AfdsPknlMstpSoptWbinDnon_turnL: AmovPknlMstpSoptWbinDnon_turnL {
            stamina=0.4;
        };
        class AfdsPknlMstpSoptWbinDnon_turnR: AmovPknlMstpSoptWbinDnon_turnR {
            stamina=0.4;
        };
        class AfdsPpneMstpSoptWbinDnon_turnL: AmovPpneMstpSoptWbinDnon_turnL {
            stamina=0.8;
        };
        class AfdsPpneMstpSoptWbinDnon_turnR: AmovPpneMstpSoptWbinDnon_turnR {
            stamina=0.8;
        };
        class AfdsPercMstpSrasWrflDnon_inv: AinvPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class AfdsPercMstpSlowWrflDnon_inv: AfdsPercMstpSrasWrflDnon_inv {
            stamina=0.3;
        };
        class AfdsPknlMstpSrasWrflDnon_inv: AinvPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class AfdsPknlMstpSlowWrflDnon_inv: AfdsPknlMstpSrasWrflDnon_inv {
            stamina=0.4;
        };
        class AfdsPpneMstpSrasWrflDnon_inv: AinvPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class AfdsPercMstpSrasWpstDnon_inv: AinvPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class AfdsPercMstpSlowWpstDnon_inv: AfdsPercMstpSrasWpstDnon_inv {
            stamina=0.4;
        };
        class AfdsPknlMstpSrasWpstDnon_inv: AinvPknlMstpSrasWpstDnon {
            stamina=0.6;
        };
        class AfdsPknlMstpSlowWpstDnon_inv: AfdsPknlMstpSrasWpstDnon_inv {
            stamina=0.6;
        };
        class AfdsPpneMstpSrasWpstDnon_inv: AinvPpneMstpSrasWpstDnon {
            stamina=1;
        };
        class AfdsPercMstpSnonWnonDnon_inv: AinvPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class AfdsPknlMstpSnonWnonDnon_inv: AinvPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class AfdsPpneMstpSnonWnonDnon_inv: AinvPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class Bipod_120_TopLeft: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class Bipod_120_TopRight: Bipod_120_TopLeft {
            stamina=0.3;
        };
        class Bipod_120_BottomLeft: Bipod_120_TopLeft {
            stamina=0.3;
        };
        class Bipod_120_CenterLeft: Bipod_120_TopLeft {
            stamina=0.3;
        };
        class Bipod_120_CenterRight: Bipod_120_TopLeft {
            stamina=0.3;
        };
        class Bipod_120_BottomRight: Bipod_120_TopLeft {
            stamina=0.3;
        };
        class Bipod_130_TopLeft: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class Bipod_130_TopRight: Bipod_130_TopLeft {
            stamina=0.3;
        };
        class Bipod_130_BottomLeft: Bipod_130_TopLeft {
            stamina=0.3;
        };
        class Bipod_130_CenterLeft: Bipod_130_TopLeft {
            stamina=0.3;
        };
        class Bipod_130_CenterRight: Bipod_130_TopLeft {
            stamina=0.3;
        };
        class Bipod_130_BottomRight: Bipod_130_TopLeft {
            stamina=0.3;
        };
        class Bipod_140_TopLeft: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class Bipod_140_TopRight: Bipod_140_TopLeft {
            stamina=0.3;
        };
        class Bipod_140_BottomLeft: Bipod_140_TopLeft {
            stamina=0.3;
        };
        class Bipod_140_CenterLeft: Bipod_140_TopLeft {
            stamina=0.3;
        };
        class Bipod_140_CenterRight: Bipod_140_TopLeft {
            stamina=0.3;
        };
        class Bipod_140_BottomRight: Bipod_140_TopLeft {
            stamina=0.3;
        };
        class Bipod_150_TopLeft: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class Bipod_150_TopRight: Bipod_150_TopLeft {
            stamina=0.3;
        };
        class Bipod_150_BottomLeft: Bipod_150_TopLeft {
            stamina=0.3;
        };
        class Bipod_150_CenterLeft: Bipod_150_TopLeft {
            stamina=0.3;
        };
        class Bipod_150_CenterRight: Bipod_150_TopLeft {
            stamina=0.3;
        };
        class Bipod_150_BottomRight: Bipod_150_TopLeft {
            stamina=0.3;
        };
        class Bipod_110_TopLeft: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class Bipod_110_TopRight: Bipod_110_TopLeft {
            stamina=0.3;
        };
        class Bipod_110_BottomLeft: Bipod_110_TopLeft {
            stamina=0.3;
        };
        class Bipod_110_CenterLeft: Bipod_110_TopLeft {
            stamina=0.3;
        };
        class Bipod_110_CenterRight: Bipod_110_TopLeft {
            stamina=0.3;
        };
        class Bipod_110_BottomRight: Bipod_110_TopLeft {
            stamina=0.3;
        };
        class Bipod_100_TopLeft: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class Bipod_100_TopRight: Bipod_100_TopLeft {
            stamina=0.4;
        };
        class Bipod_100_BottomLeft: Bipod_100_TopLeft {
            stamina=0.4;
        };
        class Bipod_100_CenterLeft: Bipod_100_TopLeft {
            stamina=0.4;
        };
        class Bipod_100_CenterRight: Bipod_100_TopLeft {
            stamina=0.4;
        };
        class Bipod_100_BottomRight: Bipod_100_TopLeft {
            stamina=0.4;
        };
        class Bipod_90_TopLeft: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class Bipod_90_TopRight: Bipod_90_TopLeft {
            stamina=0.4;
        };
        class Bipod_90_BottomLeft: Bipod_90_TopLeft {
            stamina=0.4;
        };
        class Bipod_90_CenterLeft: Bipod_90_TopLeft {
            stamina=0.4;
        };
        class Bipod_90_CenterRight: Bipod_90_TopLeft {
            stamina=0.4;
        };
        class Bipod_90_BottomRight: Bipod_90_TopLeft {
            stamina=0.4;
        };
        class Bipod_80_TopLeft: AmovPknlMstpSrasWrflDnon {
            stamina=0.4;
        };
        class Bipod_80_TopRight: Bipod_80_TopLeft {
            stamina=0.4;
        };
        class Bipod_80_BottomLeft: Bipod_80_TopLeft {
            stamina=0.4;
        };
        class Bipod_80_CenterLeft: Bipod_80_TopLeft {
            stamina=0.4;
        };
        class Bipod_80_CenterRight: Bipod_80_TopLeft {
            stamina=0.4;
        };
        class Bipod_80_BottomRight: Bipod_80_TopLeft {
            stamina=0.4;
        };
        class Bipod_60_TopLeft: AadjPpneMstpSrasWrflDup {
            stamina=0.8;
        };
        class Bipod_60_TopRight: Bipod_60_TopLeft {
            stamina=0.8;
        };
        class Bipod_60_BottomLeft: Bipod_60_TopLeft {
            stamina=0.8;
        };
        class Bipod_60_CenterLeft: Bipod_60_TopLeft {
            stamina=0.8;
        };
        class Bipod_60_CenterRight: Bipod_60_TopLeft {
            stamina=0.8;
        };
        class Bipod_60_BottomRight: Bipod_60_TopLeft {
            stamina=0.8;
        };
        class ProneBipod_TopLeft: AmovPpneMstpSrasWrflDnon {
            stamina=0.8;
        };
        class ProneBipod_TopRight: ProneBipod_TopLeft {
            stamina=0.8;
        };
        class ProneBipod_BottomLeft: ProneBipod_TopLeft {
            stamina=0.8;
        };
        class ProneBipod_CenterLeft: ProneBipod_TopLeft {
            stamina=0.8;
        };
        class ProneBipod_CenterRight: ProneBipod_TopLeft {
            stamina=0.8;
        };
        class ProneBipod_BottomRight: ProneBipod_TopLeft {
            stamina=0.8;
        };
        class ApanPercMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class ApanPercMrunSnonWnonDf: ApanPercMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDfl: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDfr: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDl: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDr: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDb: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDbl: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPercMrunSnonWnonDbr: ApanPercMrunSnonWnonDf {
            stamina=-0.1;
        };
        class ApanPknlMstpSnonWnonDnon: AmovPknlMstpSnonWnonDnon {
            stamina=1;
        };
        class ApanPknlMrunSnonWnonDf: ApanPknlMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDfl: ApanPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDfr: ApanPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDl: ApanPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDr: ApanPknlMrunSnonWnonDl {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDb: ApanPknlMrunSnonWnonDf {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDbl: ApanPknlMrunSnonWnonDb {
            stamina=-0.2;
        };
        class ApanPknlMrunSnonWnonDbr: ApanPknlMrunSnonWnonDb {
            stamina=-0.2;
        };
        class ApanPpneMstpSnonWnonDnon: AmovPpneMstpSnonWnonDnon {
            stamina=1;
        };
        class ApanPpneMrunSnonWnonDf: ApanPpneMstpSnonWnonDnon {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDfl: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDfr: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDl: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDr: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDb: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDbl: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPpneMrunSnonWnonDbr: ApanPpneMrunSnonWnonDf {
            stamina=-0.3;
        };
        class ApanPercMwlkSnonWnonDf: ApanPercMstpSnonWnonDnon {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDfl: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDfr: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDl: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDr: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDb: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDbl: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPercMwlkSnonWnonDbr: ApanPercMwlkSnonWnonDf {
            stamina=0.6;
        };
        class ApanPknlMwlkSnonWnonDf: ApanPknlMstpSnonWnonDnon {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDfl: ApanPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDfr: ApanPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDl: ApanPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDr: ApanPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDb: ApanPknlMwlkSnonWnonDf {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDbl: ApanPknlMwlkSnonWnonDb {
            stamina=0;
        };
        class ApanPknlMwlkSnonWnonDbr: ApanPknlMwlkSnonWnonDb {
            stamina=0;
        };
        class ApanPercMsprSnonWnonDf: ApanPercMstpSnonWnonDnon {
            stamina=-0.6;
        };
        class ApanPercMsprSnonWnonDfl: ApanPercMsprSnonWnonDf {
            stamina=-0.6;
        };
        class ApanPercMsprSnonWnonDfr: ApanPercMsprSnonWnonDf {
            stamina=-0.6;
        };
        class ApanPknlMsprSnonWnonDf: ApanPknlMstpSnonWnonDnon {
            stamina=-0.8;
        };
        class ApanPknlMsprSnonWnonDfl: ApanPknlMsprSnonWnonDf {
            stamina=-0.8;
        };
        class ApanPknlMsprSnonWnonDfr: ApanPknlMsprSnonWnonDf {
            stamina=-0.8;
        };
        class ApanPpneMsprSnonWnonDf: ApanPpneMstpSnonWnonDnon {
            stamina=-1;
        };
        class ApanPercMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon: ApanPknlMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class ApanPercMstpSnonWnonDnon_ApanPpneMstpSnonWnonDnon: ApanPpneMstpSnonWnonDnon {
            stamina=-0.6;
        };
        class ApanPknlMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon: ApanPercMstpSnonWnonDnon {
            stamina=-0.2;
        };
        class ApanPknlMstpSnonWnonDnon_ApanPpneMstpSnonWnonDnon: ApanPpneMstpSnonWnonDnon {
            stamina=-0.1;
        };
        class ApanPpneMstpSnonWnonDnon_ApanPercMstpSnonWnonDnon: ApanPercMstpSnonWnonDnon {
            stamina=-1;
        };
        class ApanPpneMstpSnonWnonDnon_ApanPknlMstpSnonWnonDnon: ApanPknlMstpSnonWnonDnon {
            stamina=-0.4;
        };
        class AdvePercMstpSnonWnonDnon_Transition: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_Transition: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_Transition: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMrunSnonWnonDf_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWnonDnon_Transition {
            stamina=0.3;
        };
        class AdvePercMrunSnonWnonDb_AdvePercMstpSnonWnonDnon: AdvePercMrunSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMrunSnonWnonDl_AdvePercMstpSnonWnonDnon: AdvePercMrunSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMrunSnonWnonDr_AdvePercMstpSnonWnonDnon: AdvePercMrunSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMrunSnonWnonDf: AdvePercMrunSnonWnonDf {
            stamina=-0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMrunSnonWnonDb: AdvePercMrunSnonWnonDb {
            stamina=-0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMrunSnonWnonDl: AdvePercMrunSnonWnonDl {
            stamina=-0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMrunSnonWnonDr: AdvePercMrunSnonWnonDr {
            stamina=-0.3;
        };
        class AsdvPercMrunSnonWnonDf_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWnonDnon_Transition {
            stamina=0.3;
        };
        class AsdvPercMrunSnonWnonDb_AsdvPercMstpSnonWnonDnon: AsdvPercMrunSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMrunSnonWnonDl_AsdvPercMstpSnonWnonDnon: AsdvPercMrunSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMrunSnonWnonDr_AsdvPercMstpSnonWnonDnon: AsdvPercMrunSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMrunSnonWnonDf: AsdvPercMrunSnonWnonDf {
            stamina=-0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMrunSnonWnonDb: AsdvPercMrunSnonWnonDb {
            stamina=-0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMrunSnonWnonDl: AsdvPercMrunSnonWnonDl {
            stamina=-0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMrunSnonWnonDr: AsdvPercMrunSnonWnonDr {
            stamina=-0.2;
        };
        class AbdvPercMrunSnonWnonDf_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWnonDnon_Transition {
            stamina=0.3;
        };
        class AbdvPercMrunSnonWnonDb_AbdvPercMstpSnonWnonDnon: AbdvPercMrunSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMrunSnonWnonDl_AbdvPercMstpSnonWnonDnon: AbdvPercMrunSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMrunSnonWnonDr_AbdvPercMstpSnonWnonDnon: AbdvPercMrunSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMrunSnonWnonDf: AbdvPercMrunSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMrunSnonWnonDb: AbdvPercMrunSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMrunSnonWnonDl: AbdvPercMrunSnonWnonDl {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMrunSnonWnonDr: AbdvPercMrunSnonWnonDr {
            stamina=0.2;
        };
        class AdvePercMwlkSnonWnonDf_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMwlkSnonWnonDb_AdvePercMstpSnonWnonDnon: AdvePercMwlkSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMwlkSnonWnonDl_AdvePercMstpSnonWnonDnon: AdvePercMwlkSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMwlkSnonWnonDr_AdvePercMstpSnonWnonDnon: AdvePercMwlkSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMwlkSnonWnonDf: AdvePercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMwlkSnonWnonDb: AdvePercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMwlkSnonWnonDl: AdvePercMwlkSnonWnonDl {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMwlkSnonWnonDr: AdvePercMwlkSnonWnonDr {
            stamina=0.2;
        };
        class AsdvPercMwlkSnonWnonDf_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMwlkSnonWnonDb_AsdvPercMstpSnonWnonDnon: AsdvPercMwlkSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMwlkSnonWnonDl_AsdvPercMstpSnonWnonDnon: AsdvPercMwlkSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMwlkSnonWnonDr_AsdvPercMstpSnonWnonDnon: AsdvPercMwlkSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMwlkSnonWnonDf: AsdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMwlkSnonWnonDb: AsdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMwlkSnonWnonDl: AsdvPercMwlkSnonWnonDl {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMwlkSnonWnonDr: AsdvPercMwlkSnonWnonDr {
            stamina=0.2;
        };
        class AbdvPercMwlkSnonWnonDf_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMwlkSnonWnonDb_AbdvPercMstpSnonWnonDnon: AbdvPercMwlkSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMwlkSnonWnonDl_AbdvPercMstpSnonWnonDnon: AbdvPercMwlkSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMwlkSnonWnonDr_AbdvPercMstpSnonWnonDnon: AbdvPercMwlkSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMwlkSnonWnonDf: AbdvPercMwlkSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMwlkSnonWnonDb: AbdvPercMwlkSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMwlkSnonWnonDl: AbdvPercMwlkSnonWnonDl {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMwlkSnonWnonDr: AbdvPercMwlkSnonWnonDr {
            stamina=0.2;
        };
        class AdvePercMtacSnonWnonDf_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMtacSnonWnonDb_AdvePercMstpSnonWnonDnon: AdvePercMtacSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMtacSnonWnonDl_AdvePercMstpSnonWnonDnon: AdvePercMtacSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMtacSnonWnonDr_AdvePercMstpSnonWnonDnon: AdvePercMtacSnonWnonDf_AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMtacSnonWnonDf: AdvePercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMtacSnonWnonDb: AdvePercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMtacSnonWnonDl: AdvePercMtacSnonWnonDl {
            stamina=0.2;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMtacSnonWnonDr: AdvePercMtacSnonWnonDr {
            stamina=0.2;
        };
        class AsdvPercMtacSnonWnonDf_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMtacSnonWnonDb_AsdvPercMstpSnonWnonDnon: AsdvPercMtacSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMtacSnonWnonDl_AsdvPercMstpSnonWnonDnon: AsdvPercMtacSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMtacSnonWnonDr_AsdvPercMstpSnonWnonDnon: AsdvPercMtacSnonWnonDf_AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMtacSnonWnonDf: AsdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMtacSnonWnonDb: AsdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMtacSnonWnonDl: AsdvPercMtacSnonWnonDl {
            stamina=0.2;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMtacSnonWnonDr: AsdvPercMtacSnonWnonDr {
            stamina=0.2;
        };
        class AbdvPercMtacSnonWnonDf_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMtacSnonWnonDb_AbdvPercMstpSnonWnonDnon: AbdvPercMtacSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMtacSnonWnonDl_AbdvPercMstpSnonWnonDnon: AbdvPercMtacSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMtacSnonWnonDr_AbdvPercMstpSnonWnonDnon: AbdvPercMtacSnonWnonDf_AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMtacSnonWnonDf: AbdvPercMtacSnonWnonDf {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMtacSnonWnonDb: AbdvPercMtacSnonWnonDb {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMtacSnonWnonDl: AbdvPercMtacSnonWnonDl {
            stamina=0.2;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMtacSnonWnonDr: AbdvPercMtacSnonWnonDr {
            stamina=0.2;
        };
        class AdvePercMsprSnonWnonDf_AdvePercMstpSnonWnonDnon: AdvePercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AdvePercMstpSnonWnonDnon_AdvePercMsprSnonWnonDf: AdvePercMsprSnonWnonDf {
            stamina=-0.8;
        };
        class AsdvPercMsprSnonWnonDf_AsdvPercMstpSnonWnonDnon: AsdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AsdvPercMstpSnonWnonDnon_AsdvPercMsprSnonWnonDf: AsdvPercMsprSnonWnonDf {
            stamina=-0.8;
        };
        class AbdvPercMsprSnonWnonDf_AbdvPercMstpSnonWnonDnon: AbdvPercMstpSnonWnonDnon {
            stamina=0.3;
        };
        class AbdvPercMstpSnonWnonDnon_AbdvPercMsprSnonWnonDf: AbdvPercMsprSnonWnonDf {
            stamina=-0.6;
        };
        class Acts_EpicSplit: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_EpicSplit_in: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Acts_EpicSplit_out: CutSceneAnimationBase {
            stamina=0.8;
        };
        class Mortar_01_F_Dead: DefaultDie {
            stamina=0.5;
        };
        class Mortar_01_F_Turret: Crew {
            stamina=0.5;
        };
        class Static_Dead: DefaultDie {
            stamina=0.5;
        };
        class Static_Turret: Crew {
            stamina=0.5;
        };
        class Mk201_Dead: DefaultDie {
            stamina=0.5;
        };
        class Mk201_Turret: Crew {
            stamina=0.5;
        };
        class Mk34_Dead: DefaultDie {
            stamina=0.5;
        };
        class Mk34_Turret: Crew {
            stamina=0.5;
        };
        class KIA_chopperLight_L_01_H: DefaultDie {
            stamina=0.5;
        };
        class KIA_chopperLight_L_02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_L_03_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_R_01_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_R_02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_RP_01_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_RP_02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_RP_03_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_C_L01_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_C_L02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_C_R01_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_C_R02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_CB_01_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class KIA_chopperLight_CB_02_H: KIA_chopperLight_L_01_H {
            stamina=0.5;
        };
        class ChopperLight_L_static_H_getin: Crew {
            stamina=0.5;
        };
        class ChopperLight_L_static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_R_static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_RP_static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_C_L_static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_C_R_static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_CB_Static_H: Crew {
            stamina=0.5;
        };
        class ChopperLight_RP_idleA_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleBored_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleBoredB_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleCtalk_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleDtalk_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleE_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleF_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleG_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleH_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_RP_idleI_H: ChopperLight_RP_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_L_idleA_H: ChopperLight_C_L_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_L_idleB_H: ChopperLight_C_L_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_L_idleC_H: ChopperLight_C_L_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_L_idleD_H: ChopperLight_C_L_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_R_idleA_H: ChopperLight_C_R_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_R_idleB_H: ChopperLight_C_R_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_R_idleC_H: ChopperLight_C_R_static_H {
            stamina=0.5;
        };
        class ChopperLight_C_R_idleD_H: ChopperLight_C_R_static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle1shaky_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle1stable_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle2lookleft_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle3lookright_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle4_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle5lookdown_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle6pointing_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_CB_idle7lookaround_H: ChopperLight_CB_Static_H {
            stamina=0.5;
        };
        class ChopperLight_L_In_H: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class ChopperLight_L_Out_H: ChopperLight_L_In_H {
            stamina=0.8;
        };
        class bench_Heli_Light_01_get_in: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class bench_Heli_Light_01_get_out: bench_Heli_Light_01_get_in {
            stamina=0.8;
        };
        class Chopperlight_R_In_H: ChopperLight_L_In_H {
            stamina=0.8;
        };
        class Chopperlight_R_Out_H: ChopperLight_L_Out_H {
            stamina=0.8;
        };
        class ChopperLight_C_LIn_H: ChopperLight_L_In_H {
            stamina=0.8;
        };
        class ChopperLight_C_LOut_H: ChopperLight_L_Out_H {
            stamina=0.8;
        };
        class ChopperLight_C_Rin_H: ChopperLight_L_In_H {
            stamina=0.8;
        };
        class ChopperLight_C_Rout_H: ChopperLight_L_Out_H {
            stamina=0.8;
        };
        class KIA_ChopperHeavy_R_01_H: DefaultDie {
            stamina=0.5;
        };
        class KIA_chopperHeavy_R_02_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_R_03_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_L_01_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_L_02_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_LP_01_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_LP_02_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class KIA_chopperHeavy_LP_03_H: KIA_ChopperHeavy_R_01_H {
            stamina=0.5;
        };
        class ChopperHeavy_R_Static_H: Crew {
            stamina=0.5;
        };
        class ChopperHeavy_L_Static_H: Crew {
            stamina=0.5;
        };
        class ChopperHeavy_LP_Static_H: Crew {
            stamina=0.5;
        };
        class ChopperHeavy_R_GetIn_H: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class ChopperHeavy_R_GetOut_H: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class ChopperHeavy_L_GetIn_H: ChopperHeavy_R_GetIn_H {
            stamina=0.8;
        };
        class ChopperHeavy_L_GetOut_H: ChopperHeavy_R_GetOut_H {
            stamina=0.8;
        };
        class ChopperHeavy_Lux_GetIn_H: ChopperHeavy_R_GetIn_H {
            stamina=0.8;
        };
        class ChopperHeavy_Lux_GetOut_H: ChopperHeavy_R_GetOut_H {
            stamina=0.8;
        };
        class PreciseCrew: Crew {
            stamina=0.5;
        };
        class KIA_Pilot_Plane_Civil_01: DefaultDie {
            stamina=0.5;
        };
        class Pilot_Plane_Civil_01: Crew {
            stamina=0.5;
        };
        class Pilot_Plane_Civil_01_GetIn: PreciseCrew {
            stamina=0.5;
        };
        class Pilot_Plane_Civil_01_GetOut: Pilot_Plane_Civil_01_GetIn {
            stamina=0.5;
        };
        class KIA_Copilot_Plane_Civil_01: DefaultDie {
            stamina=0.5;
        };
        class Copilot_Plane_Civil_01: Crew {
            stamina=0.5;
        };
        class Copilot_Plane_Civil_01_GetIn: PreciseCrew {
            stamina=0.5;
        };
        class Copilot_Plane_Civil_01_GetOut: Copilot_Plane_Civil_01_GetIn {
            stamina=0.5;
        };
        class KIA_Passenger_Plane_Civil_01_L: DefaultDie {
            stamina=0.5;
        };
        class Passenger_Plane_Civil_01_L: Crew {
            stamina=0.5;
        };
        class KIA_Passenger_Plane_Civil_01_R: DefaultDie {
            stamina=0.5;
        };
        class Passenger_Plane_Civil_01_R: Crew {
            stamina=0.5;
        };
        class PBX_Driver: Crew {
            stamina=0.5;
        };
        class PBX_Cargo01: Crew {
            stamina=0.5;
        };
        class PBX_Cargo02: Crew {
            stamina=0.5;
        };
        class PBX_Cargo03: Crew {
            stamina=0.5;
        };
        class KIA_RHIB_Driver: DefaultDie {
            stamina=0.5;
        };
        class RHIB_Driver: Crew {
            stamina=0.5;
        };
        class RHIB_Gunner: Crew {
            stamina=0.5;
        };
        class KIA_RHIB_Cargo: DefaultDie {
            stamina=0.5;
        };
        class Zodiac_Dead: KIA_RHIB_Cargo {
            stamina=0.5;
        };
        class RHIB_Cargo: Crew {
            stamina=0.5;
        };
        class Zodiac_Driver: Crew {
            stamina=0.5;
        };
        class KIA_Zodiac_Driver: DefaultDie {
            stamina=0.5;
        };
        class Zodiac_Cargo01: Crew {
            stamina=0.5;
        };
        class KIA_Zodiac_Cargo_1: DefaultDie {
            stamina=0.5;
        };
        class Zodiac_Cargo02: Crew {
            stamina=0.5;
        };
        class KIA_Zodiac_Cargo_2: DefaultDie {
            stamina=0.5;
        };
        class Zodiac_Cargo03: Crew {
            stamina=0.5;
        };
        class KIA_Zodiac_Cargo_3: DefaultDie {
            stamina=0.5;
        };
        class Zodiac_Cargo04: Crew {
            stamina=0.5;
        };
        class KIA_Zodiac_Cargo_4: DefaultDie {
            stamina=0.5;
        };
        class KIA_Truck_02_Driver: DefaultDie {
            stamina=0.5;
        };
        class Truck_02_Driver: Crew {
            stamina=0.5;
        };
        class KIA_Truck_Driver: DefaultDie {
            stamina=0.5;
        };
        class Truck_Driver: Crew {
            stamina=0.5;
        };
        class KIA_Truck_Cargo01: KIA_Truck_Driver {
            stamina=0.5;
        };
        class Truck_Cargo01: Crew {
            stamina=0.5;
        };
        class Grad_Gunner: Crew {
            stamina=0.5;
        };
        class KIA_Truck_Cargo02: KIA_Truck_Driver {
            stamina=0.5;
        };
        class Truck_Cargo02: Crew {
            stamina=0.5;
        };
        class Truck_Cargo02_V1: Truck_Cargo02 {
            stamina=0.5;
        };
        class Truck_Cargo02_V2: Truck_Cargo02 {
            stamina=0.5;
        };
        class Truck_Cargo02_V3: Truck_Cargo02 {
            stamina=0.5;
        };
        class Truck_Cargo02_V4: Truck_Cargo02_V1 {
            stamina=0.5;
        };
        class KIA_Truck_Cargo03: KIA_Truck_Driver {
            stamina=0.5;
        };
        class Truck_Cargo03: Crew {
            stamina=0.5;
        };
        class Truck_Cargo03_V1: Truck_Cargo03 {
            stamina=0.5;
        };
        class Truck_Cargo03_V2: Truck_Cargo03 {
            stamina=0.5;
        };
        class KIA_Truck_Cargo04: KIA_Truck_Driver {
            stamina=0.5;
        };
        class Truck_Cargo04: Crew {
            stamina=0.5;
        };
        class Truck_Cargo04_V1: Truck_Cargo04 {
            stamina=0.5;
        };
        class Truck_Cargo04_V2: Truck_Cargo04 {
            stamina=0.5;
        };
        class Truck_Cargo04_V3: Truck_Cargo04 {
            stamina=0.5;
        };
        class Kart_driver: Crew {
            stamina=0.5;
        };
        class Kart_driver_KIA: Crew {
            stamina=0.5;
        };
        class KIA_Driver_High01: DefaultDie {
            stamina=0.5;
        };
        class Driver_High01: Crew {
            stamina=0.5;
        };
        class KIA_Driver_low01: DefaultDie {
            stamina=0.5;
        };
        class Driver_low01: Crew {
            stamina=0.5;
        };
        class KIA_Driver_mid01: DefaultDie {
            stamina=0.5;
        };
        class KIA_driver_Van_01: DefaultDie {
            stamina=0.5;
        };
        class Driver_mid01: Crew {
            stamina=0.5;
        };
        class driver_mid01_idlebreathing: Crew {
            stamina=0.5;
        };
        class driver_MRAP_01_settlein: Crew {
            stamina=0.5;
        };
        class driver_MRAP_01: Crew {
            stamina=0.5;
        };
        class driver_Quadbike: Crew {
            stamina=0.5;
        };
        class GetInQuadbike: Crew {
            stamina=0.5;
        };
        class GetOutQuadbike: GetInQuadbike {
            stamina=0.5;
        };
        class passenger_Quadbike: Crew {
            stamina=0.5;
        };
        class GetInQuadbike_cargo: Crew {
            stamina=0.5;
        };
        class GetOutQuadbike_cargo: GetInQuadbike_cargo {
            stamina=0.5;
        };
        class GetInMortar: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetOutMortar: GetInMortar {
            stamina=0.8;
        };
        class Mortar_Gunner: GetInMortar {
            stamina=0.8;
        };
        class GetInHeli_Transport_01Cargo: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetInHeli_Transport_02Cargo: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class KIA_pilot_Heli_Transport_01: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Transport_01: Crew {
            stamina=0.5;
        };
        class KIA_gunner_Heli_Transport_01: DefaultDie {
            stamina=0.5;
        };
        class gunner_Heli_Transport_01: Crew {
            stamina=0.5;
        };
        class KIA_driver_hemtt: DefaultDie {
            stamina=0.5;
        };
        class driver_hemtt: Crew {
            stamina=0.5;
        };
        class KIA_driver_ugv_01: DefaultDie {
            stamina=0.5;
        };
        class driver_ugv_01: Crew {
            stamina=0.5;
        };
        class GetInAMV_cargo: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetInMRAP_03: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class KIA_driver_Truck_02: DefaultDie {
            stamina=0.5;
        };
        class driver_Truck_02: Crew {
            stamina=0.5;
        };
        class KIA_driver_Truck_03: DefaultDie {
            stamina=0.5;
        };
        class driver_Truck_03_settlein: Crew {
            stamina=0.5;
        };
        class driver_Truck_03: Crew {
            stamina=0.5;
        };
        class driver_offroad01_settlein: Crew {
            stamina=0.5;
        };
        class driver_offroad01: Crew {
            stamina=0.5;
        };
        class driver_Van_01_settlein: Crew {
            stamina=0.5;
        };
        class driver_Van_01: Crew {
            stamina=0.5;
        };
        class driver_tractor_settlein: Crew {
            stamina=0.5;
        };
        class driver_tractor: Crew {
            stamina=0.5;
        };
        class KIA_driver_tractor: DefaultDie {
            stamina=0.5;
        };
        class GetInOffroad: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetInHemttBack: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetInOffroadBack: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetInOffroadCargo: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class driver_boat01_settlein: Crew {
            stamina=0.5;
        };
        class driver_boat01: Crew {
            stamina=0.5;
        };
        class KIA_driver_boat01: DefaultDie {
            stamina=0.5;
        };
        class commander_MRAP_03_settlein: Crew {
            stamina=0.5;
        };
        class commander_MRAP_03: Crew {
            stamina=0.5;
        };
        class KIA_commander_MRAP_03: DefaultDie {
            stamina=0.5;
        };
        class driver_MRAP_03: Crew {
            stamina=0.5;
        };
        class KIA_driver_MRAP_03: DefaultDie {
            stamina=0.5;
        };
        class KIA_driver_mantis: DefaultDie {
            stamina=0.5;
        };
        class driver_mantis_settlein: Crew {
            stamina=0.5;
        };
        class driver_mantis: Crew {
            stamina=0.5;
        };
        class GetInMantis: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetOutMantis: GetInMantis {
            stamina=0.8;
        };
        class GetInHeli_Light_01bench: PreciseCrew {
            stamina=0.5;
        };
        class GetOutHeli_Light_01bench: PreciseCrew {
            stamina=0.5;
        };
        class commander_sdv: Crew {
            stamina=0.5;
        };
        class KIA_commander_sdv: DefaultDie {
            stamina=0.5;
        };
        class driver_sdv_settlein: Crew {
            stamina=0.5;
        };
        class driver_sdv: Crew {
            stamina=0.5;
        };
        class KIA_driver_sdv: DefaultDie {
            stamina=0.5;
        };
        class KIA_gunner_MRAP_01: DefaultDie {
            stamina=0.5;
        };
        class gunner_MRAP_01_settlein: Crew {
            stamina=0.5;
        };
        class gunner_MRAP_01: Crew {
            stamina=0.5;
        };
        class KIA_gunner_static_low01: DefaultDie {
            stamina=0.5;
        };
        class gunner_static_low01: Crew {
            stamina=0.5;
        };
        class KIA_gunner_staticlauncher: DefaultDie {
            stamina=0.5;
        };
        class gunner_staticlauncher: Crew {
            stamina=0.5;
        };
        class KIA_gunner_mortar: DefaultDie {
            stamina=0.5;
        };
        class gunner_mortar: Crew {
            stamina=0.5;
        };
        class KIA_gunner_standup01: DefaultDie {
            stamina=0.5;
        };
        class gunner_standup01: Crew {
            stamina=0.5;
        };
        class KIA_gunner_MRAP_03: DefaultDie {
            stamina=0.5;
        };
        class gunner_MRAP_03_settlein: Crew {
            stamina=0.5;
        };
        class gunner_MRAP_03: Crew {
            stamina=0.5;
        };
        class gunner_MRAP_03_lookingatmonitor: Crew {
            stamina=0.5;
        };
        class KIA_passenger_mantisrear: DefaultDie {
            stamina=0.5;
        };
        class passenger_mantisrear: Crew {
            stamina=0.5;
        };
        class KIA_passenger_flatground: DefaultDie {
            stamina=0.5;
        };
        class KIA_passenger_flatground_generic: DefaultDie {
            stamina=0.5;
        };
        class passenger_flatground_crosslegs_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_crosslegs: Crew {
            stamina=0.5;
        };
        class passenger_flatground_leanleft_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_leanleft: Crew {
            stamina=0.5;
        };
        class passenger_flatground_leanright_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_leanright: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic01_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic01: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic02_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic02: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic03_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic03: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic04_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic04: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic05_settlein: Crew {
            stamina=0.5;
        };
        class passenger_flatground_generic05: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_generic01: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_generic01_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic01: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_generic02: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_generic02_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic02: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic02b_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic02b: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_generic03: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_generic03_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic03: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic03_low_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic03_low: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_generic04: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_generic04_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic04: Crew {
            stamina=0.5;
        };
        class passenger_apc_generic04still: passenger_apc_generic04 {
            stamina=0.5;
        };
        class KIA_passenger_apc_narrow_generic01: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic01_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic01: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic01_low_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic01_low: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_narrow_generic02: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic02_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic02: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic02_low_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic02_low: Crew {
            stamina=0.5;
        };
        class KIA_passenger_apc_narrow_generic03: DefaultDie {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03_low_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03_low: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03still_settlein: Crew {
            stamina=0.5;
        };
        class passenger_apc_narrow_generic03still: Crew {
            stamina=0.5;
        };
        class KIA_passenger_generic01: DefaultDie {
            stamina=0.5;
        };
        class passenger_generic01_foldhands_settlein: Crew {
            stamina=0.5;
        };
        class passenger_generic01_foldhands: Crew {
            stamina=0.5;
        };
        class KIA_passenger_generic02: DefaultDie {
            stamina=0.5;
        };
        class passenger_generic02_foldhands_settlein: Crew {
            stamina=0.5;
        };
        class passenger_generic02_foldhands: Crew {
            stamina=0.5;
        };
        class passenger_generic01_leanleft_settlein: Crew {
            stamina=0.5;
        };
        class passenger_generic01_leanleft: Crew {
            stamina=0.5;
        };
        class passenger_generic01_leanright_settlein: Crew {
            stamina=0.5;
        };
        class passenger_generic01_leanright: Crew {
            stamina=0.5;
        };
        class KIA_passenger_MRAP_01_back: DefaultDie {
            stamina=0.5;
        };
        class passenger_MRAP_01_back_settlein: Crew {
            stamina=0.5;
        };
        class passenger_MRAP_01_back: Crew {
            stamina=0.5;
        };
        class KIA_passenger_MRAP_01_front: DefaultDie {
            stamina=0.5;
        };
        class passenger_MRAP_01_front_settlein: Crew {
            stamina=0.5;
        };
        class passenger_MRAP_01_front: Crew {
            stamina=0.5;
        };
        class KIA_passenger_VAN_codriver01: DefaultDie {
            stamina=0.5;
        };
        class passenger_VAN_codriver01_settlein: Crew {
            stamina=0.5;
        };
        class passenger_VAN_codriver01: Crew {
            stamina=0.5;
        };
        class KIA_passenger_VAN_codriver02: DefaultDie {
            stamina=0.5;
        };
        class passenger_VAN_codriver02_settlein: Crew {
            stamina=0.5;
        };
        class passenger_VAN_codriver02: Crew {
            stamina=0.5;
        };
        class KIA_passenger_low01: DefaultDie {
            stamina=0.5;
        };
        class passenger_low01_settlein: Crew {
            stamina=0.5;
        };
        class passenger_low01: Crew {
            stamina=0.5;
        };
        class KIA_passenger_quadbike: DefaultDie {
            stamina=0.5;
        };
        class KIA_passenger_boat_rightrear: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_rightrear_settlein: Crew {
            stamina=0.5;
        };
        class passenger_boat_rightrear: Crew {
            stamina=0.5;
        };
        class KIA_passenger_boat_holdleft: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_holdleft: Crew {
            stamina=0.5;
        };
        class KIA_passenger_boat_holdleft2: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_holdleft2: Crew {
            stamina=0.5;
        };
        class KIA_passenger_boat_holdright: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_holdright: Crew {
            stamina=0.5;
        };
        class KIA_passenger_boat_holdright2: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_holdright2: Crew {
            stamina=0.5;
        };
        class KIA_passenger_injured_medevac_truck01: DefaultDie {
            stamina=0.5;
        };
        class passenger_injured_medevac_truck01: Crew {
            stamina=0.5;
        };
        class KIA_passenger_injured_medevac_truck02: DefaultDie {
            stamina=0.5;
        };
        class passenger_injured_medevac_truck02: Crew {
            stamina=0.5;
        };
        class KIA_passenger_injured_medevac_truck03: DefaultDie {
            stamina=0.5;
        };
        class passenger_injured_medevac_truck03: Crew {
            stamina=0.5;
        };
        class GetInSpeedboat: AmovPercMstpSnonWnonDnon {
            stamina=0.8;
        };
        class GetOutSpeedboat: GetInSpeedboat {
            stamina=0.8;
        };
        class GetInAssaultBoat: GetInSpeedboat {
            stamina=0.8;
        };
        class GetOutAssaultBoat: GetOutSpeedboat {
            stamina=0.8;
        };
        class KIA_passenger_MRAP_03exgunner: DefaultDie {
            stamina=0.5;
        };
        class passenger_MRAP_03exgunner_settlein: Crew {
            stamina=0.5;
        };
        class passenger_MRAP_03exgunner: Crew {
            stamina=0.5;
        };
        class passenger_sdv_settlein: Crew {
            stamina=0.5;
        };
        class passenger_sdv: Crew {
            stamina=0.5;
        };
        class KIA_passenger_sdv: DefaultDie {
            stamina=0.5;
        };
        class KIA_pilot_Heli_Attack_01: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Attack_01_settlein: Crew {
            stamina=0.5;
        };
        class pilot_Heli_Attack_01: Crew {
            stamina=0.5;
        };
        class KIA_crew_tank01: DefaultDie {
            stamina=0.5;
        };
        class crew_tank01_in: Crew {
            stamina=0.5;
        };
        class crew_tank01_out: Crew {
            stamina=0.5;
        };
        class commander_apcwheeled1_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apcwheeled1_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apcwheeled1_out: Crew {
            stamina=0.5;
        };
        class gunner_apcwheeled1_in: crew_tank01_in {
            stamina=0.5;
        };
        class gunner_apcwheeled1_out_settlein: Crew {
            stamina=0.5;
        };
        class gunner_apcwheeled1_out: Crew {
            stamina=0.5;
        };
        class driver_apcwheeled2_in: crew_tank01_in {
            stamina=0.5;
        };
        class driver_apcwheeled2_out_settlein: Crew {
            stamina=0.5;
        };
        class driver_apcwheeled2_out: Crew {
            stamina=0.5;
        };
        class driver_apctracked3_in: crew_tank01_in {
            stamina=0.5;
        };
        class driver_apctracked3_out_settlein: Crew {
            stamina=0.5;
        };
        class driver_apctracked3_out: Crew {
            stamina=0.5;
        };
        class KIA_gunner_apcwheeled3_in: DefaultDie {
            stamina=0.5;
        };
        class driver_apcwheeled3_in: crew_tank01_in {
            stamina=0.5;
        };
        class gunner_apcwheeled3_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apcwheeled2_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apcwheeled2_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apcwheeled2_out: Crew {
            stamina=0.5;
        };
        class commander_apcwheeled2hi_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apcwheeled2hi_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apcwheeled2hi_out: Crew {
            stamina=0.5;
        };
        class commander_apctracked1_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apctracked1_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apctracked1_out: Crew {
            stamina=0.5;
        };
        class commander_apctracked1rcws_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apctracked1rcws_out: Crew {
            stamina=0.5;
        };
        class commander_apctracked1aa_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apctracked1aa_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apctracked1aa_out: Crew {
            stamina=0.5;
        };
        class commander_apctracked3_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_apctracked3_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_apctracked3_out: Crew {
            stamina=0.5;
        };
        class gunner_apctracked1aa_in: crew_tank01_in {
            stamina=0.5;
        };
        class gunner_apctracked1aa_out_settlein: Crew {
            stamina=0.5;
        };
        class gunner_apctracked1aa_out: Crew {
            stamina=0.5;
        };
        class gunner_apctracked3_in: crew_tank01_in {
            stamina=0.5;
        };
        class gunner_apctracked3_out_settlein: Crew {
            stamina=0.5;
        };
        class gunner_apctracked3_out: Crew {
            stamina=0.5;
        };
        class apcwheeled3_slot1_in: crew_tank01_in {
            stamina=0.5;
        };
        class apcwheeled3_slot1_out_settlein: Crew {
            stamina=0.5;
        };
        class apcwheeled3_slot1_out: Crew {
            stamina=0.5;
        };
        class apctracked2_slot1_in: crew_tank01_in {
            stamina=0.5;
        };
        class apctracked2_slot1_out_settlein: Crew {
            stamina=0.5;
        };
        class apctracked2_slot1_out: Crew {
            stamina=0.5;
        };
        class apctracked2_slot2_in: crew_tank01_in {
            stamina=0.5;
        };
        class apctracked2_slot2_out_settlein: Crew {
            stamina=0.5;
        };
        class apctracked2_slot2_out: Crew {
            stamina=0.5;
        };
        class mbt1_slot1_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt1_slot1_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt1_slot1_out: Crew {
            stamina=0.5;
        };
        class mbt1_slot2_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt1_slot2_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt1_slot2_out: Crew {
            stamina=0.5;
        };
        class mbt1c_slot2_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt1c_slot2_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt1c_slot2_out: Crew {
            stamina=0.5;
        };
        class mbt2_slot1_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt2_slot1_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt2_slot1_out: Crew {
            stamina=0.5;
        };
        class mbt2_slot2_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt2_slot2_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt2_slot2_out: Crew {
            stamina=0.5;
        };
        class mbt2_slot2a_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt2_slot2a_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt2_slot2a_out: Crew {
            stamina=0.5;
        };
        class mbt2_slot2b_in: crew_tank01_in {
            stamina=0.5;
        };
        class mbt2_slot2b_out_settlein: Crew {
            stamina=0.5;
        };
        class mbt2_slot2b_out: Crew {
            stamina=0.5;
        };
        class commander_mbt3_in: crew_tank01_in {
            stamina=0.5;
        };
        class commander_mbt3_out_settlein: Crew {
            stamina=0.5;
        };
        class commander_mbt3_out: Crew {
            stamina=0.5;
        };
        class gunner_mbt3_in: crew_tank01_in {
            stamina=0.5;
        };
        class gunner_mbt3_out_settlein: Crew {
            stamina=0.5;
        };
        class gunner_mbt3_out: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Attack_01_Pilot: DefaultDie {
            stamina=0.5;
        };
        class Heli_Attack_01_Pilot: Crew {
            stamina=0.5;
        };
        class Heli_Attack_01_Pilot_getin: PreciseCrew {
            stamina=0.5;
        };
        class Heli_Attack_01_Pilot_getout: Heli_Attack_01_Pilot_getin {
            stamina=0.5;
        };
        class Heli_Attack_01_Gunner: Crew {
            stamina=0.5;
        };
        class Heli_Attack_01_Gunner_getin: PreciseCrew {
            stamina=0.5;
        };
        class Heli_Attack_01_Gunner_getout: Heli_Attack_01_Gunner_getin {
            stamina=0.5;
        };
        class KIA_Heli_Attack_01_Gunner: KIA_Heli_Attack_01_Pilot {
            stamina=0.5;
        };
        class KIA_Para_Pilot: DefaultDie {
            stamina=0.5;
        };
        class Para_Pilot: Crew {
            stamina=0.5;
        };
        class GetOutPara: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Light_02_Cargo: DefaultDie {
            stamina=0.5;
        };
        class Heli_Light_02_Cargo: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Light_02_Pilot: DefaultDie {
            stamina=0.5;
        };
        class Heli_Light_02_Pilot: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Light_02_Gunner: DefaultDie {
            stamina=0.5;
        };
        class Heli_Light_02_Gunner: Heli_Light_02_Pilot {
            stamina=0.5;
        };
        class pilot_Heli_Light_02_KIA: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Light_02: Crew {
            stamina=0.5;
        };
        class pilot_Heli_Light_02_Enter: PreciseCrew {
            stamina=0.5;
        };
        class pilot_Heli_Light_02_Exit: Heli_Attack_01_Pilot_getin {
            stamina=0.5;
        };
        class copilot_Heli_Light_02_KIA: DefaultDie {
            stamina=0.5;
        };
        class copilot_Heli_Light_02: Crew {
            stamina=0.5;
        };
        class copilot_Heli_Light_02_Enter: PreciseCrew {
            stamina=0.5;
        };
        class copilot_Heli_Light_02_Exit: Heli_Attack_01_Pilot_getin {
            stamina=0.5;
        };
        class pilot_Heli_Light_03_KIA: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Light_03: Crew {
            stamina=0.5;
        };
        class pilot_Heli_Light_03_Enter: PreciseCrew {
            stamina=0.5;
        };
        class pilot_Heli_Light_03_Exit: Heli_Attack_01_Pilot_getin {
            stamina=0.5;
        };
        class copilot_Heli_Light_03_KIA: DefaultDie {
            stamina=0.5;
        };
        class copilot_Heli_Light_03: Crew {
            stamina=0.5;
        };
        class copilot_Heli_Light_03_Enter: PreciseCrew {
            stamina=0.5;
        };
        class copilot_Heli_Light_03_Exit: Heli_Attack_01_Pilot_getin {
            stamina=0.5;
        };
        class KIA_Heli_Attack_02_Cargo: DefaultDie {
            stamina=0.5;
        };
        class Heli_Attack_02_Cargo: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Attack_02_Pilot: DefaultDie {
            stamina=0.5;
        };
        class Heli_Attack_02_Pilot: Crew {
            stamina=0.5;
        };
        class KIA_Heli_Attack_02_Gunner: DefaultDie {
            stamina=0.5;
        };
        class Heli_Attack_02_Gunner_settlein: Crew {
            stamina=0.5;
        };
        class Heli_Attack_02_Gunner: Heli_Attack_02_Pilot {
            stamina=0.5;
        };
        class KIA_Plane_Fighter_03_Pilot: DefaultDie {
            stamina=0.5;
        };
        class Plane_Fighter_03_Pilot: Crew {
            stamina=0.5;
        };
        class KIA_pilot_plane_cas_01: DefaultDie {
            stamina=0.5;
        };
        class pilot_plane_cas_01: Crew {
            stamina=0.5;
        };
        class pilot_plane_cas_01_getin: PreciseCrew {
            stamina=0.5;
        };
        class pilot_plane_cas_01_getout: pilot_plane_cas_01_getin {
            stamina=0.5;
        };
        class KIA_pilot_plane_cas_02: DefaultDie {
            stamina=0.5;
        };
        class pilot_plane_cas_02: Crew {
            stamina=0.5;
        };
        class pilot_plane_cas_02_getin: PreciseCrew {
            stamina=0.5;
        };
        class pilot_plane_cas_02_getout: pilot_plane_cas_02_getin {
            stamina=0.5;
        };
        class DefaultDieA3: DefaultDie {
            stamina=0.5;
        };
        class DefaultDriver: Crew {
            stamina=0.5;
        };
        class DefaultPassenger: Crew {
            stamina=0.5;
        };
        class DefaultSettleIn: Crew {
            stamina=0.5;
        };
        class KIA_driver_scooter_01: DefaultDieA3 {
            stamina=0.5;
        };
        class driver_scooter_01_settlein: DefaultSettleIn {
            stamina=0.5;
        };
        class driver_scooter_01: DefaultDriver {
            stamina=0.5;
        };
        class KIA_passenger_scooter_01: DefaultDieA3 {
            stamina=0.5;
        };
        class passenger_scooter_01_settlein: DefaultSettleIn {
            stamina=0.5;
        };
        class passenger_scooter_01: DefaultPassenger {
            stamina=0.5;
        };
        class KIA_passenger_scooter_02: DefaultDieA3 {
            stamina=0.5;
        };
        class passenger_scooter_02_settlein: DefaultSettleIn {
            stamina=0.5;
        };
        class passenger_scooter_02: DefaultPassenger {
            stamina=0.5;
        };
        class cargo_marksman: AmovPercMstpSrasWrflDnon {
            stamina=0.3;
        };
        class cargo_base: cargo_marksman {
            stamina=0.3;
        };
        class cargo_base_idle: cargo_base {
            stamina=0.3;
        };
        class cargo_basepistol: AmovPercMstpSrasWpstDnon {
            stamina=0.4;
        };
        class cargo_base_idle_pistol: cargo_basepistol {
            stamina=0.4;
        };
        class cargo_basebinoc: AmovPercMstpSoptWbinDnon {
            stamina=0.4;
        };
        class passenger_bench_1_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_bench_1_Aim_Idling: passenger_bench_1_Aim {
            stamina=0.3;
        };
        class passenger_bench_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_bench_1_Idle_Idling: passenger_bench_1_Idle {
            stamina=0.3;
        };
        class passenger_bench_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_Pistol_Idling: passenger_bench_1_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_bench_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_bench_1_Idle_Pistol_Idling: passenger_bench_1_Idle {
            stamina=0.3;
        };
        class passenger_bench_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_bench_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_bench_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_bench_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_bench_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_bench_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_bench_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_bench_1_Idle_Unarmed_Idling: passenger_bench_1_Idle {
            stamina=0.3;
        };
        class passenger_bench_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_bench_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_bench_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_bench_1_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_bench_1_Die_Pistol: passenger_bench_1_Die {
            stamina=0.5;
        };
        class passenger_inside_1_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_inside_1_Aim_Idling: passenger_inside_1_Aim {
            stamina=0.3;
        };
        class passenger_inside_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_1_Idle_Idling: passenger_inside_1_Idle {
            stamina=0.3;
        };
        class passenger_inside_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_Pistol_Idling: passenger_inside_1_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_inside_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_inside_1_Idle_Pistol_Idling: passenger_inside_1_Idle {
            stamina=0.3;
        };
        class passenger_inside_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_inside_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_inside_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_inside_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_1_Idle_Unarmed_Idling: passenger_inside_1_Idle {
            stamina=0.3;
        };
        class passenger_inside_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_1_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_inside_1_Die_Pistol: passenger_inside_1_Die {
            stamina=0.5;
        };
        class passenger_inside_2_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_inside_2_Aim_Idling: passenger_inside_2_Aim {
            stamina=0.3;
        };
        class passenger_inside_2_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_2_Idle_Idling: passenger_inside_2_Idle {
            stamina=0.3;
        };
        class passenger_inside_2_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_Pistol_Idling: passenger_inside_2_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_inside_2_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_inside_2_Idle_Pistol_Idling: passenger_inside_2_Idle {
            stamina=0.3;
        };
        class passenger_inside_2_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_inside_2_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_2_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_inside_2_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_2_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_inside_2_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_2_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_2_Idle_Unarmed_Idling: passenger_inside_2_Idle {
            stamina=0.3;
        };
        class passenger_inside_2_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_2_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_2_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_2_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_inside_2_Die_Pistol: passenger_inside_2_Die {
            stamina=0.5;
        };
        class passenger_inside_3_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_inside_3_Aim_Idling: passenger_inside_3_Aim {
            stamina=0.3;
        };
        class passenger_inside_3_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_3_Idle_Idling: passenger_inside_3_Idle {
            stamina=0.3;
        };
        class passenger_inside_3_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_Pistol_Idling: passenger_inside_3_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_inside_3_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_inside_3_Idle_Pistol_Idling: passenger_inside_3_Idle {
            stamina=0.3;
        };
        class passenger_inside_3_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_inside_3_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_3_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_inside_3_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_3_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_inside_3_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_3_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_3_Idle_Unarmed_Idling: passenger_inside_3_Idle {
            stamina=0.3;
        };
        class passenger_inside_3_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_3_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_3_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_3_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_inside_3_Die_Pistol: passenger_inside_3_Die {
            stamina=0.5;
        };
        class passenger_inside_4_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_inside_4_Aim_Idling: passenger_inside_4_Aim {
            stamina=0.3;
        };
        class passenger_inside_4_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_4_Idle_Idling: passenger_inside_4_Idle {
            stamina=0.3;
        };
        class passenger_inside_4_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_Pistol_Idling: passenger_inside_4_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_inside_4_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_inside_4_Idle_Pistol_Idling: passenger_inside_4_Idle {
            stamina=0.3;
        };
        class passenger_inside_4_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_inside_4_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_4_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_inside_4_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_inside_4_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_inside_4_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_4_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_inside_4_Idle_Unarmed_Idling: passenger_inside_4_Idle {
            stamina=0.3;
        };
        class passenger_inside_4_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_inside_4_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_inside_4_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_inside_4_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_inside_4_Die_Pistol: passenger_inside_4_Die {
            stamina=0.5;
        };
        class passenger_boat_1_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_boat_1_Aim_Idling: passenger_boat_1_Aim {
            stamina=0.3;
        };
        class passenger_boat_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_1_Idle_Idling: passenger_boat_1_Idle {
            stamina=0.3;
        };
        class passenger_boat_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_Pistol_Idling: passenger_boat_1_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_boat_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_boat_1_Idle_Pistol_Idling: passenger_boat_1_Idle {
            stamina=0.3;
        };
        class passenger_boat_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_boat_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_boat_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_boat_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_1_Idle_Unarmed_Idling: passenger_boat_1_Idle {
            stamina=0.3;
        };
        class passenger_boat_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_1_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_1_Die_Pistol: passenger_boat_1_Die {
            stamina=0.5;
        };
        class passenger_boat_2_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_boat_2_Aim_Idling: passenger_boat_2_Aim {
            stamina=0.3;
        };
        class passenger_boat_2_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_2_Idle_Idling: passenger_boat_2_Idle {
            stamina=0.3;
        };
        class passenger_boat_2_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_Pistol_Idling: passenger_boat_2_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_boat_2_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_boat_2_Idle_Pistol_Idling: passenger_boat_2_Idle {
            stamina=0.3;
        };
        class passenger_boat_2_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_boat_2_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_2_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_boat_2_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_2_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_boat_2_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_2_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_2_Idle_Unarmed_Idling: passenger_boat_2_Idle {
            stamina=0.3;
        };
        class passenger_boat_2_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_2_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_2_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_2_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_2_Die_Pistol: passenger_boat_2_Die {
            stamina=0.5;
        };
        class passenger_boat_3_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_boat_3_Aim_Idling: passenger_boat_3_Aim {
            stamina=0.3;
        };
        class passenger_boat_3_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_3_Idle_Idling: passenger_boat_3_Idle {
            stamina=0.3;
        };
        class passenger_boat_3_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_Pistol_Idling: passenger_boat_3_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_boat_3_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_boat_3_Idle_Pistol_Idling: passenger_boat_3_Idle {
            stamina=0.3;
        };
        class passenger_boat_3_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_boat_3_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_3_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_boat_3_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_3_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_boat_3_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_3_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_3_Idle_Unarmed_Idling: passenger_boat_3_Idle {
            stamina=0.3;
        };
        class passenger_boat_3_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_3_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_3_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_3_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_3_Die_Pistol: passenger_boat_3_Die {
            stamina=0.5;
        };
        class passenger_boat_4_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_boat_4_Aim_Idling: passenger_boat_4_Aim {
            stamina=0.3;
        };
        class passenger_boat_4_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_4_Idle_Idling: passenger_boat_4_Idle {
            stamina=0.3;
        };
        class passenger_boat_4_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_Pistol_Idling: passenger_boat_4_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_boat_4_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_boat_4_Idle_Pistol_Idling: passenger_boat_4_Idle {
            stamina=0.3;
        };
        class passenger_boat_4_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_boat_4_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_4_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_boat_4_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_boat_4_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_boat_4_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_4_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_boat_4_Idle_Unarmed_Idling: passenger_boat_4_Idle {
            stamina=0.3;
        };
        class passenger_boat_4_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_boat_4_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_boat_4_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_boat_4_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_boat_4_Die_Pistol: passenger_boat_4_Die {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_flatground_1_Aim_Idling: passenger_flatground_1_Aim {
            stamina=0.3;
        };
        class passenger_flatground_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_1_Idle_Idling: passenger_flatground_1_Idle {
            stamina=0.3;
        };
        class passenger_flatground_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_Pistol_Idling: passenger_flatground_1_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_flatground_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_flatground_1_Idle_Pistol_Idling: passenger_flatground_1_Idle {
            stamina=0.3;
        };
        class passenger_flatground_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_flatground_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_flatground_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_flatground_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_1_Idle_Unarmed_Idling: passenger_flatground_1_Idle {
            stamina=0.3;
        };
        class passenger_flatground_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_1_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_flatground_1_Die_Pistol: passenger_flatground_1_Die {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_flatground_2_Aim_Idling: passenger_flatground_2_Aim {
            stamina=0.3;
        };
        class passenger_flatground_2_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_2_Idle_Idling: passenger_flatground_2_Idle {
            stamina=0.3;
        };
        class passenger_flatground_2_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_Pistol_Idling: passenger_flatground_2_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_flatground_2_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_flatground_2_Idle_Pistol_Idling: passenger_flatground_2_Idle {
            stamina=0.3;
        };
        class passenger_flatground_2_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_flatground_2_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_2_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_flatground_2_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_2_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_flatground_2_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_2_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_2_Idle_Unarmed_Idling: passenger_flatground_2_Idle {
            stamina=0.3;
        };
        class passenger_flatground_2_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_2_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_2_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_2_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_flatground_2_Die_Pistol: passenger_flatground_2_Die {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_flatground_3_Aim_Idling: passenger_flatground_3_Aim {
            stamina=0.3;
        };
        class passenger_flatground_3_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_3_Idle_Idling: passenger_flatground_3_Idle {
            stamina=0.3;
        };
        class passenger_flatground_3_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_Pistol_Idling: passenger_flatground_3_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_flatground_3_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_flatground_3_Idle_Pistol_Idling: passenger_flatground_3_Idle {
            stamina=0.3;
        };
        class passenger_flatground_3_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_flatground_3_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_3_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_flatground_3_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_3_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_flatground_3_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_3_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_3_Idle_Unarmed_Idling: passenger_flatground_3_Idle {
            stamina=0.3;
        };
        class passenger_flatground_3_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_3_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_3_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_3_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_flatground_3_Die_Pistol: passenger_flatground_3_Die {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim: cargo_base {
            stamina=0.3;
        };
        class passenger_flatground_4_Aim_Idling: passenger_flatground_4_Aim {
            stamina=0.3;
        };
        class passenger_flatground_4_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_4_Idle_Idling: passenger_flatground_4_Idle {
            stamina=0.3;
        };
        class passenger_flatground_4_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_Pistol_Idling: passenger_flatground_4_Aim_Pistol {
            stamina=0.4;
        };
        class passenger_flatground_4_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class passenger_flatground_4_Idle_Pistol_Idling: passenger_flatground_4_Idle {
            stamina=0.3;
        };
        class passenger_flatground_4_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class passenger_flatground_4_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_4_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class passenger_flatground_4_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class passenger_flatground_4_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class passenger_flatground_4_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_4_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class passenger_flatground_4_Idle_Unarmed_Idling: passenger_flatground_4_Idle {
            stamina=0.3;
        };
        class passenger_flatground_4_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_4_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class passenger_flatground_4_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class passenger_flatground_4_Die: DefaultDie {
            stamina=0.5;
        };
        class passenger_flatground_4_Die_Pistol: passenger_flatground_4_Die {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim: cargo_base {
            stamina=0.3;
        };
        class vehicle_turnout_1_Aim_Idling: vehicle_turnout_1_Aim {
            stamina=0.3;
        };
        class vehicle_turnout_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_turnout_1_Idle_Idling: vehicle_turnout_1_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_Pistol_Idling: vehicle_turnout_1_Aim_Pistol {
            stamina=0.4;
        };
        class vehicle_turnout_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class vehicle_turnout_1_Idle_Pistol_Idling: vehicle_turnout_1_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class vehicle_turnout_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class vehicle_turnout_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class vehicle_turnout_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class vehicle_turnout_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class vehicle_turnout_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_turnout_1_Idle_Unarmed_Idling: vehicle_turnout_1_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_turnout_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_1_Die: DefaultDie {
            stamina=0.5;
        };
        class vehicle_turnout_1_Die_Pistol: vehicle_turnout_1_Die {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim: cargo_base {
            stamina=0.3;
        };
        class vehicle_turnout_2_Aim_Idling: vehicle_turnout_2_Aim {
            stamina=0.3;
        };
        class vehicle_turnout_2_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_turnout_2_Idle_Idling: vehicle_turnout_2_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_2_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_Pistol_Idling: vehicle_turnout_2_Aim_Pistol {
            stamina=0.4;
        };
        class vehicle_turnout_2_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class vehicle_turnout_2_Idle_Pistol_Idling: vehicle_turnout_2_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_2_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class vehicle_turnout_2_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class vehicle_turnout_2_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class vehicle_turnout_2_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class vehicle_turnout_2_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class vehicle_turnout_2_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_2_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_turnout_2_Idle_Unarmed_Idling: vehicle_turnout_2_Idle {
            stamina=0.3;
        };
        class vehicle_turnout_2_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_2_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_turnout_2_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_turnout_2_Die: DefaultDie {
            stamina=0.5;
        };
        class vehicle_turnout_2_Die_Pistol: vehicle_turnout_2_Die {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim: cargo_base {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Aim_Idling: vehicle_coshooter_1_Aim {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Idle_Idling: vehicle_coshooter_1_Idle {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_Pistol_Idling: vehicle_coshooter_1_Aim_Pistol {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Idle_Pistol_Idling: vehicle_coshooter_1_Idle {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class vehicle_coshooter_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class vehicle_coshooter_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class vehicle_coshooter_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class vehicle_coshooter_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Idle_Unarmed_Idling: vehicle_coshooter_1_Idle {
            stamina=0.3;
        };
        class vehicle_coshooter_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_coshooter_1_Die: DefaultDie {
            stamina=0.5;
        };
        class vehicle_coshooter_1_Die_Pistol: vehicle_coshooter_1_Die {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim: cargo_base {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_Idling: vehicle_passenger_stand_1_Aim {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Idle: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Idle_Idling: vehicle_passenger_stand_1_Idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_Pistol: cargo_basepistol {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_Idling: vehicle_passenger_stand_1_Aim_Pistol {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Idle_Pistol: cargo_base_idle_pistol {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Idle_Pistol_Idling: vehicle_passenger_stand_1_Idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_ToPistol: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon {
            stamina=-1.5;
        };
        class vehicle_passenger_stand_1_Aim_ToPistol_End: AmovPpneMstpSrasWrflDnon_AmovPpneMstpSrasWpstDnon_end {
            stamina=-1.5;
        };
        class vehicle_passenger_stand_1_Aim_FromPistol: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon {
            stamina=-1.5;
        };
        class vehicle_passenger_stand_1_Aim_FromPistol_End: AmovPpneMstpSrasWpstDnon_AmovPpneMstpSrasWrflDnon_end {
            stamina=-1.5;
        };
        class vehicle_passenger_stand_1_Aim_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_ToBinoc: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_ToBinoc_End: AmovPercMstpSrasWrflDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Idle_Unarmed: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Idle_Unarmed_Idling: vehicle_passenger_stand_1_Idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_Binoc: cargo_basebinoc {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_ToBinoc: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_ToBinoc_End: AmovPercMstpSrasWpstDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Die: DefaultDie {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Die_Pistol: vehicle_passenger_stand_1_Die {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Launcher: cargo_base {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_Idling: vehicle_passenger_stand_1_Aim_Launcher {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Idle_Launcher: cargo_base_idle {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Idle_Launcher_Idling: vehicle_passenger_stand_1_Idle_Launcher {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_FromLauncher: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_FromLauncher_End: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWrflDnon_end {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_ToLauncher: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_ToLauncher_End: AmovPercMstpSrasWrflDnon_AmovPercMstpSrasWlnrDnon_end {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_FromLauncher: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_FromLauncher_End: AmovPercMstpSrasWlnrDnon_AmovPercMstpSrasWpstDnon_end {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_ToLauncher: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Pistol_ToLauncher_End: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon_end {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_ToLauncher: AmovPercMstpSnonWnonDnon_AmovPercMstpSrasWlnrDnon {
            stamina=0.2;
        };
        class vehicle_passenger_stand_1_Aim_Unarmed_FromLauncher: AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon {
            stamina=-0.5;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_ToBinoc: AmovPercMstpSrasWlnrDnon_AwopPercMstpSoptWbinDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_ToBinoc_End: AmovPercMstpSrasWlnrDnon_AwopPercMstpSoptWbinDnon_end {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_Binoc: vehicle_passenger_stand_1_Aim_Unarmed_Binoc {
            stamina=0.4;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_FromBinoc: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWlnrDnon {
            stamina=0.5;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_FromBinoc_End: AwopPercMstpSoptWbinDnon_AmovPercMstpSrasWlnrDnon_end {
            stamina=0.2;
        };
        class vehicle_passenger_stand_1_Aim_Launcher_Reload: ReloadRPG {
            stamina=-0.6;
        };
        class passenger_flatground_4_Aim_vehicle_passenger_stand_1_Aim: vehicle_passenger_stand_1_Aim {
            stamina=0.3;
        };
        class vehicle_passenger_stand_1_Aim_passenger_flatground_4_Aim: passenger_flatground_4_Aim {
            stamina=0.3;
        };
        class KIA_pilot_Heli_Transport_03: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Transport_03_idle: Crew {
            stamina=0.5;
        };
        class pilot_Heli_Transport_03: Crew {
            stamina=0.5;
        };
        class KIA_pilot_Heli_Transport_04: DefaultDie {
            stamina=0.5;
        };
        class pilot_Heli_Transport_04_idle: Crew {
            stamina=0.5;
        };
        class pilot_Heli_Transport_04: Crew {
            stamina=0.5;
        };
    };
};
