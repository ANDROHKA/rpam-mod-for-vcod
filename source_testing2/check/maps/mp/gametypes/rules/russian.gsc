

Load()
{
	game["ruleCvars"] = GetCvars(game["ruleCvars"]);
}

GetCvars(arr)
{
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_replace_russian", 0); 	// Replace russians with Americans / Brisith

	return arr;
}
