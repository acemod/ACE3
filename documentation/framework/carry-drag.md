---
layout: wiki
title: Carry and Drag System
description:
group: framework
order: 5
parent: wiki
---

## 1. Config Values

```
class CfgVehicles {
    class MyVehicle {
        

        ace_dragging_canDrag = 1; // can this object be dragged?; 1 yes, 0 no (0 default)
        ace_dragging_dragPosition[] = {0,1.2,0} // Offset of the model from the body while dragging, comparable to the offset in attachTo (It's the same actually)
        ace_dragging_dragDirection = 0;  // how much degrees is the model rotatated after dragging it (a global setDir after attachTo)

        ace_dragging_canCarry = 1; // can this object be carried?; 1 yes, 0 no (0 default)
        ace_dragging_carryPosition[] = {0,1.2,0}; // Same as drag, but for carrying objects
        ace_dragging_carryDirection = 0; // Same as drag, but for carrying objects

    };
};
```

## 2. Functions

**NOTE THAT THE FOLLOWING FUNCTIONS ARE NOT PUBLIC AND THUS MAY CHANGE IN THE FUTURE.**</br>


Also note that if the item is too heavy you won't be able to carry / drag it, the mass is also affected by what's inside it.</br>
To bypass this empty the object and / or use setMass.</br> 

### 2.1 Enabling / disabling dragging

`ace_dragging_fnc_setDraggable.` </br>
Enable the object to be dragged. </br>

|   Arguments |          |
--------------| -------- | 
0 |  Any object (Object)
1: | true to enable dragging, false to disable (Bool)
2:|  Position offset for attachTo command (Array, optional; default: [0,0,0])
3: | Direction in degree to rotate the object after attachTo (Number, optional; default: 0)
Return value: NONE </br>

#### 2.1.1 example 1:
```
[foo,true,[0,2,0],45] call ace_dragging_fnc_setDraggable
```
|   Arguments |          |
--------------| -------- | 
0:|  foo (my object)
1:|  true (dragging is enabled)
2:| `[0,2,0]`  (0 meters sideways, 2 meters forward, 0 meters upwards)
3:|  45 (the object is rotated by 45°)

#### 2.1.2 example 2
```
[bar,false,[3,-2,2],20] call ace_dragging_fnc_setDraggable
```

|   Arguments |          |
--------------| -------- | 
0:|  bar (object)
1:|  false (dragging is disabled)
2:|  3 meters sideways, -2 meters backwards, 2 meters upwards
3:|  the object is rotated by 20°

### 2.2 Enabling / disabling carrying
`ace_dragging_fnc_setCarryable.` </br>
Enable the object to be carried. </br>

|   Arguments |          |
--------------| -------- | 
0 |  Any object (Object)
1:| true to enable carrying, false to disable (Bool)
2:| Position offset for attachTo command (Array, optional; default: [0,1,1])
3:| Direction in degree to rotate the object after attachTo (Number, optional; default: 0)
Return value: NONE </br>


#### 2.1.1 example 1:
```
[foo,true,[0,3,1],10] call ace_dragging_fnc_setCarryable
```
|   Arguments |          |
--------------| -------- | 
0:|  foo (my object)
1:|  true (carrying is enabled)
2:| `[0,2,0]` (0 meters sideways, 3 meters forward, 1 meters upwards)
3:| 10 (the object is rotated by 10°)

