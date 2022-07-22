import sys

INSTRUCTION_SET = [
    "MOVI", "ADD", "NEG", "JZR",
    "MOV", "MUL", "DIV", "MOD",
    "IN", "CMP", "HALT", "JO",
    "JS", "JINT", "INC", "DEC"
]
INSTRUCTION_MACHINE_CODE = [
    "0010", "0000", "0001", "0011",
    "0100", "0101", "0110", "0111",
    "1000", "1001", "1010", "1011",
    "1100", "1101", "1110", "1111"
]

MAPPING = dict(zip(INSTRUCTION_SET, INSTRUCTION_MACHINE_CODE))


def hex_to_bin(hex_value: str, bit_length: int) -> str:
    '''Convert hex number to binary padded with zeros according 
    to the bit length'''
    return bin(int(hex_value, 16))[2:].zfill(bit_length)


def valid_address(addr: str):
    if (int(addr, 16) >= 32):
        raise Exception(f"Address {addr} is invalid.")


def valid_register(reg: str):
    if (int(reg, 16) >= 8):
        raise Exception(f"Address {reg} is invalid.")


if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("Enter input file name")
        quit()

    # Input file name is second argument
    input_file_name = sys.argv[1]
    # Output file as .txt with same name as input file
    output_file_name = input_file_name.split('.')[0] + ".txt"

    instructions = []
    with open(input_file_name, "r") as f:
        for line in f.readlines():
            # Remove comments
            pos = line.find(";")
            if (pos != -1):
                line = line[:pos]

            # Append line if not empty contains just whitespace
            if (line.strip()):
                instructions.append(line.strip())
    # Separate operator and operands
    instructions = [x.split() for x in instructions]

    # Create hash map
    instruction_map = dict()
    for instruction in instructions:
        if instruction[0] not in INSTRUCTION_SET:
            raise Exception(f"{instruction[0]} is not a valid instruction.")

        instruction_map[instruction[0]] = tuple(instruction[1:])

    # Parsing Operands
    machine_codes = []
    for operator, operands in instruction_map.items():
        operand_code = ""
        for operand in operands:
            # Register
            if "R" in operand:
                valid_register(operand[1])
                operand_code += hex_to_bin(operand[1], 3)

        # Operand codes
        if operator == "MOVI":
            operand_code += "0" + hex_to_bin(operands[1], 8)
        elif operator in ["ADD", "MOV", "MUL", "DIV", "MOD", "CMP"]:
            operand_code += "0" * 6
        elif operator in ["INC", "DEC", "NEG"]:
            operand_code += "0" * 9
        elif operator == "JZR":
            valid_address(operands[1])
            operand_code += "0" * 4 + hex_to_bin(operands[1], 5)
        elif operator in ["JS", "JO", "JINT"]:
            valid_address(operands[1])
            operand_code += "0" * 7 + hex_to_bin(operands[0], 5)
        elif operator == "IN":
            operand_code += "0" * 8 + hex_to_bin(operands[1], 1)
        elif operator == "HALT":
            operand_code += "0" * 12

        machine_codes.append(MAPPING[operator] + operand_code)

    print(*machine_codes, sep='\n')
