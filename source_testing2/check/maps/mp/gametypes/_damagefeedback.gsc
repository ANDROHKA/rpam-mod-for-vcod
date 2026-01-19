

init()
{
	logprint("_damagefeedback::init\n");
	maps\mp\gametypes\global\_global::addEventListener("onCvarChanged", ::onCvarChanged);

	maps\mp\gametypes\global\_global::registerCvar("scr_show_hitblip", "BOOL", 0);

	if(game["firstInit"])
	{
		precacheShader("damage_feedback");
		//precacheRumble("damage_heavy");

		maps\mp\gametypes\global\_global::precacheString2("STRING_ASSIST", &"assist");
	}
}

// This function is called when cvar changes value.
// Is also called when cvar is registered
// Return true if cvar was handled here, otherwise false
onCvarChanged(cvar, value, isRegisterTime)
{
	switch(cvar)
	{
		case "scr_show_hitblip": 	level.scr_show_hitblip = value; return true;
	}
	return false;
}

updateAssistsFeedback()
{
	if (level.scr_show_hitblip)
	{
		if(isPlayer(self))
		{
			if (!isDefined(self.hud_assistfeedback))
			{
				self.hud_assistfeedback = maps\mp\gametypes\global\_global::newClientHudElem2(self);
				//self.hud_assistfeedback.horzAlign = "center";
				//self.hud_assistfeedback.vertAlign = "middle";
				//self.hud_assistfeedback.x = 0;
				self.hud_assistfeedback.x = 320;
				//self.hud_assistfeedback.y = 20;
				self.hud_assistfeedback.y = 260;
				self.hud_assistfeedback.alignX = "center";
				self.hud_assistfeedback.alpha = 0;
				self.hud_assistfeedback.archived = true;
				self.hud_assistfeedback.color = (1,1,1);
				self.hud_assistfeedback.fontSize = 1.1;
				self.hud_assistfeedback setText(game["STRING_ASSIST"]);
			}

			self.hud_assistfeedback.alpha = 1;
			self.hud_assistfeedback fadeOverTime(1.3);
			self.hud_assistfeedback.alpha = 0;
		}
	}
}