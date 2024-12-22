
// dragging carrying items
class ReammoBox_F;
class vn_ammobox_base: ReammoBox_F {
    EGVAR(cargo,size) = 1;
    EGVAR(cargo,canLoad) = 1;

    EGVAR(dragging,canCarry) = 1;
    EGVAR(dragging,carryPosition)[] = {0,1,1};
    EGVAR(dragging,carryDirection) = 0;

    EGVAR(dragging,canDrag) = 1;
    EGVAR(dragging,dragPosition)[] = {0,1.2,0};
    EGVAR(dragging,dragDirection) = 0;
};
