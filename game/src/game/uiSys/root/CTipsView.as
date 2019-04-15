package game.uiSys.root {
    import core.ecs.CSystem;
    import core.mvc.CView;
    
    public class CTipsView extends CView {
        public static const WARNING:int = 0;
        public static const NORMAL:int = 1;
        
        public function CTipsView(sys:CSystem) {
            super(sys);
        }
    }
}
