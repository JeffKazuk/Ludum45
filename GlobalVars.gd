extends Node
export var pop_fly_done = false
export var mail_done = false
export var race_done = false
export var borgers_done = false
export var grocery_done = false

export var mail_started = false
export var mail_deliveries = {"HouseMailBox": false, "GroceryMailBox": false, "BorgerShackMailBox": false, "ChefShackMailBox": false, "House2MailBox": false}

export var race_attempted = false
export var grocery_attempted = false

func todo():
    var todo = ""
    if not pop_fly_done:
        todo += "pop_fly_done "
    if not mail_done:
        todo += "mail_done "
    if not race_done:
        todo += "race_done "
    if not borgers_done:
        todo += "borgers_done "
    if not grocery_done:
        todo += "grocery_done "
    return todo

func isdone():
	return pop_fly_done&&mail_done&&race_done&&borgers_done&&grocery_done
		