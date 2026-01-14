/*  rPAMext Version: v21
   
    Changes onto kvcodPAM v211:
   
    rFIX applied syntax fixes
    rBOMBPRINTFIX fix of a logprint which occurs error after bomb explodes on A on mp_germantown
    rHINT hint messages throughout the script
    rGETPLANT some script fixes from zPAM404
    rEXPLODER try to fix "ents", however it is not defined

*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//as zPAM4
add_to_array(array, ent)
{
	if(!isdefined(ent))
		return array;
		
	if(!isdefined(array))
		array[0] = ent;
	else
		array[array.size] = ent;
	
	return array;	
}

//rEXPLODER
exploder(num)
{
//rFIX num should be script_noteworthy or script_exploder or ?
//	ents = level._script_expoders;
//	num = int(num);						//undefined atm
	ents = level._script_exploders;				//like zPAM404

//added return if ents is not defined
	if (!isdefined(ents))
	{
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::exploder(num) ents is not defined"); }
		logprint("_utility::exploder(num) ents is not defined\n");
		return; 
	}

	for(i = 0; i < ents.size; i++)
	{
		if(!isdefined (ents[i]))
			continue;
//added from zPAM404
//		if (ents[i].script_exploder != num)
//			continue;
//
//		if (isdefined(ents[i].script_fxid))
//			level thread cannon_effect(ents[i]);
//
//		if (isdefined (ents[i].script_sound))
//			ents[i] thread exploder_sound();	
//from kvcodPAMv211
//		println("ent origin ", ents[i].origin);
/*		if ((isdefined(ents[i].script_exploder)) && (ents[i].script_exploder == num))
		{
			if((isdefined(ents[i].targetname)) && (ents[i].targetname == "exploder"))
				ents[i] thread brush_show();
			else
			if((isdefined(ents[i].targetname)) && (ents[i].targetname == "exploderchunk"))
				ents[i] thread brush_throw();
			else
			if(!isdefined(ents[i].script_fxid))
				ents[i] thread brush_delete();
		}	
*/
//added from zPAM404
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::ents targetname brushes"); }
		logprint("_utility::ents targetname brushes\n");
		if (isdefined(ents[i].targetname))
		{
			if(ents[i].targetname == "exploder")
				ents[i] thread brush_show();
			else
			if((ents[i].targetname == "exploderchunk") || (ents[i].targetname == "exploderchunk visible"))
				ents[i] thread brush_throw();
			else
			if(!isdefined(ents[i].script_fxid))
				ents[i] thread brush_delete();
		}
		else
		{
			if (!isdefined(ents[i].script_fxid))
				ents[i] thread brush_delete();
		}

		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::exploder(num) ent origin " + ents[i].origin); }
   	 	logprint("_utility::exploder(num) ent origin " + ents[i].origin + " \n");
	}

	models = getentarray("script_model", "classname");
	for(i = 0; i < models.size; i++)
	{
		if((isdefined(models[i].script_exploder)) && (models[i].script_exploder == num))
			if (getcvar("rpam_debug_p") == "1")	{ iprintln("_utility::exploder(num) opens cannon_effect"); }
			logprint("_utility::exploder(num) opens cannon_effect\n");
			models[i] thread cannon_effect();
	}
}

//below is like zPAM404
exploder_sound()
{
	if(isdefined(self.script_delay))
		wait level.fps_multiplier * self.script_delay;

	self playSound(level.scr_sound[self.script_sound]);
}

brush_delete()
{
	if(isdefined(self.script_delay))
		wait(self.script_delay);

	self delete();
}

brush_show()
{
	if(isdefined(self.script_delay))
		wait(self.script_delay);

	self show();

	if(self.classname != "script_model")
		self solid();
}

brush_throw()
{
	if(isdefined(self.script_delay))
		wait(self.script_delay);

	if(isdefined(self.target))
		ent = getent(self.target, "targetname");

	if(!isdefined(ent))
	{
		self delete();
		return;
	}

	self show();

	org = ent.origin;

	temp_vec = (org - self.origin);

//	println("start ", self.origin , " end ", org, " vector ", temp_vec, " player origin ", level.player getorigin());
	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::brush_throw start=" + self.origin + " end=" + org + " vector=" + temp_vec + " player=" + level.player getorigin()); }
    	logprint("_utility::brush_throw start=" + self.origin + " end=" + org + " vector=" + temp_vec + " player=" + level.player getorigin() + " \n");


	x = temp_vec[0];
	y = temp_vec[1];
	z = temp_vec[2];

	self rotateVelocity((x,y,z), 12);
	self moveGravity((x, y, z), 12);

	wait(6);
	self delete();
}

//rBOMBPRINTFIX
cannon_effect()
{
//rHINT is self.target existing?
	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect start"); }
	logprint("_utility::cannon-effect start\n");

	if(!isdefined(self.script_delay))
		self.script_delay = 0;

	if((isdefined(self.script_delay_min)) && (isdefined(self.script_delay_max)))
	{
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect wait script_delay"); }
		logprint("_utility::cannon_effect wait script_delay\n");
		self.script_delay = self.script_delay_min;
		wait(randomfloat(self.script_delay_max - self.script_delay_min));
	}

	if(!isdefined(self.script_fxid))
//	return;
	{
		if (getcvar("rpam_debug_p") == "1"){ iprintln("_utility::cannon_effect script_fxid not defined"); }
		logprint("_utility::cannon_effect script_fxid not defined\n");
		return;
	}

	//logprint("_utility::cannon-effect() " + self.target + "\n");
	//logprint("_utility::cannon-effect " + (getent(self.target, "targetname")).origin + "\n");
//rBOMBPRINTFIX above where faulty
	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect try to define target"); }
	if(isdefined(self.target))
	{
		org = (getent(self.target, "targetname")).origin;
		logprint("_utility::cannon_effect target " + org[0] + " " + org[1] + " " + org[2] + "\n");
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect target " + org[0] + " " + org[1] + " " + org[2]); }
	}
	else
	{
		//org = self.origin;
		logprint("_utility::cannon_effect target not defined\n");
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect target not defined"); }
	}

	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::cannon_effect bomb script_fxid done"); }
	logprint("_utility::cannon_effect bomb script_fxid done\n");

	maps\mp\_fx::OneShotfx(self.script_fxid, self.origin, self.script_delay, org);
//	self delete();
}
//zPAM404cannon_effect()
//cannon_effect(source)
//{
//	if(!isdefined(source.script_delay))
//		source.script_delay = 0;
//
//	if((isdefined(source.script_delay_min)) && (isdefined(source.script_delay_max)))
//		source.script_delay = source.script_delay_min + randomfloat (source.script_delay_max - source.script_delay_min);
//
//	org = undefined;
//	if(isdefined(source.target))
//		org = (getent(source.target, "targetname")).origin;
//
//	level thread maps\mp\_fx::OneShotfx(source.script_fxid, source.origin, source.script_delay, org);
//}

error(msg)
{
	// GENERATES AN ERROR, DON'T FREAKIN TOUCH THIS FUNCTION PLEASE
	// GENERATES AN ERROR, DON'T FREAKIN TOUCH THIS FUNCTION PLEASE
	println("^c*ERROR* ", msg);
	wait .05;	// waitframe

	if(getcvar("debug") != "1")
	{
		blah = getent("Time to Stop the Script!", "targetname");
			println(THIS_IS_A_FORCED_ERROR___ATTACH_LOG.origin);
	}
	// GENERATES AN ERROR, DON'T FREAKIN TOUCH THIS FUNCTION PLEASE
	// GENERATES AN ERROR, DON'T FREAKIN TOUCH THIS FUNCTION PLEASE
}

//below is like zPAM404
triggerOff()
{
	if (!isdefined (self.realOrigin))
		self.realOrigin = self.origin;

//rFIX
	if (self.origin == self.realOrigin)
		self.origin += (0, 0, -10000);
}

triggerOn()
{
	if (isDefined (self.realOrigin) )
		self.origin = self.realOrigin;
}

saveModel()
{
	info["model"] = self.model;
	info["viewmodel"] = self getViewModel();
	attachSize = self getAttachSize();
//	info["attach"] = [];							//added by zPAM404

	for(i = 0; i < attachSize; i++)
	{
		info["attach"][i]["model"] = self getAttachModelName(i);
		info["attach"][i]["tag"] = self getAttachTagName(i);
		info["attach"][i]["ignoreCollision"] = self getAttachIgnoreCollision(i);
	}
	
	return info;
}

loadModel(info)
{
	self detachAll();
	self setModel(info["model"]);
	self setViewModel(info["viewmodel"]);
	attachInfo = info["attach"];
	attachSize = attachInfo.size;
    
	for(i = 0; i < attachSize; i++)
		self attach(attachInfo[i]["model"], attachInfo[i]["tag"], attachInfo[i]["ignoreCollision"]);
}

vectorScale(vec, scale)
{
	vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
	return vec;
}

//rGETPLANT
getPlant()
{
	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::getPlant start"); }

	start = self.origin + (0, 0, 10);

	range = 11;
	forward = anglesToForward(self.angles);
	forward = maps\mp\_utility::vectorScale(forward, range);

	traceorigins[0] = start + forward;
	traceorigins[1] = start;

	trace = bulletTrace(traceorigins[0], (traceorigins[0] + (0, 0, -18)), false, undefined);
	if(trace["fraction"] < 1)
	{
		//println("^6Using traceorigins[0], tracefraction is", trace["fraction"]);
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::getPlant traceorigins[0], tracefraction is ", trace["fraction"]); }

		temp = spawnstruct();
		temp.origin = trace["position"];
		temp.angles = orientToNormal(trace["normal"]);
		return temp;
	}

	trace = bulletTrace(traceorigins[1], (traceorigins[1] + (0, 0, -18)), false, undefined);
	if(trace["fraction"] < 1)
	{
		//println("^6Using traceorigins[1], tracefraction is", trace["fraction"]);
		if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::getPlant traceorigins[1], tracefraction is", trace["fraction"]); }

		temp = spawnstruct();
		temp.origin = trace["position"];
		temp.angles = orientToNormal(trace["normal"]);
		return temp;
	}

	traceorigins[2] = start + (16, 16, 0);
	traceorigins[3] = start + (16, -16, 0);
	traceorigins[4] = start + (-16, -16, 0);
	traceorigins[5] = start + (-16, 16, 0);

//rTRACE
	if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::getPlant set besttracefraction = undefined"); logprint("_utility::getPlant set besttracefraction = undefined\n"); }
	
	besttracefraction = undefined;
	besttraceposition = undefined;
	for(i = 0; i < traceorigins.size; i++)
	{
		trace = bulletTrace(traceorigins[i], (traceorigins[i] + (0, 0, -1000)), false, undefined);

		//ent[i] = spawn("script_model",(traceorigins[i]+(0, 0, -2)));
		//ent[i].angles = (0, 180, 180);
		//ent[i] setmodel("xmodel/105");

		//println("^6trace ", i ," fraction is ", trace["fraction"]);

		if(!isdefined(besttracefraction) || (trace["fraction"] < besttracefraction))
		{
			besttracefraction = trace["fraction"];
			besttraceposition = trace["position"];

			//println("^6besttracefraction set to ", besttracefraction, " which is traceorigin[", i, "]");
			if (getcvar("rpam_debug_p") == "1") { iprintln("_utility::getPlant set besttracefraction = 0"); logprint("_utility::getPlant set besttracefraction = 0\n"); }
		}
	}
	
	if(besttracefraction == 1)
		besttraceposition = self.origin;
	
	if (getcvar("rpam_debug_p") == "1")	{ iprintln("_utility::getPlant end"); logprint("_utility::getPlant end\n");	}
	temp = spawnstruct();
	temp.origin = besttraceposition;
	temp.angles = orientToNormal(trace["normal"]);
	return temp;
}

orientToNormal(normal)
{
	hor_normal = (normal[0], normal[1], 0);
	hor_length = length(hor_normal);

	if(!hor_length)
		return (0, 0, 0);
	
	hor_dir = vectornormalize(hor_normal);
	neg_height = normal[2] * -1;
	tangent = (hor_dir[0] * neg_height, hor_dir[1] * neg_height, hor_length);
	plant_angle = vectortoangles(tangent);

    if (getcvar("rpam_debug_p") == "1")
    {
        	iprintln("_utility::orientToNormal hor_normal: " 
                 + hor_normal[0] + ", " + hor_normal[1] + ", " + hor_normal[2]);
        	iprintln("_utility::orientToNormal hor_length: " + hor_length);
        	iprintln("_utility::orientToNormal hor_dir: " 
                 + hor_dir[0] + ", " + hor_dir[1] + ", " + hor_dir[2]);
        	iprintln("_utility::orientToNormal neg_height: " + neg_height);
        	iprintln("_utility::orientToNormal tangent: " 
                 + tangent[0] + ", " + tangent[1] + ", " + tangent[2]);
        	iprintln("_utility::orientToNormal plant_angle: " 
                 + plant_angle[0] + ", " + plant_angle[1] + ", " + plant_angle[2]);

        	logprint("_utility::orientToNormal hor_normal: " 
                 + hor_normal[0] + ", " + hor_normal[1] + ", " + hor_normal[2] + "\n");
        	logprint("_utility::orientToNormal hor_length: " + hor_length + "\n");
        	logprint("_utility::orientToNormal hor_dir: " 
                 + hor_dir[0] + ", " + hor_dir[1] + ", " + hor_dir[2] + "\n");
        	logprint("_utility::orientToNormal neg_height: " + neg_height + "\n");
        	logprint("_utility::orientToNormal tangent: " 
                 + tangent[0] + ", " + tangent[1] + ", " + tangent[2] + "\n");
        	logprint("_utility::orientToNormal plant_angle: " 
                 + plant_angle[0] + ", " + plant_angle[1] + ", " + plant_angle[2] + "\n");
	}
	//println("^6hor_normal is ", hor_normal);
	//println("^6hor_length is ", hor_length);
	//println("^6hor_dir is ", hor_dir);
	//println("^6neg_height is ", neg_height);
	//println("^6tangent is ", tangent);
	//println("^6plant_angle is ", plant_angle);

	return plant_angle;
}
// END OF FILE