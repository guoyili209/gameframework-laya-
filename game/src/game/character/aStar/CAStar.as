/**
 * Created by guoyili(guoyiligo@qq.com) on 2017/7/15.
 * Copyright (c) 2017 Yili Guo. All rights reserved.
 */
package game.character.aStar {
    /**
     * A*寻路类
     * 1、取开始节点和结束节点；
     * 2、将开始节点周围可以行走的节点放入待查列表；
     * 3、取出待查列表中，代价最小的节点作为下一个检测的节点，将开始节点设置为其父节点，并将开始节点放入已查列表；
     * 4、循环2、3步；
     * 5、根据已查列表中节点的父节点进行反转操作，得出路径列表；
     *
     * */
    public class CAStar {
        private var _open:Array;
        private var _closed:Array;
        private var _endNode:CNode;
        private var _startNode:CNode;
        private var _path:Array;
//	private var _heuristic:Function = manhattan;
//	private var _heuristic:Function = euclidian;
        private var _heuristic:Function = diagonal;
        private var _straightCost:Number = 1.0;
        private var _diagCost:Number = Math.SQRT2;
        /**模拟导航网格*/
        private var _gride:CGrid = null;
        
        public function CAStar() {
        }
        
        public function findPath(grid:CGrid):Boolean {
            _gride = grid;
            _open = new Array();
            _closed = new Array();
            _startNode = _gride.startNode;
            _endNode = _gride.endNode;
            _startNode.g = 0;
            _startNode.h = _heuristic(_startNode);
            _startNode.f = _startNode.g + _startNode.h;
            
            return search();
        }
        
        private function search():Boolean {
            var node:CNode = _startNode;
            while (node != _endNode) {
                var startX:int = Math.max(0, node.x - 1);
                var endX:int = Math.min(_gride.numCols - 1, node.x + 1);
                var startY:int = Math.max(0, node.y - 1);
                var endY:int = Math.min(_gride.numRows - 1, node.y + 1);
                
                for (var i:int = startX; i <= endX; i++) {
                    for (var j:int = startY; j <= endY; j++) {
                        var test:CNode = _gride.getNode(i, j);
                        if (test == node || !test.walkable ||
                                !_gride.getNode(node.x, test.y).walkable ||
                                !_gride.getNode(test.x, node.y).walkable) {
                            continue;
                        }
                        var cost:Number = _straightCost;
                        if (!((node.x == test.x) || (node.y == test.y))) {
                            cost = _diagCost;
                        }
                        var g:Number = node.g + (cost * test.costMultiplier);
                        var h:Number = _heuristic(test);
                        var f:Number = g + h;
                        if (_isOpen(test) || _isClosed(test)) {
                            if (test.f > f) {
                                test.f = f;
                                test.g = g;
                                test.h = h;
                                test.parent = node;
                            }
                        } else {
                            test.f = f;
                            test.g = g;
                            test.h = h;
                            test.parent = node;
                            _open.push(test);
                        }
                    }
                }
                _closed.push(node);
                if (_open.length == 0) {
                    trace("no path found");
                    return false;
                }
                _open.sortOn("f", Array.NUMERIC);
                node = _open.shift() as CNode;
            }
            buildPath();
            return true;
        }
        
        private function buildPath():void {
            _path = new Array();
            var node:CNode = _endNode;
            _path.push(node);
            while (node != _startNode) {
                node = node.parent;
                _path.unshift(node);
            }
        }
        
        public function get path():Array {
            return _path;
        }
        
        private function _isOpen(node:CNode):Boolean {
            for (var i:int = 0; i < _open.length; i++) {
                if (_open[i] == node) {
                    return true;
                }
            }
            return false;
        }
        
        private function _isClosed(node:CNode):Boolean {
            for (var i:int = 0; i < _closed.length; i++) {
                if (_closed[i] == node) {
                    return true;
                }
            }
            return false;
        }
        
        //曼哈顿
        private function manhattan(node:CNode):Number {
            return Math.abs(node.x - _endNode.x) * _straightCost + Math.abs(node.y - _endNode.y) * _straightCost;
        }
        
        //欧几里得
        private function euclidian(node:CNode):Number {
            var dx:Number = node.x - _endNode.x;
            var dy:Number = node.y - _endNode.y;
            return Math.sqrt(dx * dx + dy * dy) * _straightCost;
        }
        
        //对角
        private function diagonal(node:CNode):Number {
            var dx:Number = Math.abs(node.x - _endNode.x);
            var dy:Number = Math.abs(node.y - _endNode.y);
            var diag:Number = Math.min(dx, dy);
            var straight:Number = dx + dy;
            return _diagCost * diag + _straightCost * (straight - 2 * diag);
        }
        
        public function get visited():Array {
            return _closed.concat(_open);
        }
    }
}
