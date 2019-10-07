extends Node
export var pop_fly_done = false
export var mail_done = false
export var race_done = false
export var borgers_done = false
export var grocery_done = false
export var intro_done = false
export var mail_started = false
export var mail_deliveries = {"HouseMailBox": false, "GroceryMailBox": false, "BorgerShackMailBox": false, "ChefShackMailBox": false, "House2MailBox": false}

export var race_attempted = false
export var grocery_attempted = false
export var pop_fly_attempted = false
export var borgors_attempted = false

export var dopop = 0
export var domail = 0
export var dorace = 0
export var doborgers = 0
export var doveg = 0

func todo():
	if not pop_fly_done:
		dopop=0
	else: 
		dopop = 1
	if not mail_done:
		domail = 0
	else: 
		domail = 1
	if not race_done:
		dorace =0
	else: dorace = 1
	if not borgers_done:
		dorace = 0
	else: 
		dorace = 1
	if not grocery_done:
		dorace = 0
	else:
		dorace = 1

func isdone():
	print("NoU")
	return pop_fly_done&&mail_done&&race_done&&borgers_done&&grocery_done
		