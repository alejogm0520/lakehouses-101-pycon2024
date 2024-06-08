import json
import requests
from pathlib import Path

pokemon_list = requests.get("https://pokeapi.co/api/v2/pokemon?limit=-1").json()

Path("./data/pokemon/").mkdir(parents=True, exist_ok=True)


for i in pokemon_list["results"]:
    pokemon = requests.get(i["url"]).json()
    with open(f"data/pokemon/{i['name']}.json", "w") as f:
        json.dump(pokemon, f)

move_list = requests.get("https://pokeapi.co/api/v2/move?limit=-1").json()

Path("./data/moves/").mkdir(parents=True, exist_ok=True)

for i in move_list["results"]:
    move = requests.get(i["url"]).json()
    with open(f"data/moves/{i['name']}.json", "w") as f:
        json.dump(move, f)

type_list = requests.get("https://pokeapi.co/api/v2/type?limit=-1").json()

Path("./data/types/").mkdir(parents=True, exist_ok=True)

for i in type_list["results"]:
    type_ = requests.get(i["url"]).json()
    with open(f"data/types/{i['name']}.json", "w") as f:
        json.dump(type_, f)
