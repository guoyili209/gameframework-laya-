package game.uiSys.lobby {
    import core.ecs.CSystem;
    
    import game.uiSys.root.mvc.CUIView;
    
    public class CLobbyView extends CUIView {
        public function CLobbyView(sys:CSystem) {
            super(sys);
        }
        override protected function get assetsURL():Array{
            return [];
        }
    
        override protected function assetsComplete():void {
            super.assetsComplete();
            _init();
        }
        private function _init():void{
        
        }
    }
}
