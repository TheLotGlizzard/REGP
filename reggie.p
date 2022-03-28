###incase of employers looking into this project, Im actively working on this project in free time to work out specfic bugs and loops in security to ensure it operates efficiently and correctly.

###started with making a randomly generated password using english letter, number, and symbol list. then to creating a log that stores contextual information about the generated keychain. 'REGP - Randomly encrypted Generated password', then thought to install encryption and decryption for the generated 'REGP' file. added removal of specific 'temporary files' as a 'temporary file'. i wasnt able to get the tempfile module to work correctly. all in all it will generate a fernet key that will ask for the same specific key it generates at specified time.  
### this program relies on the "MYKEY.KEY" file that is created when you first encrypt, keep this key or you will not be able to decrypt or encrypt."
### to store newly generated keychains, first decrypt 'enc_REGP.txt', then proceed with generating new keychains, then you can "encrypt at end of program or run program again and encrypt with second option."

import random
import logging
import sys
import os
from time import sleep
from cryptography.fernet import Fernet




letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']
filename = 'REGP.txt'
encrypted_file = 'enc_REGP.txt'
decrypted_file = 'dec_REGP.txt'


def delay():
		sleep(1.3)
		return delay


delay()

print("Welcome to the PASSWORD GENERATOR!")

delay()


def encrypt_original():

	key = Fernet.generate_key()
	with open('mykey.key', 'wb') as mykey:
		mykey.write(key)

	with open('mykey.key', 'rb') as mykey:
		key = mykey.read()

	f = Fernet(key)

	with open('REGP.txt', 'rb') as original_file:
		original = original_file.read()

	encrypted = f.encrypt(original)	

	with open('enc_REGP.txt', 'wb') as encrypted_file:
		encrypted_file.write(encrypted)
		os.remove('REGP.txt')
		print('Goodbye')
		delay()
		sys.exit()


def update_encryption():
	
	with open('mykey.key', 'rb') as mykey:
		key = mykey.read()

	f = Fernet(key)

	with open('dec_REGP.txt', 'rb') as original_file:
		original = original_file.read()

	encrypted = f.encrypt(original)	

	with open('enc_REGP.txt', 'wb') as encrypted_file:
		encrypted_file.write(encrypted)
		os.remove('REGP.txt')
		os.remove('dec_REGP.txt')
		


def encryption():

	key = Fernet.generate_key()
	with open('mykey.key', 'wb') as mykey:
		mykey.write(key)

	with open('mykey.key', 'rb') as mykey:
		key = mykey.read()

	f = Fernet(key)

	with open('REGP.txt', 'rb') as original_file:
		original = original_file.read()

	encrypted = f.encrypt(original)	

	with open('enc_REGP.txt', 'wb') as encrypted_file:
		encrypted_file.write(encrypted)
		os.remove('REGP.txt')
		os.remove('dec_REGP.txt')



def decryption():

		with open('mykey.key', 'rb') as mykey:
			key = mykey.read()

		f = Fernet(key)

		with open('enc_REGP.txt', 'rb') as encrypted_file:
			encrypted = encrypted_file.read()

		decrypted = f.decrypt(encrypted)	

		with open('dec_REGP.txt', 'wb') as decrypted_file:
			decrypted_file.write(decrypted)
			print(f"Your decrypted file is generated as {decrypted_file}!")

			delay()
			os.remove('REGP.txt')
			os.remove('enc_REGP.txt')

		delay()
		
		sys.exit()



logging.basicConfig(filename = filename, level = logging.DEBUG)

def user_input():
		user_decrypt_choice = input("Are you wanting to decrypt a file? [y] [n]\n")
	
		if user_decrypt_choice == 'y':
			decryption()
		if user_decrypt_choice == 'n':
					user_update_choice = input("Would you like to update Encryption list? [y] [n]\n")
		else:
			print("Please only use 'y' 'n'")
			delay()
			sys.exit()


		if user_update_choice == 'y':
				update_encryption()
		if user_update_choice == 'n':	
				encrypt_REGP = input('Would you like to encrypt REGP.txt? [y] [n]\n')
			
				generate_keychain = input('Would you like to generate a keychain? [y] [n]\n')
		else:
				print("Please only use 'y' 'n'")
				delay()
				sys.exit()

		if encrypt_REGP == 'y':
			encrypt_original()
			if encrypt_REGP == 'n':
				generate_keychain = input('Would you like to generate a keychain? [y] [n]\n')

		if generate_keychain == 'y':
				user_description = str(input("What is this password for? \n"))
				user_letters= int(input("How many letters would you like in your password?\n"))
				user_symbols = int(input("How many symbols would you like?\n"))
				user_numbers = int(input("How many numbers would you like?\n"))
		if generate_keychain == 'n':
				print("Goodbye!")
				delay()
				sys.exit()

		def random_number():
					random_letter = (random.choices(letters, k = int(user_letters)))
					random_symbol = (random.choices(symbols, k = int(user_symbols)))
					random_integer = (random.choices(numbers, k = int(user_numbers)))
		
					shuffle_letter = random.sample(random_letter, int(user_letters))
					shuffle_symbol = random.sample(random_symbol, int(user_symbols))
					shuffle_integer = random.sample(random_integer, int(user_numbers))

					total_count = (user_letters + user_symbols + user_numbers)

					random_keychain = random.sample(shuffle_letter + shuffle_symbol + shuffle_integer, (total_count))
#####" '.join(list)' joins a list together and prints as string rather than multiple lists combined." below between '{str('')  add spaces between '' to seperate characters.
					user_encrypt_choice = input("Would you like to encrypt this file [y] [n]?\n")


					if user_encrypt_choice == 'y':
						logging.debug(user_description)
						logging.debug(f"Here is your keychain! {str(''.join(random_keychain))}")
						print(f"Your generated {filename} logfile has been deleted")
						print(f"Your Encrypted keychain file is now generated as! {encrypted_file}")
						print("Thanks for using REG.P!")
						encryption()

						delay()
						delay()

						sys.exit()
			
					if user_encrypt_choice == 'n':
							logging.debug(user_description)
							logging.debug(f"Here is your keychain! {str(''.join(random_keychain))}")
							print(f"Thanks for using EPG! your generated keychain is now stored in {filename}!")

							delay()
							delay()

							sys.exit()
		random_number()
user_input()
