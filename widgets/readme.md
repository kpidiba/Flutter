The most notable difference is that **StatelessWidget** is immutable and cannot change its appearance or behavior after it is built, whereas **StatefulWidget** is mutable and can dynamically update its UI during runtime.

=======================================================================

# Flutter — Bases : Widgets essentiels

## 1. `StatelessWidget` / `StatefulWidget`

### `StatelessWidget`

Widget **sans état interne qui change**.

```dart
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text('Hello');
  }
}
```

**Use when:** l'interface dépend uniquement de données externes/fixes.

### `StatefulWidget`

Widget avec un **état qui peut changer**.

```dart
class Counter extends StatefulWidget {
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Text('$count');
  }
}
```

**Use when:** formulaire, compteur, sélection, animation, loading, etc.

---

## 2. `Scaffold`

Structure principale d'un écran Material.

```dart
Scaffold(
  appBar: AppBar(title: const Text('Home')),
  body: const Text('Content'),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
)
```

**Use for:** `AppBar`, `body`, `Drawer`, `BottomNavigationBar`, FAB, etc.

---

## 3. `Column` / `Row`

### `Column`

Place les widgets **verticalement**.

```dart
Column(
  children: [
    Text('Name'),
    Text('Email'),
    Button(),
  ],
)
```

### `Row`

Place les widgets **horizontalement**.

```dart
Row(
  children: [
    Icon(Icons.person),
    Text('David'),
  ],
)
```

**Use when:** construire rapidement un layout vertical/horizontal.

---

## 4. `Container`

Widget polyvalent pour **décoration, taille et espacement**.

```dart
Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Text('Hello'),
)
```

**Use when:** tu as besoin de `padding`, `margin`, `color`, `decoration`, `width`, `height`, etc.

> Ne pas utiliser `Container` partout : utilise `Padding`, `SizedBox`, etc. quand ils suffisent.

---

## 5. `ListView`

Affiche une liste **scrollable**.

```dart
ListView(
  children: [
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

Pour beaucoup d'éléments :

```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Text(items[index]);
  },
)
```

**Use when:** listes, résultats API, produits, messages, notifications, etc.

---

## 6. `Form`

Regroupe et valide plusieurs champs.

```dart
Form(
  key: formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    ],
  ),
)
```

**Use when:** login, inscription, création/modification de données.

---

## 7. `TextField` / `TextFormField`

Permet à l'utilisateur de saisir du texte.

```dart
TextField(
  controller: controller,
  decoration: const InputDecoration(
    labelText: 'Email',
  ),
)
```

**Use:** recherche, saisie simple.

**`TextFormField` :** préférable dans un `Form` lorsqu'une validation est nécessaire.

---

## 8. Buttons

Exemples Material :

```dart
ElevatedButton(
  onPressed: () {},
  child: const Text('Save'),
)
```

```dart
TextButton(
  onPressed: () {},
  child: const Text('Cancel'),
)
```

```dart
IconButton(
  onPressed: () {},
  icon: const Icon(Icons.delete),
)
```

**Use:** déclencher une action utilisateur.

- `ElevatedButton` → action principale

- `TextButton` → action secondaire

- `OutlinedButton` → action avec bordure

- `IconButton` → action représentée par une icône

---

## 9. Navigation entre écrans

### Aller vers un écran

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => const DetailsPage(),
  ),
);
```

### Revenir

```dart
Navigator.pop(context);
```

**Use when:** passer d'un écran à un autre.

Pour une application importante, utilise généralement un **routeur** comme `go_router` plutôt que de gérer toute la navigation avec `Navigator.push`.

---

## 10. `BuildContext`

`BuildContext` représente la **position d'un widget dans l'arbre Flutter**.

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Text(
        'Hello',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  );
}
```

Il permet notamment d'accéder à :

- `Theme`

- `MediaQuery`

- `Navigator`

- `ScaffoldMessenger`

- Providers/Riverpod selon l'architecture

**Use when:** tu dois accéder à quelque chose provenant de l'arbre des widgets.

---

# 11. Layout : `Padding`

Ajoute de l'espace **à l'intérieur** autour d'un widget.

```dart
Padding(
  padding: const EdgeInsets.all(16),
  child: Text('Hello'),
)
```

**Use when:** créer de l'espace autour du contenu.

---

# 12. `Expanded`

Prend **tout l'espace disponible** dans un `Row` ou `Column`.

```dart
Row(
  children: [
    const Icon(Icons.search),
    Expanded(
      child: TextField(),
    ),
  ],
)
```

**Use when:** un élément doit occuper l'espace restant.

---

# 13. `Flexible`

Permet à un widget de prendre de l'espace disponible **sans l'imposer autant qu'`Expanded`**.

```dart
Row(
  children: [
    Flexible(
      child: Text(
        'Very long text that may need to wrap',
      ),
    ),
  ],
)
```

**Use when:** le contenu peut être plus petit ou s'adapter à l'espace disponible.

### `Expanded` vs `Flexible`

```text
Expanded  → doit remplir l'espace disponible
Flexible  → peut utiliser l'espace disponible
```

---

# Mini mental model

```text
Screen
 └── Scaffold
      ├── AppBar
      └── Body
           └── Padding
                └── Column / Row
                     ├── Text
                     ├── TextField
                     ├── Button
                     └── Expanded / Flexible
```

### À retenir

| Widget            | Rôle                             |
| ----------------- | -------------------------------- |
| `StatelessWidget` | UI sans état local mutable       |
| `StatefulWidget`  | UI avec état mutable             |
| `Scaffold`        | Structure d'un écran             |
| `Column`          | Layout vertical                  |
| `Row`             | Layout horizontal                |
| `Container`       | Taille + décoration + espacement |
| `ListView`        | Liste scrollable                 |
| `Form`            | Gestion/validation de formulaire |
| `TextField`       | Saisie utilisateur               |
| `Button`          | Action utilisateur               |
| `Navigator`       | Navigation                       |
| `BuildContext`    | Position/contexte dans l'arbre   |
| `Padding`         | Espacement autour du contenu     |
| `Expanded`        | Remplit l'espace disponible      |
| `Flexible`        | S'adapte à l'espace disponible   |
