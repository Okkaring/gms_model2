/**
 * Member javaScript
 */
var app=(function(){
	var init=function(ctx){
		session.init(ctx);
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		location.href=ctx()+"/home.do";
	};
	var setContentView=function(){
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
	return {
		init : init
	};
})();

var main=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('.list-group-item a').eq(0).on('click',function(){
			controller.moveTo('member','member_add');
		});
		$('.list-group-item a').eq(1).on('click',function(){
			controller.list('member','member_list','1');
		});
		$('.list-group-item a').eq(2).on('click',function(){
			controller.detailStudent(prompt('조회ID'));
		});

		$('.list-group-item a').eq(3).on('click',function(){
			controller.moveTo('member','member_delete');
		});
	};
	var setContentView=function(){
		var $u1=$("#main_ul_stu");
		var $u2=$("#main_ul_grade");
		var $u3=$("#main_ul_board");
		
		$u1.addClass("list-group");
		$u2.addClass("list-group");
		$u3.addClass("list-group");
		
		$('.list-group').children().addClass("list-group-item");

	};
	return {
		init : init
	};
})();

var home=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
	};
	var setContentView=function(){};
	return {
		init : init
	};
})();

var navbar=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();
		$('#navbar').on('click',function(){
			alert('main으로 가시겠습니까?');
			controller.moveTo('common','main');
		});
		$('.dropdown-menu a').eq(0).on('click',function(){
			controller.moveTo('member','member_add');
		});
		$('.dropdown-menu a').eq(1).on('click',function(){
			controller.list('member','member_list','1');
		});
		$('.dropdown-menu a').eq(2).on('click',function(){
			controller.detailStudent(prompt('조회ID'));
		});
		$('.dropdown-menu a').eq(3).on('click',function(){
			controller.moveTo('member','member_delete');
		});
		$logout.on('click',function(){
			controller.logout('common','home');
		});
	};
	var setContentView=function(){
		var $u1 = $("#navbar_ul_stu");
		var $u2 = $("#navbar_ul_grade");
		var $u3 = $("#navbar_ul_board");
		var $logout = $("#logout");
		
		$u1.addClass("dropdown-menu");
		$u2.addClass("dropdown-menu");
		$u3.addClass("dropdown-menu");
	};
	return {
	init : init
	};
})();

var memberAdd=function(){
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	var birthday = document.getElementById("birthday").value;
  		if(id===""){
  			alert('ID를 입력해 주세요.');
  			return false;
  		}
  		if(pw===""){
  			alert('pw를 입력해 주세요.');
  			return false;
  		}
  		if(birthday===""){
  			alert('생일을 입력해 주세요.');
  			return false;
  		}
		var form = document.getElementById('join_form');
		form.setAttribute('action',app.ctx()+'/member.do');
		form.setAttribute('method','post');
		form.submit();
		return true;
	};
	
var memberDetail=(function(){
		var init=function(){
			onCreate();
		};
		var onCreate=function(){
			setContentView();
			$('#updateBtn').on('click',function(){
				
			sessionStorage.setItem('id',$('#stu_id').val());
			sessionStorage.setItem('phone',$('#stu_phone').val());
			sessionStorage.setItem('email',$('#stu_email').val());
			
			alert('Value: ' +'\n'+
				$('#stu_id').val() +'\n'+
				$('#stu_phone').val()+'\n'+
				$('#stu_email').val()+'\n'+
				$('#stu_title').val());
			controller.moveTo('member','member_update');
			});
		};
		var setContentView=function(){
			alert('memberDetail');
		};
		return {
			init : init
		};
	})();

var memberUpdate=(function(){
	var init=function(){
		onCreate();
	};
	var onCreate=function(){
		setContentView();

	};
	var setContentView=function(){
		var id =sessionStorage.getItem('id');
		var phone =sessionStorage.getItem('phone');
		var email =sessionStorage.getItem('email');
		var password =$('#confirm').val();
		$('#id').attr('placeholder',id);
		$('#phone').attr('placeholder',phone);
		$('#email').attr('placeholder',email);
		$('#confirmBtn').on('click',function(){
			alert('수정할 아이디: ' + id);
			controller.updateStudent(id,$('#email').val());
		});
	};
	return {
		init : init
	};
})();

var controller=(function(){
	var init=function(){
	};
	var moveTo=function(dir,page){
		location.href=app.ctx()+'/'+dir+'.do?action=move&page='+page;
	};
	var logout=function(ctx,page){
		alert("로그아웃");
		alert(app.ctx() +'////'+ctx);
		location.href=ctx+".do?action=logout&page="+page;
	};
	var deleteTarget=function(ctx){
		prompt(ctx+"의 id");
	};
	var list=function(dir,page,pageNumber){
		location.href=app.ctx()+"/"+dir+".do?action=list&page="+page+"&pageNumber="+pageNumber;
	};
	var findByName=function(){
		var search = document.getElementById('search').value;
		if(search===""){
			alert('검색어를 입력하세요.');
			return false;
		}
		alert('잘 봐 이것은 mbr_list / function: / findByName: '+ search);
		location.href=app.ctx()+"/member.do?action=search&page=member_list&search="+search;
		return true;
	};
	var updateStudent=function(id,email){
		alert('수정할 id : ' +id);
		location.href=app.ctx()+"/member.do?action=update&page=member_update&id="+id+"&email="+email;
	};
	var deleteStudent=function (id){
		alert('삭제할 id : ' + id);
		location.href=app.ctx()+"/member.do?action=delete&page=member_list&id="+id;
	};
	var detailStudent=function (id){
		alert('조회할 id : ' + id);
		location.href=app.ctx()+"/member.do?action=detail&page=member_detail&id="+id;
	};
    var studentInfo=function (){
  	  var id='id',
  	      id_val='${requestScope.student.id}',
  	      name='name',
  	      name_val='${requestScope.student.name}',
  	      email='email',
  	      email_val='${requestScope.student.email}'
  	      ;
  	  sessionStorage.setItem(id,id_val);    
  	  sessionStorage.setItem(name,name_val);    
  	  sessionStorage.setItem(email,email_val);    
    };
   
   
	return{
	init : init,
	moveTo : moveTo,
	logout : logout,
	deleteTarget : deleteTarget,
	list : list,
	findByName : findByName,
	updateStudent : updateStudent,
	deleteStudent : deleteStudent,
	detailStudent : detailStudent,
	studentInfo : studentInfo,
	memberAdd : memberAdd
	};
})();

