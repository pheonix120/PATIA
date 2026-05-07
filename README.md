# Planification Automatique et Intelligence Artificielle 2026

## Recherche dans un espace d'états 

### Jeu de Taquin

Le code du jeu de Taquin se trouve dans le dossier n-puzzle
Les exemples de puzzles sont dans le dossier *n-puzzle/puzzles*
Pour lancer une résolution de puzzle, taper dans la ligne de commande :
*python3 /solve_npuzzle.py -a ['bfs', 'dfs', 'astar']*
Les algorithmes de recherche qui marchent sont *'bfs', 'dfs', 'astar'*. J'ai essayé de réimplémenter IDDFS, mais il ne marche pas, je n'ai pas eu le temps de le refaire. 

Un etat solution est de la forme *0 1 2 3 4 5 6 7 8* pour un taquin 3x3.
Le déplacement se fait en fonction de la case 0 qui représente la case vide dans le vrai jeu.
Il y a 4 déplacements :
*UP, LEFT, DOWN, RIGHT*
*UP* déplace la case 0 vers le haut donc en y-1
*LEFT* déplace la case 0 vers la gauche donc en x-1
*DOWN* déplace la case 0 vers le bas donc en y+1
*RIGHT* déplace la case 0 vers la droite donc en x+1
Pour vérifier si un mouvement est valable, j'utilise une représentation 2D d'une liste de int représentation mon état actuel et je calcule si la nouvelle position après un mouvement n'est pas en dehors des limites.

Cf *n-puzzle/npuzzle.py*, fonction *make_move()*
                            
Pour l'algorithme astar j'ai utilisé une heuristique avec la distance de manhattan pour déterminer la distance de chaque case vers leur position de goal.
Une courbe de comparaison des performances des algorithmes se trouve dans le fichier pdf dans le dossier n-puzzles. 

### Langage PDDL

Tour de Hanoi
Les fichiers de domaine et de problème se trouvent dans le dossier pddl/hanoi
Jeu de Taquin
Les fichiers de domaine et de problème se trouvent dans le dossier pddl/npuzzle

Pour lancer un test, tapez dans la ligne de commande :
*./pddl4j.sh*
Puis suivre les instructions.

Pour la modélisation du taquin avec le langage PDDL, j'ai choisi de ne plus déplacer la case 0, mais les autres cases, car c'était plus facile pour se repérer et à débugger.
L'état solution est changé pour *1 2 3 4 5 6 7 8 0* pour un taquin 3x3

### Sokoban
Les fichiers de domaine et de problème se trouvent dans le dossier pddl/test_sokoban
Je n'ai pas réussi à refaire le parser de niveau sokoban. Il y a un début de code dans *pddl/sokoban/src/main/java/sokoban/SokobanMain.java*, mais il ne marche pas, je n'ai pas eu le temps de tout recommencer.
