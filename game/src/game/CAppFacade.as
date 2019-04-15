package game {
    import core.IBundleSystem;
    import core.ecs.CSystem;
    import core.socket.CCustomSocket;
    
    import game.gameSys.loader.CLoaderSystem;
    import game.gameSys.loader.ELoaderSystemEvent;
    import game.gameSys.log.CLogSystem;
    
    import game.gameSys.scene.CSceneSystem;
    import game.gameSys.table.CTableBaseSystem;
    import game.uiSys.root.CUISystem;
    
    import laya.events.EventDispatcher;
    import laya.utils.Dictionary;
    
    public class CAppFacade extends EventDispatcher{
        public var bPause:Boolean = true;
        private var _appStage:CAppStage = null;
        private var _socket:CCustomSocket = null;
        private var _recordView:CRecordUIViewState = null;
        
        public function get recordView():CRecordUIViewState{
            return _recordView;
        }
        public function get appStage():CAppStage{
            return _appStage;
        }
        public function get socket():CCustomSocket{
            return _socket;
        }
        public function CAppFacade() {
            _systemVec = new Vector.<CSystem>();
            _systemTagDic = new Dictionary();
            _appStage = new CAppStage();
            _socket = new CCustomSocket();
            _recordView = new CRecordUIViewState();
            _addEvent();
        }
        public function initSystem():void{
            addSystem(new CLoaderSystem(this));
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
        private function _initGameSystem():void{
            addSystem(new CLogSystem(this));
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
        private function _addEvent():void{
            this.on(ELoaderSystemEvent.ASSETS_LOAD_COMPLETE,this,_initGameSystem);
        }
        private function addSystem(sys:CSystem):void{
            _systemVec.push(sys);
        }
        private var _systemVec:Vector.<CSystem> = null;
        private var _systemTagDic:Dictionary = null;
    }
}
