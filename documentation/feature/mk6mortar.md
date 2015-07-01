---
layout: wiki
title: Mk6 Mortar
description: Improve the existing mk6 mortar.
group: feature
parent: wiki
---

## 1. Overview

### 1.1 mk6 mortar overhaul
ACE3 adds wind deflection for shells as well as a rangetable to accurately take out your target without the artillery computer.

## 2. Usage

### 2.1 Switching charge
- Press <kbd>F</kbd> (Arma 3 default key bind `Fire Mode Switch`) to switch between charges

### 2.2 Working with the rangetable
- To open the table: 
    - Self interact <kbd>CTRL</kbd> + <kbd>⊞ Win</kbd>
    - Select `equipment`.
    - Select `Open 82mm Rangetable`.

- Using the table:
    - Get the distance and elevation difference between you and the target for this you can use map tools. For this example we'll say we're 2 000m away and 50m below (we're at 20m they are at 70m, 70-20=50).
   
 - Select the charge you want to use (0 = close / 1 = medium  / 2 = far). For this case we're using charge 2.
   
 - Check the range column on the table, we're at 2 000 then look at the corresponding entry in the column on the right (ELEV = elevation) For this example it's 1339.
    
 - After that's done move by one column on the right that's the elevation for 100m heigh so in our case we're subtracting 2 (4:2 = 2) if our target was 300m above us we would have to subtract 12 from our elevation (3x4 = 12).
    
 - Once you finished your maths, it's time to aim, get the cross of the mortar on target, if you don't see it use a waypoint if possible. In our case ELEV is 1339-2 = 1337.
    
 - On the right side of the screen, while looking through the mk6 scope you should see ELV, we need to match this number with the one we found.
    - To adjust the ELV use <kbd>pageUP</kbd> and  <kbd>pageDOWN</kbd>.
    - Once the number you found and ELV are the same FIRE !
    - On top of that you can calculate the time the shell will take to land by using the third row from the left, in our case the shell need to travel 2000m that's 20xthe number indicated. so 20x0,5 = 10s.

### 2.3 Working with the rangetable (Crosswinds enabled)
- Same as above there's just an extra step, I'll provide an other example in case you forgot.
    
 - Get the distance and elevation difference between you and the target for this you can use map tools. For this example we'll say we're 2 400m away and 223m below (we're at 2m they are at 225, 225-2=223)
 - Select the charge you want to use (0 = close / 1 = medium  / 2 = far). For this case we're using charge 2.
    
 - Check the range column on the table, we're 2 400m a then look at the corresponding entry in the column on the right (ELEV = elevation) For this example it's 1145.
 - After that's done move by one column on the right that's the elevation for 100m heigh so in our case we're subtracting 22 (2,2 x 10 (2,2 because we're around 220m below)).
    - Extra step needed here, a kestrel 4500 IS NEEDED.
     - Pick the crosswind on your kestrel (for this refer to the kestrel documentation).
    
     - For this example the crosswind is of 2 MPS on my table I can see under Azimuth correction that for each 1MPS I need to correct by 2.5 mill.
     - So in this case i'm subtracting 5 mill from the ELV.
    
     - It's MATH TIME the ELV given by the table is 1 145, we subtract 22 because of the heigh, we also subtract 5 for the crosswind ( 1 145-22-5 = 1 118 ).
 - After you finished your maths, it's time to aim, get the cross of the mortar on target, if you don't see it use a waypoint if possible. In our case ELEV is 1 118.
    
 - On the right side of the screen, while looking through the mk6 scope you should see ELV, we need to match this number with the one we found.

 - FIREEEE !!!!
 - Little advantage of having crosswind enabled is that you don't have to calculate the flight time, it's marked on the table in this case it's 33,8s.

## 3. Dependencies

`ace_interaction`