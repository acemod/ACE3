class CfgMovesBasic {
    class Actions {
        class NoActions;
        class PistolStandActions: NoActions {
            grabDrag = "ace_dragging";
        };
        class MoveWithInjuredManDragger;
        class MoveWithInjuredManDraggerRfl: MoveWithInjuredManDragger {
            Up = "amovpercmstpsraswrfldnon";
        };
        class MoveWithInjuredManDraggerPst;
        class ace_MoveWithInjuredManDraggerPst: MoveWithInjuredManDraggerPst {
            PrimaryWeapon = "";
            Stop = "ace_dragging_static";
            StopRelaxed = "ace_dragging_static";
            WalkLB = "ace_dragging";
            WalkRB = "ace_dragging";
            WalkB = "ace_dragging";
            PlayerWalkLB = "ace_dragging";
            PlayerWalkRB = "ace_dragging";
            PlayerWalkB = "ace_dragging";
            SlowLB = "ace_dragging";
            SlowRB = "ace_dragging";
            SlowB = "ace_dragging";
            PlayerSlowLB = "ace_dragging";
            PlayerSlowRB = "ace_dragging";
            PlayerSlowB = "ace_dragging";
            FastLB = "ace_dragging";
            FastRB = "ace_dragging";
            FastB = "ace_dragging";
            Up = "ace_dragging_static";
            grabCarry = "Helper_SwitchToCarrynon_pst";
            grabDrag = "ace_dragging_static";
            Default = "ace_dragging_static";
            HandGunOn = "ace_dragging_static";
            TactF="AmovPknlMtacSrasWpstDf";
			TactLF="AmovPknlMtacSrasWpstDfl";
			TactRF="AmovPknlMtacSrasWpstDfr";
			TactL="AmovPknlMtacSrasWpstDl";
			TactR="AmovPknlMtacSrasWpstDr";
			TactLB="AmovPknlMtacSrasWpstDbl";
			TactRB="AmovPknlMtacSrasWpstDbr";
			TactB="AmovPknlMtacSrasWpstDb";
            PlayerTactF="AmovPknlMtacSrasWpstDf";
			PlayerTactLF="AmovPknlMtacSrasWpstDfl";
			PlayerTactRF="AmovPknlMtacSrasWpstDfr";
			PlayerTactL="AmovPknlMtacSrasWpstDl";
			PlayerTactR="AmovPknlMtacSrasWpstDr";
			PlayerTactLB="AmovPknlMtacSrasWpstDbl";
			PlayerTactRB="AmovPknlMtacSrasWpstDbr";
			PlayerTactB="AmovPknlMtacSrasWpstDb";
            released="ace_dragging_drop";
        };
    };
};
