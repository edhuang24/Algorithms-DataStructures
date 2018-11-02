import os

def rename_files():
    file_list = os.listdir("/Users/ehuang/Desktop/Algorithms-DataStructures/python_practice/prank")
    # print(file_list)
    saved_path = os.getcwd()
    # print(saved_path)
    os.chdir("/Users/ehuang/Desktop/Algorithms-DataStructures/python_practice/prank")

    for file_name in file_list:
        print("Old Name - "+file_name)
        print("New Name - "+file_name.translate(None, "0123456789"))
        # os.rename(file_name, file_name[2:])
        os.rename(file_name, file_name.translate(None, "0123456789"))
    os.chdir(saved_path)

rename_files()
