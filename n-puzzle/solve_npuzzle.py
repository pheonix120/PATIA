
from npuzzle import (Solution,
                     State,
                     Move,
                     UP, 
                     DOWN, 
                     LEFT, 
                     RIGHT,
                     create_goal,
                     get_children,
                     is_goal,
                     is_solution,
                     load_puzzle,
                     make_move,
                     to_string)
from node import Node
from typing import Literal, List
import argparse
import math
import time
from queue import PriorityQueue, Queue
import heapq

BFS = 'bfs'
DFS = 'dfs'
ASTAR = 'astar'
IDDFS = 'iddfs'

def valid_moves(state : State, dimension : int) -> List[Move] | None:
    if state: 
        list_moves=[]    
        pos_list_vide =  state.index(0)
        x = pos_list_vide//dimension
        y = pos_list_vide%dimension
        
        if (x>= 0 and x<= dimension and (y-1)>= 0 and (y-1)<= dimension):
            list_moves.append(UP)
        if (x>= 0 and x<= dimension and (y+1)>= 0 and (y+1)<= dimension):
            list_moves.append(DOWN)
        if ((x-1)>= 0 and (x-1)<= dimension and y>= 0 and y<= dimension):
            list_moves.append(LEFT)
        if ((x+1)>= 0 and (x+1)<= dimension and y>= 0 and y<= dimension):
            list_moves.append(RIGHT)
        return list_moves
               
    else:
        return None


def solve_bfs(open : List[Node]) -> Solution:
    '''Solve the puzzle using the BFS algorithm'''

    root = open[0]
    queue = Queue(maxsize=0)
    queue.put(root)
    dimension = int(math.sqrt(len(root.state)))
    explored = {to_string(root.state): True}
    while (not queue.empty()):
        vertice = queue.get()
        if (is_solution(root.get_state(),vertice.get_path())):
            return vertice.get_path()
        for c in get_children(vertice.state,[LEFT,UP,DOWN,RIGHT],dimension):
            if(not (to_string(c[0]) in explored)):
                explored[to_string(c[0])] = True
                child_vertice = Node(c[0],c[1],0,0,vertice)               
                queue.put(child_vertice)
    print("pas de solution")
    



def solve_dfs(open : List[Node]) -> Solution:
    '''Solve the puzzle using the DFS algorithm'''

    root = open[0]
    stack =[]
    stack.append(root)
    explored = dict()
    dimension = int(math.sqrt(len(root.state)))

    while(stack.count != 0):
        vertice = stack.pop()
        if (is_solution(root.get_state(),vertice.get_path())):
            return vertice.get_path()
        if (not(to_string(vertice.state) in explored)):
            explored[to_string(vertice.state)] = True
        for c in (get_children(vertice.state,[LEFT,UP,DOWN,RIGHT],dimension)):            
            if (not(to_string(c[0]) in explored)):                
                child_vertice = Node(c[0],c[1],0,0,vertice)
                stack.append(child_vertice)
            
        
  

def solve_astar(open : List[Node]) -> Solution:
    '''Solve the puzzle using the A* algorithm'''
    closed_vertices = []

    dimension = int(math.sqrt(len(open[0].state)))

    open_vertices = PriorityQueue()   
    counter = 0;    
    start_vertice = open[0]
    goal_state = create_goal(dimension)    
    start_vertice.cost = 0
    start_vertice.heuristic = heuristic(start_vertice.state,goal_state)
    start_vertice.cost += start_vertice.heuristic
    open_vertices.put((start_vertice.cost,counter,start_vertice))
    while (open_vertices):
        counter+=1
        j,k ,current_vertice = open_vertices.get()
        closed_vertices.append(current_vertice)
        if (is_goal(current_vertice.state,goal_state)):
            return current_vertice.get_path()
        for c in get_children(current_vertice.state,[LEFT,UP,DOWN,RIGHT],dimension):
            child_vertice = Node(c[0],c[1],9999,9999,None)
            counter+=1
            if child_vertice not in (open_vertices and closed_vertices):          
                current_cost = 1 + current_vertice.cost
                if (current_cost < child_vertice.cost):
                    child_vertice.parent = current_vertice                
                    child_vertice.heuristic = heuristic(child_vertice.state,goal_state)
                    child_vertice.cost =  current_cost + child_vertice.heuristic
                    open_vertices.put((child_vertice.cost,counter,child_vertice))
    print("Pas de solution en astar")            
    return None        
           


def heuristic(current_state : State, goal_state : State) -> int:
    '''Calculate the Manhattan distance of the puzzle'''
    cost = 0
    dimension = int(math.sqrt(len(current_state)))    
    for i in range (len(current_state)):
        cx = i%dimension
        cy = i//dimension
        gx = current_state[i]%dimension
        gy = current_state[i]//dimension
        cost += abs(gx -cx) + abs(gy-cy)
    
    return cost

def depth_limited_search(node: Node, limit: int, goal_state: State, moves: List[Move], dimension: int) -> Solution | None:
    '''Perform a depth-limited search'''
    
    # Todo: implement depth-limited search
    pass

def solve_iddfs(root: Node, max_depth: int) -> Solution:
    '''Solve the puzzle using the Iterative Deepening Depth-First Search algorithm'''
    
    # Todo: implement IDDFS algorithm
    pass

def main():
    parser = argparse.ArgumentParser(description='Load an n-puzzle and solve it.')
    parser.add_argument('filename', type=str, help='File name of the puzzle')
    parser.add_argument('-a', '--algo', type=str, choices=['bfs', 'dfs', 'astar', 'iddfs'], required=True, help='Algorithm to solve the puzzle')
    parser.add_argument('-v', '--verbose', action='store_true', help='Increase output verbosity')
    parser.add_argument('-d', '--max_depth', type=int, default=100, help='Maximum depth for IDDFS')
    
    args = parser.parse_args()
    
    puzzle = load_puzzle(args.filename)
    
    if args.verbose:
        print('Puzzle:\n')
        print(to_string(puzzle))
    
    if not is_goal(puzzle, create_goal(int(math.sqrt(len(puzzle))))):   
         
        root = Node(state = puzzle, move = None)
        open = [root]
        
        if args.algo == BFS:
            print('BFS\n')
            start_time = time.time()
            solution = solve_bfs(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
        elif args.algo == DFS:
            print('DFS\n')
            start_time = time.time()
            solution = solve_dfs(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
            else:
                print('No solution')
        elif args.algo == ASTAR:
            print('A*')
            start_time = time.time()
            solution = solve_astar(open)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)
        elif args.algo == IDDFS:
            print('IDDFS')
            start_time = time.time()
            solution = solve_iddfs(root, args.max_depth)
            duration = time.time() - start_time
            if solution:
                print('Solution:', solution)
                print('Valid solution:', is_solution(puzzle, solution))
                print('Duration:', duration)        
            else:
                print('No solution')
    else:
        print('Puzzle is already solved')
    
if __name__ == '__main__':
    main()