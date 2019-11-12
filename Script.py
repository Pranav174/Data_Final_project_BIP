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
    pass


def newFoodItem():
    '''
    with ingredients and their quantity
    '''
    pass


def newIngredient():
    pass


def changeMealPrice():
    pass


def changeIngredientPrice():
    pass


def add_change_registered_mess():
    # should take meal and mess and student
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
    try:
        cur = connection.cursor()
        sql = "SHOW TABLES;"
        cur.execute(sql)
        all = cur.fetchall()
        print("AVAILABLE TABLES: ")
        for i, table in enumerate(all):
            print("{}. {}".format(i+1, table["Tables_in_MESS_DATABASE"]))
        table_no = int(input("Enter table number: "))-1
        cur = connection.cursor()
        sql = "DESCRIBE {};".format(all[table_no]["Tables_in_MESS_DATABASE"])
        cur.execute(sql)
        columns = cur.fetchall()
        headers = []
        for field in columns:
            headers.append(field["Field"])
        cur = connection.cursor()
        sql = "SELECT * FROM {};".format(all[table_no]["Tables_in_MESS_DATABASE"])
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
    pass


def logout():
    connection.close()
    print("Closed the database")
    exit()


username = "BIP"
password = "BIP"

# username = input("Username: ")
# password = input("Password: ")

options = []
options.append(["Add New student", newStudent])
options.append(["Add New student", newSwipeEntry])
options.append(["Add New student", newFoodItem])
options.append(["Add New student", newIngredient])
options.append(["Add New student", changeMealPrice])
options.append(["Add New student", changeIngredientPrice])
options.append(["Add New student", add_change_registered_mess])
options.append(["Add New student", changeEmplyeeSalary])
options.append(["Add New student", deleteFoodItem])
options.append(["Add New student", removeStudent])
options.append(["Add New student", requiredIngredients])
options.append(["Add New student", messMenu])
options.append(["Add New student", sortMeal])
options.append(["Add New student", generate_and_update_revenue])
options.append(["Add New student", view])
options.append(["Logout", logout])


try:
    connection = pymysql.connect(host='localhost',
                                 user=username,
                                 password=password,
                                 db='MESS_DATABASE',
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
