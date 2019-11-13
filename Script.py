import pymysql
import pymysql.cursors
from tabulate import tabulate


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
        sql = "INSERT INTO Students (`roll_no`, `First_name`, `Middle_name`, `Last_name`, `Age`, `Phone_number`, `Monthly_registered_mess`) VALUES ({}, '{}', '{}', '{}', {}, '{}', {});".format(
            roll_no, first_name, middle_name, last_name, age, ph, rm)
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
    try:
        name = input("Food Item name: ")
        menu = int(input("Menu ID: "))

        sql = "INSERT INTO Food_items (`Menu_id`, `Name`) VALUES ({}, '{}');".format(menu, name)
        cur = connection.cursor()
        cur.execute(sql)
        sql = "SELECT Food_id FROM Food_items WHERE Menu_id = {} AND Name = '{}';".format(menu, name)
        cur = connection.cursor()
        cur.execute(sql)
        food_id = cur.fetchall()[0]['Food_id']
        # print(food_id)

        sql = "SELECT * FROM Ingredients;"
        cur = connection.cursor()
        cur.execute(sql)
        print("Available Ingredients: ")
        printAsTable(cur.fetchall())

        while(1):
            choice = int(input("Enter ingredient id to be added to the food item (-1 to stop adding): "))
            if choice == -1:
                break
            quantity = int(input("Quantity: "))
            sql = "INSERT INTO Food_item_ingredients_requirements (`Quantity`, `Food_item_id`, `ingredient_id`) VALUES ({}, {}, {});".format(quantity, food_id, choice)
            cur = connection.cursor()
            cur.execute(sql)


        # sql = "INSERT INTO Ingredients (`Name`, `Cost`) VALUES ('{}', {});".format(name, cost)
        # cur = connection.cursor()
        # cur.execute(sql)
        connection.commit()
        # print("Successfully added new ingredient")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)
        exit()



def newIngredient():
    try:
        name = input("Ingredient name: ")
        cost = int(input("Cost: "))
        sql = "INSERT INTO Ingredients (`Name`, `Cost`) VALUES ('{}', {});".format(name, cost)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully added new ingredient")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)



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
    try:
        print("Changing mess registration")
        mess_id = int(input("Registered Mess ID: "))
        student_id = int(input("Student ID: "))
        meal_id = int(input("Meal ID: "))
        # noinspection SqlNoDataSourceInspection
        sql = "SELECT * FROM registration WHERE student_id = {} AND meal_id = {};".format(student_id, meal_id)
        cur = connection.cursor()
        cur.execute(sql)
        # connection.commit()
        if cur.rowcount == 1:
            # noinspection SqlNoDataSourceInspection
            sql = "UPDATE registration SET registered_mess_id = {} WHERE student_id = {} AND meal_id = {};".format(mess_id, student_id, meal_id)
        else:
            # noinspection SqlNoDataSourceInspection
            sql = "INSERT INTO registration (`registered_mess_id`, `student_id`, `meal_id`) VALUES ({}, {}, {})".format(mess_id, student_id, meal_id)
        cur.execute(sql)
        connection.commit()

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def changeEmplyeeSalary():
    try:
        print("Changing employee salary")
        emp_id = int(input("Employee ID: "))
        new_salary = int(input("New Salary: "))
        # noinspection SqlNoDataSourceInspection
        sql = "UPDATE employee SET Salary = {} WHERE Employee_id = {};".format(new_salary, emp_id)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully updated salary")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)


def deleteFoodItem():
    try:
        print("Deleting food item")
        food_id = int(input("Food ID: "))
        # noinspection SqlNoDataSourceInspection
        sql = "DELETE FROM food_items WHERE Food_id = {}".format(food_id)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully deleted food item")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)



def removeStudent():
    try:
        print("Deleting student")
        student_id = int(input("Student ID: "))
        # noinspection SqlNoDataSourceInspection
        sql = "DELETE FROM students WHERE roll_no = {}".format(student_id)
        cur = connection.cursor()
        cur.execute(sql)
        connection.commit()
        print("Successfully deleted student")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)



def requiredIngredients():
    '''
    for all the meals of a day, from all messes, ingredients and quantity required for all their food items
    '''
    try:
        print("Printing required ingredients for the day")
        day = input("Day: ")
        # noinspection SqlNoDataSourceInspection
        sql = """SELECT ingredients.Name, SUM(food_item_ingredients_requirements.Quantity) AS Qty, 
            SUM(food_item_ingredients_requirements.Quantity) * ingredients.Cost AS Total_cost 
            FROM food_item_ingredients_requirements, ingredients 
            WHERE food_item_ingredients_requirements.Food_item_id IN 
            (SELECT Food_id FROM food_items WHERE Menu_id IN 
            (SELECT Menu_id FROM menu WHERE menu.meal_id IN 
            (SELECT meal_id FROM meal WHERE day='{}'))) 
            AND ingredients.Ingredients_id = food_item_ingredients_requirements.ingredient_id 
            GROUP BY ingredient_id;""".format(day)
        cur = connection.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
        desc = cur.description

        print("{0:>20} {1:>20} {2:>20}".format(desc[0][0], desc[1][0], desc[2][0]))

        for row in rows:
            print("{0:>20} {1:>20} {2:>20}".format(row['Name'], row['Qty'], row['Total_cost']))

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)



def messMenu():
    try:
        print("Displaying mess menu")
        mess_id = int(input("Mess ID: "))
        day = str(input("Day: "))
        time = str(input("Time: "))
        # noinspection SqlNoDataSourceInspection
        sql = "SELECT Name FROM Food_items WHERE Menu_id IN (SELECT Menu_id FROM Menu, (SELECT Meal_id FROM Meal WHERE Day = '{}' AND Time = '{}') A WHERE Mess_id = {} AND Menu.Meal_id = A.Meal_id);".format(day, time, mess_id)
        cur = connection.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
        desc = cur.description

        print("{0:>20}".format(desc[0][0]))

        for row in rows:
            print("{0:>20}".format(row['Name']))
        print("Displayed Mess Menu")

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)


def sortMeal():
    '''
    for a mess sort all the meals based on card swipes
    '''
    try:
        print("Printing popular meals in a mess")
        mess = input("Mess ID: ")
        # noinspection SqlNoDataSourceInspection
        sql = "SELECT meal.Day AS Day, meal.Time AS Time, COUNT(card_swipes.swipe_id) AS Students FROM meal, card_swipes WHERE card_swipes.Mess_id = {} AND meal.Meal_id = card_swipes.Meal_id GROUP BY meal.meal_id ORDER BY COUNT(card_swipes.swipe_id) DESC;".format(mess)
        cur = connection.cursor()
        cur.execute(sql)
        rows = cur.fetchall()
        desc = cur.description

        print("{0:>20} {1:>20} {2:>20}".format(desc[0][0], desc[1][0], desc[2][0]))

        for row in rows:
            print("{0:>20} {1:>20} {2:>20}".format(row['Day'], row['Time'], row['Students']))

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)
    pass


def generate_and_update_revenue():
    '''
    for a day (today) generate all the revenues and cost and expected revenue
    '''
    try:
        day = int(input("Day(1-7): "))
        sql = "SELECT * FROM Mess;"
        cur = connection.cursor()
        cur.execute(sql)
        print("Messes: ")
        all = cur.fetchall()
        printAsTable(all)
        for mess in all:
            id = mess['Mess_id']
            name = mess['Name']


    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)
        exit()


def registered_student_list():
    try:
        mess = int(input("Mess Id: "))
        meal = int(input("Meal Id: "))
        cur = connection.cursor()
        # sql = "SELECT student_id FROM Registration WHERE (registered_mess_id = {})AND(meal_id = {});".format(mess,meal)
        sql = "SELECT roll_no, First_name, Last_name FROM Students WHERE roll_no IN(SELECT student_id FROM Registration WHERE (registered_mess_id = {})AND(meal_id = {}));".format(mess,meal)
        # sql = "SELECT (roll_no, First_name, Last_name) FROM Students WHERE roll_no IN(SELECT student_id FROM Registration WHERE (registered_mess_id = {})AND(meal_id = {}));".format(mess,meal)
        # print("lol")
        cur.execute(sql)
        # print("lol")
        all = cur.fetchall()
        printAsTable(all)

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)


def printAsTable(row_list):
    if len(row_list):
        first = row_list[0]
        headers = first.keys()
        data=[]
        for row in row_list:
            newData = []
            for col in headers:
                newData.append(row[col])
            data.append(newData)
        print()
        print(tabulate(data,headers=headers))
    else:
        print("EMPTY!")

def view():
    try:
        cur = connection.cursor()
        sql = "SHOW TABLES;"
        cur.execute(sql)
        all = cur.fetchall()
        print("AVAILABLE TABLES: ")
        for i, table in enumerate(all):
            print("{}. {}".format(i+1, table["Tables_in_{}".format(Database_name)]))
        table_no = int(input("Enter table number: "))-1
        cur = connection.cursor()
        sql = "DESCRIBE {};".format(all[table_no]["Tables_in_{}".format(Database_name)])
        cur.execute(sql)
        columns = cur.fetchall()
        headers = []
        for field in columns:
            headers.append(field["Field"])
        cur = connection.cursor()
        sql = "SELECT * FROM {};".format(all[table_no]["Tables_in_{}".format(Database_name)])
        cur.execute(sql)
        all = cur.fetchall()
        data = []
        for row in all:
            new_row = []
            for col in headers:
                new_row.append(row[col])
            data.append(new_row)
        print("")
        print(tabulate(data, headers=headers))

    except Exception as e:
        connection.rollback()
        print("Error!!")
        print(e)

def logout():
    connection.close()
    print("Closed the database")
    exit()


username = "istasis"
password = "ista2000"
Database_name = "mess_database"
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
options.append(["Registered Student List", registered_student_list])
options.append(["View any table", view])
options.append(["Logout", logout])

try:
    connection = pymysql.connect(host='localhost',
                                 user=username,
                                 password=password,
                                 db=Database_name,
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
