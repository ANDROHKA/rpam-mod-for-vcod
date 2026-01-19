

init()
{
	logprint("_friendicons::init\n");
	
	maps\mp\gametypes\global\_global::addEventListener("onCvarChanged", ::onCvarChanged);

	maps\mp\gametypes\global\_global::registerCvar("scr_drawfriend", "BOOL", 1); 	  // Draws a team icon over teammates // NOTE: restart needed

	if(!level.scr_drawfriend)
		return;

	// Register events
	maps\mp\gametypes\global\_global::addEventListener("onStartGameType", ::onStartGameType);
	maps\mp\gametypes\global\_global::addEventListener("onSpawnedPlayer", ::onSpawnedPlayer);
	maps\mp\gametypes\global\_global::addEventListener("onPlayerKilled",  ::onPlayerKilled);
}

// This function is called when cvar changes value.
// Is also called when cvar is registered
// Return true if cvar was handled here, otherwise false
onCvarChanged(cvar, value, isRegisterTime)
{
	switch(cvar)
	{
		case "scr_drawfriend": level.scr_drawfriend = value; return true;
	}
	return false;
}



// Called after the <gametype>.gsc::main() and <map>.gsc::main() scripts are called
// At this point game specific variables are defined (like game["allies"], game["axis"], game["american_soldiertype"], ...)
// Called again for every round in round-based gameplay
onStartGameType()
{
	if(game["firstInit"])
	{
		// Draws a team icon over teammates
		switch(game["allies"])
		{
			case "american":
				game["headicon_allies"] = "gfx/hud/headicon@american.tga";
				precacheHeadIcon(game["headicon_allies"]);
				break;

			case "british":
				game["headicon_allies"] = "gfx/hud/headicon@british.tga";
				precacheHeadIcon(game["headicon_allies"]);
				break;

			case "russian":
				game["headicon_allies"] = "gfx/hud/headicon@russian.tga";
				precacheHeadIcon(game["headicon_allies"]);
				break;
		}

		game["headicon_axis"] = "gfx/hud/headicon@german.tga";
		precacheHeadIcon(game["headicon_axis"]);
	}
}




onSpawnedPlayer()
{
	// Show friend icon
	if(self.pers["team"] == "allies")
	{
		self.headicon = game["headicon_allies"];
		self.headiconteam = "allies";
	}
	else
	{
		self.headicon = game["headicon_axis"];
		self.headiconteam = "axis";
	}
}

onPlayerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self.headicon = "";
	self.headiconteam = "none";
}