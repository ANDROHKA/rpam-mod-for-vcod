

Load()
{
	game["ruleCvars"] = GetCvars(game["ruleCvars"]);
}

GetCvars(arr)
{
	// Weapon Limits by class per team
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_boltaction_limit", 99);
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sniper_limit", 0);
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_semiautomatic_limit", 99);
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_smg_limit", 99);
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_mg_limit", 99);
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_shotgun_limit", 0);

	return arr;
}
