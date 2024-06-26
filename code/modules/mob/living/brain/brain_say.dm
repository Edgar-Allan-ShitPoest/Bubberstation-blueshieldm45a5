/mob/living/brain/say(message, bubble_type, list/spans = list(), sanitize = TRUE, datum/language/language = null, ignore_spam = FALSE, forced = null, filterpoof = null, message_range = 7, datum/saymode/saymode = null)
	// BUBBER CHANGE: funny talking head
	if(stat == DEAD) // lets you talk in deadchat
		return ..()
	var/datum/antagonist/bloodsucker/spooky_vampire_head = mind?.has_antag_datum(/datum/antagonist/bloodsucker)
	if(!container && spooky_vampire_head)
		var/obj/head = spooky_vampire_head.is_head(src)
		if(!head)
			return
		var/animation_time = max(2, length_char(message) * 0.5)
		head.Shake(duration = animation_time)
		..()
	// BUBBER CHANGE END
	if(!(container && istype(container, /obj/item/mmi)))
		return //No MMI, can't speak, bucko./N
	else
		if(prob(emp_damage*4))
			if(prob(10))//10% chane to drop the message entirely
				return
			else
				message = Gibberish(message, emp_damage >= 12)//scrambles the message, gets worse when emp_damage is higher

		..()

/mob/living/brain/radio(message, list/message_mods = list(), list/spans, language)
	if(message_mods[MODE_HEADSET] && istype(container, /obj/item/mmi))
		var/obj/item/mmi/R = container
		if(R.radio)
			R.radio.talk_into(src, message, language = language, message_mods = message_mods)
			return ITALICS | REDUCE_RANGE
	else
		return ..()

/mob/living/brain/treat_message(message, tts_message, tts_filter, capitalize_message = TRUE)
	if(capitalize_message)
		message = capitalize(message)
	return list(message = message, tts_message = message, tts_filter = list())
