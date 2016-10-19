/*
Name: teleport
Author: IndeedPete
Purpose: Teleports player's group to map position selected by click on map.
*/

hint "Click on the map to teleport!";
onMapSingleClick "{_x setPos _pos} forEach units group player; true;";