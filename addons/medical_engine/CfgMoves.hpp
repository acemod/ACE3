class CfgMovesBasic {
    class Actions {
        class CivilProneActions;
        class ACE_Dazed: CivilProneActions {
            stop = QGVAR(dazed_AmovPpneMstpSnonWnonDnon);
            StopRelaxed = QGVAR(dazed_AmovPpneMstpSnonWnonDnon);
            default = QGVAR(dazed_AmovPpneMstpSnonWnonDnon);

            WalkF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            LimpF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            PlayerWalkF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            SlowF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            PlayerSlowF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            TactF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);
            PlayerTactF = QGVAR(dazed_AmovPpneMrunSnonWnonDf);

            turnL = QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnL);
            turnLRelaxed = QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnL);

            turnR = QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnR);
            turnRRelaxed = QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnR);
            PutDown = "";
            getOver = "";
            throwPrepare = "";
            throwGrenade = "";
            LimpLF = "";
            LimpRF = "";
            LimpL = "";
            LimpR = "";
            LimpB = "";
            LimpLB = "";
            LimpRB = "";
            reloadMagazine = "";
            reloadMGun = "";
            reloadMortar = "";
            WalkLF = "";
            WalkRF = "";
            WalkL = "";
            WalkR = "";
            WalkLB = "";
            WalkRB = "";
            WalkB = "";
            PlayerWalkLF = "";
            PlayerWalkRF = "";
            PlayerWalkL = "";
            PlayerWalkR = "";
            PlayerWalkLB = "";
            PlayerWalkRB = "";
            PlayerWalkB = "";
            SlowLF = "";
            SlowRF = "";
            SlowL = "";
            SlowR = "";
            SlowLB = "";
            SlowRB = "";
            SlowB = "";
            PlayerSlowLF = "";
            PlayerSlowRF = "";
            PlayerSlowL = "";
            PlayerSlowR = "";
            PlayerSlowLB = "";
            PlayerSlowRB = "";
            PlayerSlowB = "";
            FastF = "";
            FastLF = "";
            FastRF = "";
            FastL = "";
            FastR = "";
            FastLB = "";
            FastRB = "";
            FastB = "";
            TactLF = "";
            TactRF = "";
            TactL = "";
            TactR = "";
            TactLB = "";
            TactRB = "";
            TactB = "";
            PlayerTactLF = "";
            PlayerTactRF = "";
            PlayerTactL = "";
            PlayerTactR = "";
            PlayerTactLB = "";
            PlayerTactRB = "";
            PlayerTactB = "";
            EvasiveLeft = "";
            EvasiveRight = "";
            down = "";
            weaponOn = "";
            weaponOff = "";
            binocOff = "";
            handGunOn = "";
            takeFlag = "";
            treated = "";
            Lying = "";
            Crouch = "";
            CanNotMove = "";
            FireNotPossible = "";
            strokeGun = "";
            PlayerStand = "";
            Relax = "";
            PrimaryWeapon = "";
            SecondaryWeapon = "";
            Binoculars = "";
            Up = "";
            PlayerCrouch = "";
            PlayerProne = "";
            Combat = "";
            Stand = "";
            Civil = "";
            CivilLying = "";
            GetInLow = "";
            GetInMedium = "";
            GetInHigh = "";
            GetInSDV = "";
            Surrender = "";
            saluteOff = "";
            grabDrag = "";
            dooraction = "";
            agonyStop = "";
            gear = "";
        };
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        // fixes hand being stuck at rifle which is on the back
        class AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon;
        class AinvPknlMstpSlayWnonDnon_medicOther: AmovPknlMstpSrasWrflDnon_AinvPknlMstpSlayWrflDnon {
            weaponIK = 0;
        };

        class DeadState;
        class UNCON_ANIM(1): DeadState {
            // Prevents AI from moving torso and head when unconscious
            aiming = "aimingNo";
            aimingBody = "aimingUpNo";
            head = "headNo";

            file = QPATHTO_T(data\ace_unconscious_1.rtm);
        };

        class UNCON_ANIM(2): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_2.rtm);
        };

        class UNCON_ANIM(3): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_3.rtm);
        };

        class UNCON_ANIM(4): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_4.rtm);
        };

        class UNCON_ANIM(5): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_5.rtm);
        };

        class UNCON_ANIM(6): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_6.rtm);
        };

        class UNCON_ANIM(7): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_7.rtm);
        };

        class UNCON_ANIM(8): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_8.rtm);
        };

        class UNCON_ANIM(1_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_1_1.rtm);
        };

        class UNCON_ANIM(2_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_2_1.rtm);
        };

        class UNCON_ANIM(3_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_3_1.rtm);
        };

        class UNCON_ANIM(4_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_4_1.rtm);
        };

        class UNCON_ANIM(5_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_5_1.rtm);
        };

        class UNCON_ANIM(6_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_6_1.rtm);
        };

        class UNCON_ANIM(7_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_7_1.rtm);
        };

        class UNCON_ANIM(8_1): UNCON_ANIM(1) {
            file = QPATHTO_T(data\ace_unconscious_8_1.rtm);
        };

        /* added for the "ace_unc" part */
        class KIA_passenger_boat_holdleft;
        class UNCON_ANIM(9): KIA_passenger_boat_holdleft {};

        class KIA_driver_boat01;
        class UNCON_ANIM(10): KIA_driver_boat01 {};

        class Unconscious;
        class UNCON_ANIM(faceDown): Unconscious {};

        class UNCON_ANIM(faceLeft): Unconscious {};

        class UNCON_ANIM(faceRight): Unconscious {};

        class UNCON_ANIM(faceUp): Unconscious {};

        class AmovPercMstpSnonWnonDnon;
        class AmovPpneMstpSnonWnonDnon: AmovPercMstpSnonWnonDnon {
            ConnectTo[] += {QGVAR(dazed_AmovPpneMstpSnonWnonDnon),0.1};
        };
        class ACE_UnconsciousOutProne: AmovPpneMstpSnonWnonDnon {
            //file = "\A3\anims_f\Data\Anim\Sdr\dth\pne\stp\ras\Rfl\AdthPpneMstpSrasWrflDnon_1";
            looped = 0;
            canBlendStep = 0;
            blockMobileSwitching = 1;
            forceAim = 1;
            interpolationRestart = 1;
            variantsPlayer[] = {};
            variantsAI[] = {};
            useIdles = 0;
            InterpolateTo[] = {"Unconscious",0.2};
            ConnectTo[] = {"AmovPpneMstpSnonWnonDnon",0.2};
            speed = 100;
        };

        class GVAR(dazed_AmovPpneMstpSnonWnonDnon): AmovPpneMstpSnonWnonDnon {
            actions = "ACE_Dazed";
            speed = 0.5;
            ConnectTo[] = {QGVAR(dazed_AmovPpneMstpSnonWnonDnon),0.1};
            InterpolateTo[] = {
                QGVAR(dazed_AmovPpneMrunSnonWnonDf),0.02,
                QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnL),0.02,
                QGVAR(dazed_AmovPpneMstpSnonWnonDnon_turnR),0.02,
                "Unconscious",0.02
            };
            variantsPlayer[] = {};
            disableWeapons = 1;
        };
        class AmovPpneMrunSnonWnonDf;
        class GVAR(dazed_AmovPpneMrunSnonWnonDf): AmovPpneMrunSnonWnonDf {
            actions = "ACE_Dazed";
            speed = 0.5;
            InterpolateTo[] = {QGVAR(dazed_AmovPpneMstpSnonWnonDnon),0.02, "Unconscious",0.02};
            variantsPlayer[] = {};
            disableWeapons = 1;
        };
        class AmovPpneMstpSnonWnonDnon_turnL;
        class GVAR(dazed_AmovPpneMstpSnonWnonDnon_turnL): AmovPpneMstpSnonWnonDnon_turnL {
            actions = "ACE_Dazed";
            speed = 0.5;
            InterpolateTo[] = {QGVAR(dazed_AmovPpneMstpSnonWnonDnon),0.02, "Unconscious",0.02};
            variantsPlayer[] = {};
            disableWeapons = 1;
        };
        class AmovPpneMstpSnonWnonDnon_turnR;
        class GVAR(dazed_AmovPpneMstpSnonWnonDnon_turnR): AmovPpneMstpSnonWnonDnon_turnR {
            actions = "ACE_Dazed";
            speed = 0.5;
            InterpolateTo[] = {QGVAR(dazed_AmovPpneMstpSnonWnonDnon),0.02, "Unconscious",0.02};
            variantsPlayer[] = {};
            disableWeapons = 1;
        };
    };
};
