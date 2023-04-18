import 'package:flutter/material.dart';

class Rowcol extends StatelessWidget {
  const Rowcol({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Row Column")),
        body: Container(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Expanded(
                  child: Image(
                    image: AssetImage("images/image.png"),
                    width: 200,
                    height: 200,
                  ),
                ),
                // NOTE:WITH FLEX IL VA AVOIR PLUS D' ESPACE
                Expanded(
                  flex: 3,
                  child: Image(
                    image: AssetImage("images/image.png"),
                    width: 200,
                    height: 200,
                  ),
                ),
                Expanded(
                  child: Image(
                    image: AssetImage("images/image.png"),
                    width: 200,
                    height: 200,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_half),
                Icon(Icons.star_border)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(
                  Icons.phone,
                  size: 50,
                ),
                Icon(
                  Icons.share,
                  size: 50,
                )
              ],
            )
          ],
        )
        )
        );
  }
}
