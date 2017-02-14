function scrollToTop() {
	new Fx.Scroll(window).toElement(document.body);
}


function removeEmptyTabs() {
	$$('.details').each(function(el){
		if (el.get('html')=='') {
			$$('.nav_button').each(function(el2){
				var text = el.getProperty('id').substring(0,el.getProperty('id').length-8);
				if (el2.getProperty('section')==text) {
					el2.addClass('hide');
				}
			});
		}
	});
}
	
function zebra(cls) {
	var i=0;
	$$('.' + cls).each(function(el){
		if (!el.hasClass('hide')) {
			i++;
			el.removeClass('odd');
			el.removeClass('even');
			el.addClass(i%2==0 ? 'even' : 'odd');
		}
	});
}

function initSelections(tab, header) {
	$$('.filterList').addEvent('click', function(e){
		var id = this.getProperty('filter_id');
		var text = this.getProperty('header_text');
		
		$$('.filterList').removeClass('selected');
		this.addClass('selected');
		
		if (id != null) {
			$$('.list').each(function(el){
				if (el.getProperty('type_id')!=id) {
					//new Fx.Reveal(el).dissolve();
					el.addClass('hide');
				} else {
					//new Fx.Reveal(el).reveal();
					el.removeClass('hide');
				}
			});

			
			$$('.update_header').each(function(el){
				if (el.getProperty('type_id')!=id) {
					//new Fx.Reveal(el).dissolve();
					el.addClass('hide');
				} else {
					//new Fx.Reveal(el).reveal();
					el.removeClass('hide');
				}
			});
			
			$$('.services').each(function(el){
				if (el.getProperty('type_id')!=id) {
					//new Fx.Reveal(el).dissolve();
					//el.addClass('hide');
				} else {
					//new Fx.Reveal(el).reveal();
					el.removeClass('hide');
				}
			});
			
			if ($('header_genre')) {
				//new Fx.Reveal($("header_genre")).reveal();
				$('header_genre').removeClass('hide');
				$('header_genre').set('html',text);
			}
			
			/*
			$$('.nav_button').each(function(el){
				if (el.getProperty('section')==tab) {
					el.set('html', text);
				}
			});
			*/
		} else {
			//show all
			$$('.nav_button').each(function(el){
				if (el.getProperty('section')==tab) {
					el.set('html', 'All');
				}
			});
			
			$$('.list').each(function(el){
				//new Fx.Reveal(el).reveal();
				el.removeClass('hide');
			});
			
			if (header==true) {
				$$('.update_header').each(function(el){
					//new Fx.Reveal(el).reveal();
					el.removeClass('hide');
				});
				//$$('.update_header').removeClass('hide');
			} else {
				$$('.update_header').each(function(el){
					//new Fx.Reveal(el).dissolve();
					el.addClass('hide');
				});
				//$$('.update_header').addClass('hide');
				if ($('header_genre')) {
					//new Fx.Reveal($('header_genre')).reveal();
					$('header_genre').removeClass('hide');
				}
			}
			
			//$$('.services').removeClass('hide');
			$$('.services').each(function(el){
				//new Fx.Reveal(el).reveal();
				el.removeClass('hide');
			});
		}
		
	});
	
	$$('.filterList.all').addClass('selected');
}

function toggleElement(e,f) {
	
	if (e) {
		new Fx.Reveal(e).toggle().chain(function() {
			if (f) f.focus();
		});
		//if (f) f.focus();
		/*
		if (!e.hasClass('hide')) {
			//e.removeClass('hide');
			if (f) f.focus();
		} else {
			//e.addClass('hide');
		}
		*/
	}
}

	
function initMap(address) {
	var latlng;
	
	if (address) {
		
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({'address': address}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				latlng = results[0].geometry.location;
				
				var myOptions = {
				  zoom: 15,
				  center: latlng,
				  mapTypeId: google.maps.MapTypeId.ROADMAP
				}
				
				map = new google.maps.Map($("map_canvas"), myOptions);
				
				//map.setCenter(results[0].geometry.location);
				
				var marker = new google.maps.Marker({
					map: map, 
					position: results[0].geometry.location
				});
			}
		 });
	}

}

function showCalendar(type, id) {
	//type: b, v
	
	var cal = new StickyWin.Modal.Ajax({
		content: 'Loading...',
		url: 'dmw/ajax/calendar.php?type=' + type + '&id=' + id,
		destroyOnClose: true,
		requestOptions: 'post',
		onDisplay: function(){
			var c = this;
			$('calendar_month_previous').addEvent('click', function(e){
				var year = $(this).getProperty('year');
				var month = $(this).getProperty('month');
				$('calendar_days').setStyles({
					width: $('calendar_days').getWidth(),
					height: $('calendar_days').getHeight()-100,
					'text-align': 'center',
					'padding-top': '100px',
					color: '#666'
				});
				
				$('calendar_days').set('html', 'Loading...');
				c.update('dmw/ajax/calendar.php?type=' + type + '&id=' + id + '&year=' + year + '&month='  + month);
			});
			
			$('calendar_month_next').addEvent('click', function(e){
				var year = $(this).getProperty('year');
				var month = $(this).getProperty('month');
				$('calendar_days').setStyles({
					width: $('calendar_days').getWidth(),
					height: $('calendar_days').getHeight()-100,
					'text-align': 'center',
					'padding-top': '100px',
					color: '#666'
				});
				$('calendar_days').set('html', 'Loading...');
				c.update('dmw/ajax/calendar.php?type=' + type + '&id=' + id + '&year=' + year + '&month='  + month);
			});
		}
	});
	
	cal.setContent('<div style="-moz-border-radius: 10px; -webkit-border-radius: 10px; background: white; padding: 30px; color: #666; font-weight: bold;">Loading...</div>');
	cal.show();

	cal.update();
	
}

function initNavButtons(callback) {
		$$('.nav_button').addEvent('mouseover', function(e){
			this.addClass('nav_button_over');
		});
		
		$$('.nav_button').addEvent('mouseout', function(e){
			this.removeClass('nav_button_over');
		});
		
		$$('.nav_button').addEvent('click', function(e){
			if (callback) this.callback = callback;
			
		showDetails(this.getProperty('section'), this);
			/*
			if (this.getProperty('section')=='all') {
				$('profile_header').removeClass('hide');
				$('profile_details').removeClass('hide');
			} else {
				$('profile_header').addClass('hide');
				$('profile_details').addClass('hide');
			}
			*/
		});
	}
	
function showDetails(section, clicked) {
	$$('.details').each(function(el){
		if (section + '_content' == el.id) {
			el.removeClass('hide');
			clicked.removeClass('nav_button_not_selected');
			selected_section = section;
		} else {
			el.addClass('hide');
			$$('.nav_button').each(function(el){
				if (el != clicked) el.addClass('nav_button_not_selected');
			});
		}
	});
}

function clearErrors(el) {
	if (el) {
		el.addClass('hide');
		el.removeClass('form_error');
		el.set('html', '');
	}
}

function showErrors(el, errors, icon) {
	el.removeClass('hide');
	
	el.set('html','');
	
	if (icon==false) {
		el.addClass('form_error_no_icon');
	} else {
		el.addClass('form_error');
	}
	
	errors = $splat(errors);
	errors.each(function(item, idx) {
		var el2 = new Element('div', {
			html: item
		});
		
		el2.inject(el);
	});
	
	new Fx.Scroll(window).toElement(el);
}
	
function initLists() {
	var id = '';
	
	$$('.list').addEvent('click', function(e){
		if (id = this.getProperty('gig_id')) {
			//gigs
			window.location = 'index.php?id=gig&gig_id=' + id;
		} else if (id = this.getProperty('band_id')) {
			//bands
			window.location = 'index.php?id=band&band_id=' + id;
		} else if (id = this.getProperty('venue_id')) {
			//venues
			window.location = 'index.php?id=venue&venue_id=' + id;
		} else if (id = this.getProperty('service_id')) {
			//services

			window.location = 'index.php?id=service&service_id=' + id;
		}
	});
}
	
function initSidePhotos() {
	$$('.side_photo').addEvents({
		'mouseover': function(e){
			$(this).getChildren('div').removeClass('hide');
		},
		'mouseout': function(e){
			$(this).getChildren('div').addClass('hide');
		},
		'click': function(e){
		window.location = $(this).getProperty('url');
		}
	});
}