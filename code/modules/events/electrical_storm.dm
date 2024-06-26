/datum/round_event_control/electrical_storm
	name = "Electrical Storm"
	typepath = /datum/round_event/electrical_storm
	earliest_start = 10 MINUTES
	min_players = 5
	weight = 20
	alert_observers = FALSE

/datum/round_event/electrical_storm
	var/lightsoutAmount = 1
	var/lightsoutRange = 25
	announceWhen = 1

/datum/round_event/electrical_storm/announce(fake)
	priority_announce("An electrical storm has been detected in your area, please repair potential electronic overloads.", sound_type = ANNOUNCER_IONSTORM)


/datum/round_event/electrical_storm/start()
	var/list/epicentreList = list()

	for(var/i in 1 to lightsoutAmount)
		var/turf/T = find_safe_turf()
		if(istype(T))
			epicentreList += T

	if(!epicentreList.len)
		return

	for(var/centre in epicentreList)
		for(var/obj/machinery/power/apc/A as anything in INSTANCES_OF(/obj/machinery/power/apc))
			if(get_dist(centre, A) <= lightsoutRange)
				A.overload_lighting()
