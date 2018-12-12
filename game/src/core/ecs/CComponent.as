package core.ecs {
    public class CComponent {
        public function CComponent() {
        }
        
        public function get owner():CGameObject{
            return _owner;
        }
        
        public function get enable():Boolean{
            return _enable;
        }
        public function set enable(value:Boolean):void{
            _enable = value;
        }
        
        private var _enable:Boolean = true;
        private var _owner:CGameObject = null;
    }
}
