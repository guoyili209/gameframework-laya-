package game.scene {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    import game.enums.EComponentType;
    
    public class CSceneSystem extends CSystem{
        public function CSceneSystem(facade:CAppFacade){
            super(facade);
            _init();
        }
        
        public function _init():void{
//            for(var i:int = 0;i<_iEntityConut;i++){
//                _entity.push(EComponentType.NONE);
//            }
        }
        
        override public function exit():void{
        
        }
        
        override public function update(deltaTime:Number):void{
        
        }
        
        public function createRole():void{
            var entityIndex:int = _createEntity();
            //
        }
        
        private function _createEntity():int{
            for(var i:int=0;i<_iEntityConut;i++){
                if(_entity[i]==EComponentType.NONE){
                    return i;
                }
            }
            _entity.push(EComponentType.NONE);
            return _entity.length-1;
        }
        
        private var _iEntityConut:int = 100;
        private var _entity:Vector.<int> = null;
        
    }
}
