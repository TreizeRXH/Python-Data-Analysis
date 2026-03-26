def test(first_name, last_name, birthday_month):
    if birthday_month == 'April':
        print(f'Hi {first_name} {last_name}, your {birthday_month} sign is Aries')
    elif birthday_month == 'December':
        print(f'Hi {first_name} {last_name}, your {birthday_month} sign is Sagie')
    else: 
        print(f"Hi {first_name} {last_name}, I am sorry but we haven't yet updated this to account for your birthday")


test('Rudy', 'Hernandez', 'April')
test('Cassandra', 'Bellino', 'December')
test('Jack', 'Black', 'March')