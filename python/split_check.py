import math

def split_check(total, number_of_people):
    if number_of_people <= 1:
        raise ValueError("More than 1 person is required to split the check") #exception code is run
    return math.ceil(total / number_of_people)

try:
    total_due = float(input("What is the total? "))
    number_of_people = int(input("How many people? "))
    amount_due = split_check(total_due, number_of_people)
except ValueError as err: # The err variable will be created and assigned the error that was thrown
    print("Oh no! That's not a valid value. Try again...")
    print("({})".format(err))
else: # if there's no exception, run this
    print("Each person owes ${}".format(amount_due))