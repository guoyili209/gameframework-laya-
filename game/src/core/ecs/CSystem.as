package core.ecs {
    import avmplus.getQualifiedClassName;
    
    import game.CAppFacade;
    
    import laya.events.EventDispatcher;
    
    use namespace dkm_framework;
    
    public class CSystem extends EventDispatcher{
        public function CSystem(facade:CAppFacade) {
            this.facade = facade;
            _init();
        }
        
        protected function _init():void{
            throw new Error("_init()没有被覆写:"+getQualifiedClassName(this));
        }
        
        public function get enable():Boolean{
            return _enable;
        }
        
        public function exit():void{
            throw new Error("exit()没有被覆写:"+getQualifiedClassName(this));
        }
        
        public function addBean(obj:*):void{
            pBeansArr.push(obj);
        }
        
        public function getBean(cls:*):*{
            var len:int = pBeansArr.length;
            for(var i:int=0;i<len;i++){
                var obj:* = pBeansArr[i];
                if(obj is cls){
                    return obj;
                }
            }
            return null;
        }
        
        public function update(deltaTime:Number):void{
        
        }
        
        dkm_framework function update():void{
        
        }
        
        private var _enable:Boolean = true;
        protected var pBeansArr:Array = [];
        public var facade:CAppFacade = null;
    }
}
