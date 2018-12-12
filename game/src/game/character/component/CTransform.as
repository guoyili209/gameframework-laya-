package game.character.component {
    import core.ecs.CComponent;
    
    public class CTransform extends CComponent {
        public function CTransform(x:Number=0,y:Number=0,z:Number=0) {
            super();
            this._x = x;
            this._y = y;
            this._z = z;
        }
        
        public function set x(value:Number):void{
            this._x = value;
        }
        
        public function set y(value:Number):void{
            this._y = value;
        }
        
        public function set z(value:Number):void{
            this._z = value;
        }
        
        public function get x():Number{
            return _x;
        }
        
        public function get y():Number{
            return _y;
        }
        
        public function get z():Number{
            return _z;
        }
        
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _z:Number = 0;
    }
}
