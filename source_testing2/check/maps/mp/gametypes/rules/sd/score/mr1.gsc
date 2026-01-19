

Load()
{
	game["rules_formatString"] = &"MR1";
	game["ruleCvars"] = GetCvars(game["ruleCvars"]);
}

GetCvars(arr)
{
	// Match Style
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_timelimit", 0);		// Time limit for map. 0=disabled (minutes)
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_half_round", 1);	// Number of rounds when half-time starts. 0=ignored
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_half_score", 0);	// Number of score when half-time starts. 0=ignored
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_end_round", 2);		// Number of rounds when map ends. 0=ignored
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_end_score", 2);		// Number of score when map ends. 0=ignored

	// Are there OT Rules?
	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_overtime", 1);

	// OT Rules - MR3 format
  	if (isDefined(game["overtime_active"]) && game["overtime_active"])
  	{
		arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_half_round", 3);
		arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_half_score", 0);
		arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_end_round", 6);
		arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_sd_end_score", game["overtime_score"] + 4); // 12 / 12  ->  16 / 16  ->  20 / 20  -> ...
	}

	arr = maps\mp\gametypes\global\_global::ruleCvarDefault(arr, "scr_show_scoreboard_limit", 1);	// show limit in score with slash

	return arr;
}
