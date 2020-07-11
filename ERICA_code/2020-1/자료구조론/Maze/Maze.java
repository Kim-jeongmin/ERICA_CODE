package Maze;
/*
 * CSE2010 Homework #4:
 * Problem 3: Maze
 *
 * Complete the code below.
 */

import java.util.Arrays;


public class Maze {
    private int numRows;
    private int numCols;

    private int[][] maze;
    private int[][] move = new int[][] {{1,0},{0,1},{-1,0},{0,-1}};
    private boolean[][] visited = null;

    private Location entry; // Entry Location
    private Location exit;  // Exit Location

    public Maze(int[][] maze, Location entry, Location exit) {

        this.maze = maze;
        numRows = maze.length;
        numCols = maze[0].length;
        visited = new boolean[numRows][numCols]; // initialized to false

        this.entry = entry;
        this.exit = exit;
    }

    public void printMaze() {

        System.out.println("Maze[" + numRows + "][" + numCols + "]");
        System.out.println("Entry index = (" + entry.row + ", " + entry.col + ")");
        System.out.println("Exit index = (" + exit.row + ", " + exit.col + ")" + "\n");

        for (int i = 0; i < numRows; i++) {
            System.out.println(Arrays.toString(maze[i]));
        }
        System.out.println();
    }

    public boolean findPath() {

        return moveTo(entry.row, entry.col);
    }
    private boolean moveTo(int row, int col) {
    	
        visited[row][col] = true;
        for(int i=0;i<4;i++) {
        	int r = row + move[i][0];
        	int c = col + move[i][1];
        	if(0<=r && r<numRows && 0<=c && c<numCols && visited[r][c] == false && maze[r][c] == 0) {
        		moveTo(r,c);
        	}
        }
        return visited[exit.row][exit.col];
    }

}