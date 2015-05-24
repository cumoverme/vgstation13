//Mob_List located in global_lists.dm

/datum/controller/process/mob
	var/tmp/datum/updateQueue/updateQueueInstance
	schedule_interval = 20 // every 2 seconds

/datum/controller/process/mob/setup()
	name = "mob"
	updateQueueInstance = new

/datum/controller/process/mob/started()
	..()
	if(!updateQueueInstance)
		if(!mob_list)
			mob_list = list()
		else if(mob_list.len)
			updateQueueInstance = new

/datum/controller/process/mob/doWork()
	if(updateQueueInstance)
		updateQueueInstance.init(mob_list, "Life")
		updateQueueInstance.Run()
