import 'package:application_pokemon/pokemon.dart';
import 'package:application_pokemon/p_detalhe.dart';
import 'package:flutter/material.dart';

class PokemonsList extends StatelessWidget {
  final List<Dados> pokemons;

  const PokemonsList({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemCount: pokemons.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: _getColorForType(pokemons[index].type!.first),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PokemonDetail(pokemon: pokemons[index]),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(pokemons[index].img!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    pokemons[index].name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 200, 19, 224).withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                    ),
                  ),
                  child: Text(
                    pokemons[index].type!.join(", "),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 255, 247, 247),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getColorForType(String type) {
    switch (type) {
      case "Grass":
        return Color.fromARGB(255, 164, 211, 223);
      case "Fire":
        return Color.fromARGB(255, 235, 153, 172);
      case "Water":
        return Color.fromARGB(255, 159, 247, 246);
      case "Electric":
        return Color.fromARGB(255, 102, 107, 63);
      case "Bug":
        return const Color.fromARGB(255, 219, 231, 112);
      case "Normal":
        return Color.fromARGB(255, 237, 175, 153);
      case "Flying":
        return const Color.fromARGB(255, 107, 177, 209);
      case "Poison":
        return Color.fromARGB(255, 228, 181, 236);
      case "Rock":
        return const Color.fromARGB(255, 143, 127, 127);
      case "Ground":
        return Color.fromARGB(255, 215, 212, 208);
      case "Fighting":
        return Color.fromARGB(255, 248, 156, 210);
      case "Psychic":
        return Color.fromARGB(255, 228, 26, 93);
      case "Ghost":
        return const Color.fromARGB(255, 89, 102, 180);
      case "Ice":
        return Color.fromARGB(255, 115, 124, 126);
      case "Dragon":
        return const Color.fromARGB(255, 89, 102, 180);
      case "Dark":
        return Colors.black;
      case "Steel":
        return const Color.fromARGB(255, 99, 123, 134);
      case "Fairy":
        return const Color.fromARGB(255, 197, 84, 121);
      default:
        return Color.fromARGB(255, 11, 10, 10);
    }
  }
}
