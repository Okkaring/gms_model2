/**
 * Member javaScript
 */
var app=(function(){
	var init=function(ctx){
		session.init(ctx);
		member.init();
		onCreate();
	};
	var ctx=function(){
		return session.getPath('ctx');
	};
	var js=function(){
		return session.getPath('js');
	};
	var img=function(){
		return session.getPath('img');
	};
	var css=function(){
		return session.getPath('css');
	};
	var setContentView=function(){

	};
	var onCreate=function(){
		setContentView();
		location.href=ctx()+"/home.do";
	};
	return {
		init : init,
		ctx : ctx,
		js : js,
		img : img,
		css : css
	};
})();

var session=(function(){
	var init=function(ctx){
		sessionStorage.setItem('ctx',ctx);
		sessionStorage.setItem('js',ctx+'/resources/js');
		sessionStorage.setItem('img',ctx+'/resources/img');
		sessionStorage.setItem('css',ctx+'/resources/css');
};
	var getPath=function(x){
		return sessionStorage.getItem(x);
	};
	return {
		init : init,
		getPath : getPath
	};
})();
var member=(function(){
	var init= function(){
		$('#loginBtn').on('click',function(){
		alert('로그인 fx 실행');
    	if($("#login_id").val()===""){
    		alert('ID를 입력해 주세요.');
    		return false;
    	}
    	if($("#login_pass").val()===""){
    		alert('pass를 입력해 주세요.');
    		return false;
    	}
    	$('#login_box').attr('action',app.ctx()+"/common.do");
    	$('#login_box').attr('method','post');
    	return true;
		});
	};
/*	var mainLoad=function(){
		var init=function(){};
	};*/
	
	return {
		init : init,
	};
})();