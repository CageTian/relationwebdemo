
window.onload = function(){
    window.onscroll=function(){
        var top = document.documentElement.scrollTop || document.body.scrollTop;
        var menus = document.getElementById("menu").getElementsByTagName("a");
        var items=document.getElementById("content").getElementsByClassName("item");

        var currentId="";
        for(var i=0;i<items.length;i++){
            var _item=items[i];
            var _itemTop = _item.offsetTop;
            if(top>_itemTop - 200){
                currentId=_item.id;
            }else{
                break;
            }
        }
        if(currentId!=""){
            //给正确的menu下的a元素class赋值
            for(var j=0;j<menus.length;j++){
                var _menu=menus[j];
                var _href=_menu.href.split("#");//因为只通过href获取的链接为一长串链接，需要通过#分成数组
                if(_href[_href.length-1]!=currentId){
                    _menu.className = "";
                }else{
                    _menu.className = " current";
                }
            }
        }
    }
};
<!--搜索框定位-->
$(function(){
    // 监听滚动事件

    $(window).scroll(function(){
        // 获得div的高度

        var h = $("#item3").offset().top;
        if($(this).scrollTop()>h && $(this).scrollTop() < h+$("#item3").height()){
            // 滚动到指定位置
            $("#searchlocation").show();

        } else {
            $("#searchlocation").hide();
        }
    });

})
/**
 * Created by DELL on 2017/3/25.
 */
