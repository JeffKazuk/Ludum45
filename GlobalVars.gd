extends Node
export var pop_fly_done = false
export var mail_done = false
export var race_done = false
export var borgers_done = false
export var grocery_done = false

export var mail_started = false

export var mail_deliveries = {"HouseMailBox": false, "GroceryMailBox": false, "BorgerShackMailBox": false, "ChefShackMailBox": false, "House2MailBox": false}

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