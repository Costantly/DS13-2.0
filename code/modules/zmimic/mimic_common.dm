/// Updates whatever openspace objects may be mimicking us. On turfs this queues an openturf update on the above openturf, on movables this updates their bound movable (if present). Meaningless on any type other than `/turf` or `/atom/movable` (incl. children).
/atom/proc/update_above()
	return

/turf/proc/is_above_space()
	var/turf/T = GetBelow(src)
	while (T && (T.z_flags & Z_MIMIC_BELOW))
		T = GetBelow(T)
	return isspaceturf(T)

/turf/update_appearance(updates)
	. = ..()
	if(above)
		update_above()
