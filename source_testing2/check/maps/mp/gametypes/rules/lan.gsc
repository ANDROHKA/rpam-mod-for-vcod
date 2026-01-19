

Load()
{
	game["ruleCvars"] = GetCvars(game["ruleCvars"]);
}

GetCvars(arr)
{
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_readyup_autoresume_half", 0); 	// Minutes to auto-resume halftime [0 - 10] 0 = disabled
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_readyup_autoresume_map", 0); 	// Minutes to auto-resume between maps [0 - 10] 0 = disabled

	return arr;
}
