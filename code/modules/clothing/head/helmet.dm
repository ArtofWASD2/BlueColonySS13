/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Police gear. Protects the head from impacts."
	icon_state = "helmet"
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	flags = THICKMATERIAL
	armor = list(melee = 40, bullet = 30, laser = 30, energy = 10, bomb = 10, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEMSIZE_NORMAL
	ear_protection = 1

/obj/item/clothing/head/helmet/solgov
	name = "\improper Solar Confederate Government helmet"
	desc = "A helmet painted in Peacekeeper blue. Stands out like a sore thumb."
	icon_state = "helmet_sol"
	armor = list(melee = 50, bullet = 50, laser = 50,energy = 25, bomb = 30, bio = 0, rad = 0)
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/solgov/command
	name = "command helmet"
	desc = "A helmet with 'Solar Confederate Government' printed on the back in gold lettering."
	icon_state = "helmet_command"

/obj/item/clothing/head/helmet/solgov/security
	name = "security helmet"
	desc = "A helmet with 'MASTER AT ARMS' printed on the back in silver lettering."
	icon_state = "helmet_security"

/obj/item/clothing/head/helmet/police
	name = "police helmet"
	desc = "A helmet with 'POLICE' printed on the back in gold lettering."
	icon_state = "helmet_command"


/obj/item/clothing/head/helmet/nt
	name = "\improper NanoTrasen helmet"
	desc = "A helmet with 'CORPORATE SECURITY' printed on the back in red lettering."
	icon_state = "helmet_nt"

/obj/item/clothing/head/helmet/pcrc
	name = "\improper PCRC helmet"
	desc = "A helmet with 'PRIVATE SECURITY' printed on the back in cyan lettering."
	icon_state = "helmet_pcrc"

/obj/item/clothing/head/helmet/tac
	name = "tactical helmet"
	desc = "A tan helmet made from advanced ceramic. Comfortable and robust."
	icon_state = "helmet_tac"
	armor = list(melee = 50, bullet = 60, laser = 60, energy = 45, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/merc
	name = "combat helmet"
	desc = "A heavily reinforced helmet painted with red markings. Feels like it could take a lot of punishment."
	icon_state = "helmet_merc"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 35, bomb = 30, bio = 0, rad = 0)
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	armor = list(melee = 80, bullet = 10, laser = 10, energy = 10, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
	valid_accessory_slots = null
	action_button_name = "Toggle Visor"

/obj/item/clothing/head/helmet/riot/attack_self(mob/user as mob)
	if(src.icon_state == initial(icon_state))
		src.icon_state = "[icon_state]up"
		user << "You raise the visor on the riot helmet."
	else
		src.icon_state = initial(icon_state)
		user << "You lower the visor on the riot helmet."
	update_clothing_icon()	//so our mob-overlays update

/obj/item/clothing/head/helmet/laserproof
	name = "ablative helmet"
	desc = "It's a helmet specifically designed to protect against energy projectiles."
	icon_state = "helmet_reflec"
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet")
	armor = list(melee = 10, bullet = 10, laser = 80 ,energy = 50, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.1
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/bulletproof
	name = "bullet-resistant helmet"
	desc = "It's a helmet specifically designed to protect against ballistic projectiles."
	icon_state = "helmet_bulletproof"
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet")
	armor = list(melee = 10, bullet = 80, laser = 10 ,energy = 10, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/combat
	name = "combat helmet"
	desc = "It's a general purpose combat helmet, designed to protect against typical dangers to your head."
	icon_state = "helmet_combat"
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet")
	armor = list(melee = 50, bullet = 50, laser = 50 ,energy = 30, bomb = 30, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.6
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "They're often used by highly trained SWAT Officers."
	icon_state = "swat"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5

/obj/item/clothing/head/helmet/alien
	name = "alien helmet"
	desc = "It's quite larger than your head, but it might still protect it."
	icon_state = "alienhelmet"
	siemens_coefficient = 0.4
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 50, bomb = 50, bio = 0, rad = 40)
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/alien/tank
	name = "alien warhelm"
	armor = list(melee = 70, bullet = 70, laser = 70, energy = 70, bomb = 70, bio = 0, rad = 40)

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 10, bomb = 25, bio = 10, rad = 0)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state_slots = list(slot_r_hand_str = "vhelmet", slot_l_hand_str = "vhelmet")
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES
	siemens_coefficient = 1
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/tactical
	name = "tactical helmet"
	desc = "An armored helmet capable of being fitted with a multitude of attachments."
	icon_state = "swathelm"
	item_state_slots = list(slot_r_hand_str = "swat", slot_l_hand_str = "swat")
	sprite_sheets = list(
		SPECIES_TAJ = 'icons/mob/species/tajaran/helmet.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/helmet.dmi',
		)

	armor = list(melee = 60, bullet = 60, laser = 60, energy = 40, bomb = 40, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/augment
	name = "Augment Array"
	desc = "A helmet with optical and cranial augments coupled to it."
	icon_state = "v62"
	item_state_slots = list(slot_r_hand_str = "head_m", slot_l_hand_str = "head_m")
	armor = list(melee = 80, bullet = 60, laser = 50,energy = 25, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	valid_accessory_slots = null

//Non-hardsuit ERT helmets.
/obj/item/clothing/head/helmet/ert
	name = "emergency response team helmet"
	desc = "An in-atmosphere helmet worn by members of the NanoTrasen Emergency Response Team. Protects the head from impacts."
	icon_state = "erthelmet_cmd"
	item_state_slots = list(slot_r_hand_str = "syndicate-helm-green", slot_l_hand_str = "syndicate-helm-green")
	armor = list(melee = 62, bullet = 50, laser = 50,energy = 35, bomb = 10, bio = 2, rad = 0)
	valid_accessory_slots = null

//Commander
/obj/item/clothing/head/helmet/ert/command
	name = "emergency response team commander helmet"
	desc = "An in-atmosphere helmet worn by the commander of a NanoTrasen Emergency Response Team. Has blue highlights."

//Security
/obj/item/clothing/head/helmet/ert/security
	name = "emergency response team security helmet"
	desc = "An in-atmosphere helmet worn by security members of the NanoTrasen Emergency Response Team. Has red highlights."
	icon_state = "erthelmet_sec"

//Engineer
/obj/item/clothing/head/helmet/ert/engineer
	name = "emergency response team engineer helmet"
	desc = "An in-atmosphere helmet worn by engineering members of the NanoTrasen Emergency Response Team. Has orange highlights."
	icon_state = "erthelmet_eng"

//Medical
/obj/item/clothing/head/helmet/ert/medical
	name = "emergency response team medical helmet"
	desc = "A set of armor worn by medical members of the NanoTrasen Emergency Response Team. Has red and white highlights."
	icon_state = "erthelmet_med"

/obj/item/clothing/head/helmet/poxball
	name = "poxball headguard"
	desc = "A modified abalative helmet designed to protect against poxball surges.."
	icon_state = "poxball_helm"
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet")
	armor = list(melee = 10, bullet = 5, laser = 20 ,energy = 30, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.1
	valid_accessory_slots = null

/obj/item/clothing/head/helmet/poxball/verb/Set_Team_Color()
	set name = "Set Team Color"
	if(!usr.canmove || usr.stat || usr.restrained()) return

	switch(alert("Select a color.", "Which team are you on?", "Red", "Blue", "Disable Team Color"))
		if("Red")
			icon_state = "poxball_helm_r"
			update_clothing_icon()
		if("Blue")
			icon_state = "poxball_helm_b"
			update_clothing_icon()
		if("Disable Team Color")
			icon_state = initial(icon_state)
			update_clothing_icon()

/obj/item/clothing/head/helmet/tinfoil
	name = "anti-tachyonite ray helmet"
	desc = "A helmet covered with aluminum foil. This will definitely protect from the rays emitted by the Great Taker's machines."
	icon_state = "tinfoil_helm"
	body_parts_covered = BLOCKHAIR
	siemens_coefficient = 0.6
	item_state_slots = list(slot_r_hand_str = "helmet", slot_l_hand_str = "helmet")
	armor = list(melee = 12, bullet = 5, laser = 5 ,energy = 5, bomb = 0, bio = 0, rad = 0)