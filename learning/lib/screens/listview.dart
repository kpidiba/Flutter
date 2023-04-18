import 'package:flutter/material.dart';

class ListV extends StatelessWidget {
  const ListV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LISTVIEW")),
      body: Container(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(Icons.add),
            ),
            Divider(color: Colors.red),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                  style: TextStyle(fontSize: 20),
                  "Nisi ullamco non amet excepteur nostrud non do in consectetur ut duis ut anim. Do cupidatat id minim eiusmod laboris veniam fugiat. Cillum ipsum aliquip mollit ex eiusmod aute eiusmod in eiusmod irure irure esse labore.Id irure irure nisi mollit ipsum anim ea pariatur velit. Pariatur deserunt laborum commodo aliqua enim nulla enim. Irure ad deserunt aute magna velit voluptate. Voluptate est velit duis ad fugiat labore laboris in exercitation aliqua ex consectetur deserunt. Sit id cillum dolor nulla voluptate pariatur pariatur ullamco laboris. Nisi consectetur excepteur duis tempor veniam eu pariatur in.Est est anim enim commodo amet reprehenderit amet voluptate ea tempor fugiat velit labore. Fugiat ullamco ex incididunt voluptate pariatur sunt esse velit dolor est. Irure nostrud aute magna incididunt ut nostrud cillum in aliqua exercitation. Reprehenderit occaecat sunt irure et nulla cillum id tempor occaecat velit et. Excepteur occaecat eu ipsum culpa est ipsum consequat minim tempor.Ipsum exercitation officia aute velit incididunt cupidatat quis et cupidatat cupidatat mollit tempor. Lorem cillum ullamco est eiusmod in ipsum ut deserunt occaecat sunt quis aute nostrud et. Ullamco cupidatat sunt voluptate laboris veniam id Lorem aliquip fugiat. Culpa est laboris ullamco velit amet deserunt eu pariatur voluptate minim. Irure ut Lorem ex enim anim Lorem consequat duis magna ut. Esse laboris ea ipsum aute do reprehenderit voluptate occaecat reprehenderit aute ex ad ipsum. Culpa sit irure labore amet consequat aliquip proident commodo excepteur laborum id do incididunt do. Incididunt aute esse qui culpa est Lorem laboris. Exercitation aliquip commodo consequat incididunt nulla minim ipsum minim tempor eiusmod laborum voluptate. Laborum cupidatat incididunt irure ad dolore tempor. Tempor ex do voluptate aliquip id.Sit mollit deserunt laborum nisi non. Sunt quis ea incididunt occaecat quis. Ullamco anim et ullamco magna eiusmod consequat esse mollit aute occaecat voluptate. Veniam sit qui labore reprehenderit commodo dolore quis eu. Duis culpa aute tempor reprehenderit exercitation. Nisi deserunt mollit consectetur occaecat sunt qui ipsum veniam ex elit quis laborum voluptate. Laborum consectetur est nostrud commodo ex. Aute ex cupidatat ad anim dolor irure nostrud duis enim amet nostrud occaecat sint deserunt. Voluptate ea do nulla veniam aliqua Lorem sit velit excepteur. Do officia do consequat velit aliqua reprehenderit exercitation sint pariatur cillum cupidatat consectetur eu. Adipisicing id elit quis excepteur mollit eu id elit ullamco. Eu mollit exercitation aliquip laboris ad aliqua ipsum ea. Aliqua eiusmod deserunt Lorem in do ad nulla. Nulla veniam exercitation reprehenderit dolore ex dolor proident officia culpa cillum anim excepteur aute excepteur. Sint ex do Lorem eiusmod ut proident. Esse aliquip nulla quis qui exercitation consequat consectetur dolor culpa reprehenderit voluptate excepteur cupidatat duis. Sunt ut ipsum velit id. Incididunt excepteur laboris ut culpa veniam exercitation proident et laborum occaecat pariatur ea cupidatat cupidatat. Voluptate aute eiusmod id ex dolor proident elit anim non est nulla voluptate. Consectetur cupidatat duis eu magna consequat dolore et nulla aliqua dolore tempor ipsum consequat in. Eiusmod proident reprehenderit nostrud laboris duis et irure reprehenderit. Culpa id labore consequat ea laboris id in commodo labore. Nostrud non ipsum ullamco occaecat duis Lorem. Occaecat pariatur culpa duis fugiat aliquip.Aliquip est Lorem mollit ut irure magna laborum reprehenderit ipsum elit nulla culpa exercitation. Qui sint ut anim do sit exercitation velit nostrud cillum sint consectetur. Qui laborum enim sit irure pariatur minim veniam. Duis ut et culpa ex irure anim exercitation occaecat laborum voluptate elit. Labore ad qui sunt veniam quis incididunt esse cupidatat fugiat nostrud ea officia laborum dolor. Reprehenderit exercitation proident dolor aliquip nisi exercitation amet aute magna et."),
            )
          ],
        ),
      ),
    );
  }
}

class ListVB extends StatelessWidget {
   ListVB({super.key});
  List<String> products = ['hello', 'what ', 'up'];
  List<int> price = [200, 300, 400, 400, 500];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Man with a mission",style: TextStyle(fontSize: 30),)),
        body: Container(
          child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Text(products[index],style: const TextStyle(fontSize: 30),);
              }),
        ));
  }
}
