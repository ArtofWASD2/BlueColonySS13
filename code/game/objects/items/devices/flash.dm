/obj/item/device/flash
	name = "flash"
	desc = "Used for blinding and being an asshole."
	icon_state = "flash"
	item_state = "flashtool"
	throwforce = 5
	w_class = ITEMSIZE_SMALL
	throw_speed = 4
	throw_range = 10
	flags = CONDUCT
	origin_tech = list(TECH_MAGNET = 2, TECH_COMBAT = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

	var/times_used = 0 //Number of times it's been used.
	var/broken = 0     //Is the flash burnt out?
	var/last_used = 0 //last world.time it was used.
	var/max_flashes = 10 // How many times the flash can be used before needing to self recharge.
	var/halloss_per_flash = 30

	var/synthetic_only = FALSE
	tax_type = WEAPONS_TAX

/obj/item/device/flash/proc/clown_check(var/mob/user)
	if(user && (CLUMSY in user.mutations) && prob(50))
		to_chat(user, "<span class='warning'>\The [src] slips out of your hand.</span>")
		user.drop_item()
		return 0
	return 1

/obj/item/device/flash/proc/flash_recharge()
	//Every ten seconds the flash doesn't get used, the times_used variable goes down by one, making the flash less likely to burn out,
	// as well as being able to flash more before reaching max_flashes cap.
	for(var/i=0, i < max_flashes, i++)
		if(last_used + 10 SECONDS > world.time)
			break
		last_used += 10 SECONDS
		times_used--
	last_used = world.time
	times_used = max(0,round(times_used)) //sanity

// Returns true if the device can flash.
/obj/item/device/flash/proc/check_capacitor(var/mob/user)
	//spamming the flash before it's fully charged (60 seconds) increases the chance of it breaking
	//It will never break on the first use.
	if(times_used <= max_flashes)
		last_used = world.time
		if(prob( round(times_used / 2) ))	//if you use it 10 times in a minute it has a 5% chance to break.
			broken = 1
			if(user)
				to_chat(user, "<span class='warning'>The bulb has burnt out!</span>")
			icon_state = "flashburnt"
			return FALSE
		else
			times_used++
			return TRUE
	else	//can only use it 10 times a minute
		if(user)
			to_chat(user, "<span class='warning'><i>click</i></span>")
			playsound(src.loc, 'sound/weapons/empty.ogg', 80, 1)
		return FALSE

//attack_as_weapon
/obj/item/device/flash/attack(mob/living/M, mob/living/user, var/target_zone)
	if(!user || !M)	return	//sanity

	add_attack_logs(user,M,"Flashed (attempt) with [src]")

	user.setClickCooldown(user.get_attack_speed(src))
	user.do_attack_animation(M)

	if(!clown_check(user))	return
	if(broken)
		to_chat(user, "<span class='warning'>\The [src] is broken.</span>")
		return

	flash_recharge()

	if(!check_capacitor(user))
		return

	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)


	var/flashfail = 0


	if(user.IsAntiGrief())
		flashfail = 1

	if(iscarbon(M))
		if(!synthetic_only)
			var/mob/living/carbon/C = M
			if(C.stat != DEAD)
				var/safety = C.eyecheck()
				if(safety <= 0)
					var/flash_strength = 5
					if(ishuman(C))
						var/mob/living/carbon/human/H = C
						flash_strength *= H.species.flash_mod

						if(flash_strength > 0)
							H.Confuse(flash_strength + 5)
							H.Blind(flash_strength)
							H.eye_blurry = max(H.eye_blurry, flash_strength + 5)
							H.flash_eyes()
							H.adjustHalLoss(halloss_per_flash * (flash_strength / 5)) // Should take four flashes to stun.

				else
					flashfail = 1
		else
			flashfail = 1

	else if(issilicon(M))
		flashfail = 0
		var/mob/living/silicon/S = M
		if(isrobot(S))
			var/mob/living/silicon/robot/R = S
			if(R.has_active_type(/obj/item/borg/combat/shield))
				var/obj/item/borg/combat/shield/shield = locate() in R
				if(shield)
					if(shield.active)
						shield.adjust_flash_count(R, 1)
						flashfail = 1

	else if(isanimal(M))
		flashfail = 0
		
	else
		flashfail = 1

	if(isrobot(user))
		spawn(0)
			var/atom/movable/overlay/animation = new(user.loc)
			animation.layer = user.layer + 1
			animation.icon_state = "blank"
			animation.icon = 'icons/mob/mob.dmi'
			animation.master = user
			flick("blspell", animation)
			sleep(5)
			qdel(animation)

	if(!flashfail)
		flick("flash2", src)
		if(!issilicon(M))

			user.visible_message("<span class='disarm'>[user] blinds [M] with the flash!</span>")
		else

			user.visible_message("<span class='notice'>[user] overloads [M]'s sensors with the flash!</span>")
			M.Weaken(rand(5,10))
	else

		user.visible_message("<span class='notice'>[user] fails to blind [M] with the flash!</span>")

	return




/obj/item/device/flash/attack_self(mob/living/carbon/user as mob, flag = 0, emp = 0)
	if(!user || !clown_check(user)) 	return

	user.setClickCooldown(user.get_attack_speed(src))

	if(broken)
		user.show_message("<span class='warning'>The [src.name] is broken</span>", 2)
		return

	flash_recharge()

	if(!check_capacitor(user))
		return

	playsound(src.loc, 'sound/weapons/flash.ogg', 100, 1)
	flick("flash2", src)
	if(user && isrobot(user))
		spawn(0)
			var/atom/movable/overlay/animation = new(user.loc)
			animation.layer = user.layer + 1
			animation.icon_state = "blank"
			animation.icon = 'icons/mob/mob.dmi'
			animation.master = user
			flick("blspell", animation)
			sleep(5)
			qdel(animation)

	for(var/mob/living/carbon/C in oviewers(3, null))
		var/safety = C.eyecheck()
		if(!safety)
			if(!C.blinded)
				C.flash_eyes()

	return

/obj/item/device/flash/emp_act(severity)
	if(broken)	return
	flash_recharge()
	if(!check_capacitor())
		return

	if(istype(loc, /mob/living/carbon))
		var/mob/living/carbon/C = loc
		var/safety = C.eyecheck()
		if(safety <= 0)
			C.adjustHalLoss(halloss_per_flash)
			//C.Weaken(10)
			C.flash_eyes()
			for(var/mob/M in viewers(C, null))
				M.show_message("<span class='disarm'>[C] is blinded by the flash!</span>")
	..()

/obj/item/device/flash/synthetic
	name = "synthetic flash"
	desc = "When a problem arises, SCIENCE is the solution."
	icon_state = "sflash"
	origin_tech = list(TECH_MAGNET = 2, TECH_COMBAT = 1)

//attack_as_weapon
/obj/item/device/flash/synthetic/attack(mob/living/M, mob/living/user, var/target_zone)
	..()
	if(!broken)
		broken = 1
		to_chat(user, "<span class='warning'>The bulb has burnt out!</span>")
		icon_state = "flashburnt"

/obj/item/device/flash/synthetic/attack_self(mob/living/carbon/user as mob, flag = 0, emp = 0)
	..()
	if(!broken)
		broken = 1
		to_chat(user, "<span class='warning'>The bulb has burnt out!</span>")
		icon_state = "flashburnt"

/obj/item/device/flash/synthdisabler
	name = "synth disabler"
	desc = "A human-safe flash that only affects synthetics and robots."
	icon_state = "synthflash"

	synthetic_only = TRUE
