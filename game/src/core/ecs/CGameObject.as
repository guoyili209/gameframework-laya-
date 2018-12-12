package core.ecs {
    import core.ecs.CComponent;
    
    public class CGameObject {
        public function CGameObject() {
        }
        
        public function addComponent(comp:CComponent):void{
           _pComponentVec.push(comp);
        }
        
        public function removeComponent():void{
        
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
