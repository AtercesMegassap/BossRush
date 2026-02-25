function update_world() 
{
    var floor_world1 = layer_get_id("Floor_World1");
    var floor_world2 = layer_get_id("Floor_World2");
	var wall_world1 = layer_get_id("Wall_World1");
    var wall_world2 = layer_get_id("Wall_World2");
	var roof_world1 = layer_get_id("Roof_World1");
    var roof_world2 = layer_get_id("Roof_World2");
	var level_world1 = layer_get_id("Level_World1");
    var level_world2 = layer_get_id("Level_World2");

    if (global.world_current == global.world1) 
	{
        layer_set_visible(floor_world1, true);
        layer_set_visible(floor_world2, false);
		layer_set_visible(wall_world1, true);
        layer_set_visible(wall_world2, false);
		layer_set_visible(roof_world1, true);
        layer_set_visible(roof_world2, false);
		layer_set_visible(level_world1, true);
        layer_set_visible(level_world2, false);
    }
    else if (global.world_current == global.world2) 
	{
        layer_set_visible(floor_world1, false);
        layer_set_visible(floor_world2, true);
		layer_set_visible(wall_world1, false);
        layer_set_visible(wall_world2, true);
		layer_set_visible(roof_world1, false);
        layer_set_visible(roof_world2, true);
		layer_set_visible(level_world1, false);
        layer_set_visible(level_world2, true);
    }
}