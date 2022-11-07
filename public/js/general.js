$('html, body').animate({ scrollTop: 0 }, 'fast');

$('body').bind('click','a',function(e){
	let evt = e || e.target, el = evt.target, rel = $(el).closest('a').attr('rel');
	if(rel === 'proveedores'){
		
	}else if(rel === 'Nuevo Registro'){
		
	}
});