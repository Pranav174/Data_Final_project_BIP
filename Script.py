import pymysql
import pymysql.cursors

def newStudent():
    try:
        print("Adding New Student")
        roll_no = int(input("Roll Number: "))
        first_name = input("First Name: ")
        middle_name = input("Middle Name: ")
        last_name = input("Last Name: ")
        age = int(input("Age: "))
        ph = input("Phone number: ")
        rm = int(input("Registered Mess: "))
        # noinspection SqlNoDataSourceInspection
        sql = "INSERT INTO Students (`roll_no`, `First_name`, `Middle_name`, `Last_name`, `Age`, `Phone_number`, `Monthly_registered_mess`) VALUES ({}, '{}', '{}', '{}', {}, '{}', {});".format(roll_no, first_name,middle_name,last_name,age,ph,rm)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully added new student")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def newSwipeEntry():
    try:
        print("Adding New Swipe entry")
        student_id = int(input("Student ID: "))
        mess_id = int(input("Mess ID: "))
        meal_id = int(input("Meal ID: "))
        registered_mess = int(input("Registered Mess ID: "))
        # noinspection SqlNoDataSourceInspection
        sql = "INSERT INTO card_swipes (`Student_id`, `Mess_id`, `Meal_id`, `Registered_mess`) VALUES ({}, '{}', '{}', '{}');".format(student_id, mess_id, meal_id, registered_mess)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully added new swipe entry")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def newFoodItem():
    '''
    with ingredients and their quantity
    '''
    pass

def newIngredient():
    pass

def changeMealPrice():
    try:
        print("Changing meal price")
        mess_id = int(input("Mess ID: "))
        meal_id = int(input("Meal ID: "))
        new_price = int(input("New Price: "))
        # noinspection SqlNoDataSourceInspection
        sql = "UPDATE menu SET Price = {} WHERE Mess_id = {} and Meal_id = {};".format(new_price, mess_id, meal_id)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully updated price")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def changeIngredientPrice():
    try:
        print("Changing ingredient price")
        ingredient_id = int(input("Ingredient ID: "))
        new_price = int(input("New Price: "))
        # noinspection SqlNoDataSourceInspection
        sql = "UPDATE ingredients SET Cost = {} WHERE Ingredients_id = {};".format(new_price, ingredient_id)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully updated price")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def add_change_registered_mess():

    pass

def changeEmplyeeSalary():
    pass

def deleteFoodItem():
    pass

def removeStudent():
    pass

def requiredIngredients():
    '''
    for all the meals of a day, from all messes, ingredients and quantity required for all their food items
    '''
    pass

def messMenu():
    pass

def sortMeal():
    '''
    for a mess sort all the meals based on card swipes
    '''
    pass

def generate_and_update_revenue():
    '''
    for a day (today) generate all the revenues and cost and expected revenue
    '''
    pass

def registered_student_list():
    '''
    registered students in a mess
    '''
    pass

def view():
    pass

def logout():
    connection.close()
    print("Closed the database")
    exit()

username = "istasis"
password = "ista2000"

# username = input("Username: ")
# password = input("Password: ")

options = []
options.append(["Add New student", newStudent])
options.append(["Add New swipe entry", newSwipeEntry])
options.append(["Add New food item", newFoodItem])
options.append(["Add New ingredient", newIngredient])
options.append(["Change meal price", changeMealPrice])
options.append(["Change ingredient price", changeIngredientPrice])
options.append(["Add or change registered mess", add_change_registered_mess])
options.append(["Change employee salary", changeEmplyeeSalary])
options.append(["Delete food item", deleteFoodItem])
options.append(["Remove student", removeStudent])
options.append(["View required ingredients", requiredIngredients])
options.append(["View mess menu", messMenu])
options.append(["View meal in sorted order", sortMeal])
options.append(["Generate or update revenue", generate_and_update_revenue])
options.append(["View any table", view])
options.append(["Logout", logout])

try:
    connection = pymysql.connect(host='localhost',
                                 user=username,
                                 password=password,
                                 db='mess_database',
                                 cursorclass=pymysql.cursors.DictCursor)
    print("Accessed Database Successfully")
    while(1):
        print("")
        print("Choose among these")
        for i, option in enumerate(options):
            print("{} >>> {}".format(i+1, option[0]))
        choice = input("choice: ")
        choice = int(choice)
        if choice >= 1 and choice <= len(options):
            print("")
            options[choice-1][1]()
        else:
            print("Invalid choice")

except Exception as e:
    print(e)


