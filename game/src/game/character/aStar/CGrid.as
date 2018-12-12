/**
 * Created by guoyili(guoyiligo@qq.com) on 2017/7/16.
 * Copyright (c) 2017 Yili Guo. All rights reserved.
 */
package game.character.aStar {
    public class CGrid {
        private var _startNode:CNode;
        private var _endNode:CNode;
        private var _nodes:Array;
        private var _numCols:int;
        private var _numRows:int;
        
        public function CGrid(numCols:int, numRows:int) {
            _numCols = numCols;
            _numRows = numRows;
            _nodes = new Array();
            
            for (var i:int = 0; i < _numCols; i++) {
                _nodes[i] = new Array();
                for (var j:int = 0; j < _numRows; j++) {
                    _nodes[i][j] = new CNode(i, j);
                }
            }
        }
        
        public function getNode(x:int, y:int):CNode {
            return _nodes[x][y] as CNode;
        }
        
        public function setEndNode(x:int, y:int):void {
            _endNode = _nodes[x][y] as CNode;
        }
        
        public function setStartNode(x:int, y:int):void {
            _startNode = _nodes[x][y] as CNode;
        }
        
        public function setWalkable(x:int, y:int, value:Boolean):void {
            _nodes[x][y].walkable = value;
        }
        
        public function get endNode():CNode {
            return _endNode;
        }
        
        public function get startNode():CNode {
            return _startNode;
        }
        
        //列
        public function get numCols():int {
            return _numCols;
        }
        
        //行
        public function get numRows():int {
            return _numRows;
        }
        
        public function get nodes():Array {
            return this._nodes;
        }
        
        
    }
}
