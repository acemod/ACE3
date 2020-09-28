class CfgMovesMaleSdr: CfgMovesBasic {
    class InjuredMovedBase;
    class AgonyBaseRfl;
    class DraggerBase;

    class States {
        class AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon: InjuredMovedBase {
            speed = -10; // 1/10
        };
        class AinjPfalMstpSnonWrflDnon_carried_Up: AgonyBaseRfl {
            speed = -10; // 1/10
        };
        class ace_dragging: DraggerBase {
            actions = "ace_MoveWithInjuredManDraggerPst";
            file = QPATHTO_T(anim\ace_dragging.rtm);
            showHandGun = 1;
            looped = 1;
            duty = 0.6;
            interpolationSpeed = 4;
            disableWeapons = 0;
            canPullTrigger = 1;
            limitGunMovement = 0.15;
            canReload = 0;
            aimingBody = "aimingUpDefault";
            aiming = "aimingDefault";
            aimPrecision = 5;
            turnSpeed = 0.1;
            ConnectTo[]=
            {
                "ace_dragging_static",
                0.1
            };
            InterpolateTo[]=
            {
                "ace_dragging_static",
                0.1,
                "AcinPknlMwlkSnonWpstDb_death",
                0.2,
                "AcinPknlMwlkSnonWpstDb_agony",
                0.2
            };
        };
        class ace_dragging_static: ace_dragging {
            looped = 1;
            speed = 0;
			ConnectTo[]=
			{
				"ace_dragging_static",
				0.1
			};
            InterpolateTo[]=
			{
				/*"AcinPknlMwlkSnonWpstDb_AmovPercMstpSrasWpstDnon",
				0.15000001,
				"AcinPknlMstpSnonWpstDnon_AmovPknlMstpSrasWpstDnon",
				0.1,*/
				"ace_dragging",
				0.1,
				"AcinPknlMwlkSnonWpstDb_death",
				0.2,
				"AcinPknlMwlkSnonWpstDb_agony",
				0.2,
				"Helper_SwitchToCarrynon_pst",
				0.1
			};
        };
    };
};
