if(global.world_current == global.world1)
{
	global.world_current = global.world2;
	update_world();
}
else if(global.world_current == global.world2)
{
	global.world_current = global.world1;
	update_world();
}