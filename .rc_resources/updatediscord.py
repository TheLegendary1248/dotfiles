import json, sys
with open(sys.argv[1], 'r+') as file:
    obj = json.load(file)
    obj["version"] = sys.argv[2]
    print("Updating version number to:", sys.argv[2])
    file.seek(0)
    file.truncate(0)
    json.dump(obj,file)
