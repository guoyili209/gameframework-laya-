package game {
    import core.IBundleSystem;
    import core.ecs.CSystem;
    import core.socket.CCustomSocket;
    
    import game.loader.CLoaderSystem;
    import game.loader.ELoaderSystemEvent;
    
    import game.scene.CSceneSystem;
    import game.table.CTableBaseSystem;
    import game.ui.CUISystem;
    
    import laya.events.EventDispatcher;
    import laya.utils.Dictionary;
    
    public class CAppFacade extends EventDispatcher{
        public var bPause:Boolean = true;
        public var appStage:CAppStage = null;
        public var socket:CCustomSocket = null;
        
        public function CAppFacade() {
            _systemVec = new Vector.<CSystem>();
            _systemTagDic = new Dictionary();
            appStage = new CAppStage();
            socket = new CCustomSocket();
            
            _addEvent();
        }
        
        private function _addEvent():void{
            this.on(ELoaderSystemEvent.ASSETS_LOAD_COMPLETE,this,_initGameSystem);
        }
        
        public function initSystem():void{
            addSystem(new CLoaderSystem(this));
        }
        
        private function _initGameSystem():void{
            addSystem(new CTableBaseSystem(this));
            addSystem(new CSceneSystem(this));
            addSystem(new CUISystem(this));
    
            for each(var sys:* in _systemVec){
                if(sys is IBundleSystem){
                    var tag:String = IBundleSystem(sys).systemTag;
                    _systemTagDic[tag] = sys;
                }
            }
        }
        
        private function addSystem(sys:CSystem):void{
            _systemVec.push(sys);
        }
        
        public function getSystem(cls:Class):CSystem{
            for each(var obj:CSystem in _systemVec){
                if(obj is cls){
                    return obj
                }
            }
            return obj;
        }
        
        public function activateSystemByTag(sysTag:String,bool:Boolean):void{
            var system:IBundleSystem = _systemTagDic.get(sysTag) as IBundleSystem;
            if(system)
            {
                system.setActivated(bool);
            }else{
                console.log("sysTag:"+sysTag+"不存在");
            }
        }
        
        public function update(deltaTime:Number):void{
            for each(var sys:CSystem in _systemVec){
                if(sys.enable){
                    sys.update(deltaTime);
                }
            }
        }
        
        private var _systemVec:Vector.<CSystem> = null;
        private var _systemTagDic:Dictionary = null;
    }
}
