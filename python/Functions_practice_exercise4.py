#  Functions practice Exercise 4 - HOTEL BILL

def hotel_bill(guest_name, nights, room_rate):
	subtotal = (nights) * (room_rate)
	tax = (subtotal) * 0.12
	total = (subtotal) + (tax)
	
	print("=" * 32)
	print("HOTEL BILL SUMMARY".center(32))
	print('=' * 32)
	print(f'\nGuest: {guest_name}')
	print(f'Nights: {nights}')
	print(f'Room Rate: ${room_rate:.2f}')
	print('-' * 32)
	print(f'Subtotal: ${subtotal:.2f}')
	print(f'Tax (12%): ${tax:.2f}')
	print(f'Total: ${total:.2f}')
	print("=" * 32)

hotel_bill('Rudy', 3, 150.00),
hotel_bill('Jack', 2, 125.00),
hotel_bill('Jill', 5, 135.00)
