from hashlib import sha1
import random, string


def generate_random_alphanum_str(length: int) -> str:
    s = ""
    for _ in range(length):
        s += random.SystemRandom().choice(string.ascii_uppercase +
                                          string.digits)
    return s


def double_hash(code: str) -> str:
    hash = sha1(code.encode("UTF-8")).hexdigest()
    hash = sha1(hash.encode("UTF-8")).hexdigest()
    return hash


def keygen(registration_code: str, computer_id: str) -> str:
    registration_hash = double_hash(registration_code)
    computer_hash = double_hash(computer_id[:-4])
    combined_hash = ""
    for i in range(len(registration_hash)):
        combined_hash += registration_hash[i] + computer_hash[i]
    combined_hash = sha1(combined_hash.encode("UTF-8")).hexdigest()
    return combined_hash.upper() + generate_random_alphanum_str(10)


def main():
    s = "Master PDF Editor 5.x Keygen [by n0k0m3, originally by RadiXX11]"
    print(s)
    print("=" * len(s))
    print()
    format_style = "{:<20}: "
    computer_id = input(format_style.format("Computer ID"))
    if len(computer_id) != 40:
        print(
            "[ERROR] Computer ID must be a 40 character string, including \"-\""
        )
        return
    registration_code = generate_random_alphanum_str(18)
    # registration_code = "VVMX5PHFFS6T6MAM76"
    activation_code = keygen(registration_code, computer_id)
    print(format_style.format("Registration Code") + registration_code)
    print(format_style.format("Activation Code") + activation_code)
    print()


if __name__ == "__main__":
    main()
