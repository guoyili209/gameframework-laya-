package game {
    import game.uiSys.root.mvc.CUIView;
    
    public class CRecordUIViewState {
        public function CRecordUIViewState() {
            _pViewVec = new Vector.<CUIView>();
        }
        
        public function addView(view:CUIView):void{
            _pViewVec.push(view);
        }
        
        public function removeView():void{
            var view:CUIView = _pViewVec.pop();
            if(view){
                view.closeView();
                var index:int = _pViewVec.indexOf(view);
                _pViewVec.splice(index,1);
            }else{
                //to do 隐藏返回按钮
            }
        }
        
        private var _pViewVec:Vector.<CUIView>;
    }
}
