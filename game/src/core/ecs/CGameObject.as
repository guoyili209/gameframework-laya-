package core.ecs {
    public class CGameObject {
        public function CGameObject() {
        }
        
        public function addComponent(comp:CComponent):void{
            if(_pComponentVec.indexOf(comp)>-1){
            
            }else{
                _pComponentVec.push(comp);
            }
        }
        
        public function removeComponent(cls:Class):void{
            for each(var comp:CComponent in _pComponentVec){
                if(comp is cls){
                    var index:int = _pComponentVec.indexOf(comp);
                    _pComponentVec.splice(index);
                }
            }
        }
        
        public function getComponent(cls:Class):CComponent{
            for each(var comp:CComponent in _pComponentVec){
                if(comp is cls){
                    return comp;
                }
            }
            return null;
        }
        
        private var _pComponentVec:Vector.<CComponent> = new Vector.<CComponent>();
    }
}
