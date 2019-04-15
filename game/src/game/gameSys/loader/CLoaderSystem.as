package game.gameSys.loader {
    import core.ecs.CSystem;
    
    import game.CAppFacade;
    
    import laya.net.Loader;
    import laya.utils.Handler;
    
    public class CLoaderSystem extends CSystem {
        public function CLoaderSystem(facade:CAppFacade) {
            super(facade);
        }
        
        override protected function _init():void{
            var urlArr:Array = [];
//            urlArr.push({url:"",type:Loader.ATLAS},
//                        {url:"",type:Loader.IMAGE});
            urlArr.push({url:"data/demo.csv",type:Loader.TEXT});
            Laya.loader.load(urlArr,new Handler(this,_assetsComplete));
        }
        
        private function _assetsComplete():void{
            facade.event(ELoaderSystemEvent.ASSETS_LOAD_COMPLETE);
        }
    }
}
