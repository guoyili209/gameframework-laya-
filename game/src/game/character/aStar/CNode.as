/**
 * Created by guoyili(guoyiligo@qq.com) on 2017/7/15.
 * Copyright (c) 2017 Yili Guo. All rights reserved.
 */
package game.character.aStar {
    public class CNode {
        public var x:int;
        public var y:int;
        public var f:Number;
        public var g:Number;
        public var h:Number;
        public var walkable:Boolean = false;
        public var parent:CNode;
        public var costMultiplier:Number = 1;
        
        public function CNode(x:int, y:int) {
            this.x = x;
            this.y = y;
        }
    }
}
